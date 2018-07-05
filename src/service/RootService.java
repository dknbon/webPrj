package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

import entity.Notice;

public class RootService {
	private String url;
	private String user;
	private String password;
	private String sql;
	private Connection con;
	private PreparedStatement st;
	private ResultSet rs;

	private List<Notice> list;

	
	public List<Notice> getNoticeList() throws ClassNotFoundException, SQLException {
		list = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##sist";
		password = "dclass";
		sql = "select * from notice";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
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
		
		return list;
	}
	
}