package com.answeris.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Notice;

public class ProjectList {
	private String url;
	private String user;
	private String password;
	private String sql;
	private Connection con;
	private PreparedStatement st;
	private ResultSet rs;

	private List<Notice> list;

	
	public List<Notice> getNoticeList(int page) throws ClassNotFoundException, SQLException {

		return getNoticeList("title","",page);
	}
	
	public List<Notice> getNoticeList(String field, String query, int page) throws ClassNotFoundException, SQLException {
		list = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##sist";
		password = "dclass";
		sql = "select * from \n" + 
				"(select rownum num, n.* from \n" + 
				"(select * from notice where "+field+" like ? order by reg_date desc)n)\n" + 
				"where num between ? and ?";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%"+query+"%");
		st.setInt(2, (page-1)*10+1);
		st.setInt(3, page*10);
		
		rs = st.executeQuery();
		
		
		
		while(rs.next())
		{
			Notice aa = new Notice(
									rs.getString("ID"),
									rs.getString("TITLE"),
									rs.getString("CONTENT"),
									rs.getString("WRITER_ID"),
									rs.getDate("REG_DATE"),
									rs.getInt("HIT"));
			list.add(aa);
			
		}
		
		rs.close();
		st.close();
		con.close();
		return list;
	}
	
	public int getNoticeCount(String field, String query) throws ClassNotFoundException, SQLException {
		
		int count = 0;
		
		list = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##sist";
		password = "dclass";
		sql = "select count(id) count from notice where " + field + " like ? " ;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println(sql);
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);	
		st.setString(1, "%"+query+"%");
		
		rs = st.executeQuery();
		rs.next();
		
		count = rs.getInt("count");
		rs.close();
		st.close();
		con.close();
		return count;
	}
	

}
