package com.answeris.web;

import java.util.List;

public class Partner {
	private String num;
	private String id;
	private String pwd;
	private String email;
	private String intro;
	private String pro_img;
	private String type;
	private String manager;
	private String company;
	private String ceo;
	private String sul_date;
	private String ye_name;
	private String account;
	private String last_addr;
	
	private List<String> skills;
	
	public Partner(String num, String id, String intro, String pro_img, String type, String manager) {
		super();
		this.num = num;
		this.id = id;
		this.intro = intro;
		this.pro_img = pro_img;
		this.type = type;
		this.manager = manager;
	}

	public Partner() {	}
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getPro_img() {
		return pro_img;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getSul_date() {
		return sul_date;
	}

	public void setSul_date(String sul_date) {
		this.sul_date = sul_date;
	}

	public String getYe_name() {
		return ye_name;
	}

	public void setYe_name(String ye_name) {
		this.ye_name = ye_name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getLast_addr() {
		return last_addr;
	}

	public void setLast_addr(String last_addr) {
		this.last_addr = last_addr;
	}

	public Partner(String id, String pwd, String email, String intro, String pro_img, String type, String manager,
			String company, String ceo, String sul_date, String ye_name, String account, String last_addr) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.intro = intro;
		this.pro_img = pro_img;
		this.type = type;
		this.manager = manager;
		this.company = company;
		this.ceo = ceo;
		this.sul_date = sul_date;
		this.ye_name = ye_name;
		this.account = account;
		this.last_addr = last_addr;
	}

	@Override
	public String toString() {
		return "Partner [num=" + num + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", intro=" + intro
				+ ", pro_img=" + pro_img + ", type=" + type + ", manager=" + manager + ", company=" + company + ", ceo="
				+ ceo + ", sul_date=" + sul_date + ", ye_name=" + ye_name + ", account=" + account + ", last_addr="
				+ last_addr + ", skills=" + skills + "]";
	}
	

}
