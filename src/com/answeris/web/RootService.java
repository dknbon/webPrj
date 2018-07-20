package com.answeris.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RootService {
	private String url;
	private String user;
	private String password;
	private String sql;
	private Connection con;
	private PreparedStatement st;
	private ResultSet rs;

	private List<Partner> list;
	private List<String> skillList;

	public List<Partner> getNoticeList(int page) throws ClassNotFoundException, SQLException {

		return getNoticeList("", "", page);
	}

	public List<Partner> getNoticeList(String field, String query, int page)
			throws ClassNotFoundException, SQLException {
		list = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select * from (select rownum num, p.* from partner p order by num desc) where type like ? and id like ? and num between ? and ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + field + "%");
		st.setString(2, "%" + query + "%");
		st.setInt(3, (page - 1) * 10 + 1);
		st.setInt(4, page * 10);

		rs = st.executeQuery();

		while (rs.next()) {
			Partner aa = new Partner(rs.getString("num"), rs.getString("ID"), rs.getString("intro"),
					rs.getString("pro_img"), rs.getString("type"), rs.getString("manager"));
			list.add(aa);

		}

		rs.close();
		st.close();
		con.close();
		return list;
	}

	public int getNoticeCount(String field, String query) throws ClassNotFoundException, SQLException {

		int count = 0;

		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select count(num) num from (select rownum num, p.* from partner p order by num desc) where type like ? and id like ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + field + "%");
		st.setString(2, "%" + query + "%");

		rs = st.executeQuery();
		rs.next();

		count = rs.getInt("num");
		rs.close();
		st.close();
		con.close();
		return count;
	}

	public Map<String, String> getEval(String query) throws ClassNotFoundException, SQLException {

		Map<String, String> map = new HashMap();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select count(rownum) count , avg(average) avg from eval where partner_id like ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + query + "%");

		rs = st.executeQuery();
		rs.next();
		
		map.put("count", rs.getString("count"));
		map.put("avg", rs.getString("avg"));

		rs.close();
		st.close();
		con.close();
		return map;
	}
	public int getPrjno(String query) throws ClassNotFoundException, SQLException {

		int count = 0;

		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select count(rownum) count from apply where partner_id like ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + query + "%");

		rs = st.executeQuery();
		rs.next();

		count = rs.getInt("count");
		rs.close();
		st.close();
		con.close();
		return count;
	}
	public int getPortfoliono(String query) throws ClassNotFoundException, SQLException {

		int count = 0;

		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select count(id) count from portfolio where partner_id like ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + query + "%");

		rs = st.executeQuery();
		rs.next();

		count = rs.getInt("count");
		rs.close();
		st.close();
		con.close();
		return count;
	}
	
public List<String> getSkilles(String query) throws ClassNotFoundException, SQLException {
		skillList = new ArrayList<>();
		url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
		user = "c##wapadmin";
		password = "2130admin";
		sql = "select sort from myskill where partner_id like ?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, user, password);
		st = con.prepareStatement(sql);
		st.setString(1, "%" + query + "%");

		rs = st.executeQuery();
		rs.next();

		rs.close();
		st.close();
		con.close();
		return skillList;
	}
}
