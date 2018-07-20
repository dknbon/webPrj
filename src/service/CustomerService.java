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

public class CustomerService {
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
	
	public Notice getNoticeDetail(long id) throws ClassNotFoundException, SQLException {
		Notice notice = null;
		list = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##sist";
		password = "dclass";
		sql = "select * from notice where id = "+id;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		rs = st.executeQuery();
		
		
		
		if(rs.next())
		{
			notice = new Notice(
									rs.getString("ID"), //아이디
									rs.getString("TITLE"), // 제목
									rs.getString("CONTENT"), //내용
									rs.getString("WRITER_ID"), //작성자 아이디
									rs.getDate("REG_DATE"), // 작성일
									rs.getInt("HIT")); // 조회수
			rs.close();
			st.close();
			con.close();		
			return notice;
			
		}
		

		return null;
	}

	public void insertNotice(Notice notice) throws ClassNotFoundException, SQLException {
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##sist";
		password = "dclass";
		sql = "insert into notice(id,title,content,writer_id) values((select NVL(max(to_number(id)),0)+1 id from notice),?,?,?)";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, notice.getTitle());
		st.setString(2, notice.getContent());
		st.setString(3, notice.getWriterId());

		st.executeUpdate();

		st.close();
		con.close();	
		}	
}
		
	

