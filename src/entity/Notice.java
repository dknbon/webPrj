package entity;


import java.util.Date;

public class Notice {
	private String id;
	private String title;
	private String content;
	private String writerId;
	private Date regDate;
	private int hit;
	
	
	public Notice()
	{
		
	}

//for insert
	public Notice(String id, String title, String content, String writerId, Date regDate) {
		super();
		this.title = title;
		this.content = content;
		this.writerId = writerId;
	}
//for select
	public Notice(String id, String title, String content, String writerId, Date regDate, int hit) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writerId = writerId;
		this.regDate = regDate;
		this.hit = hit;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", title=" + title + ", content=" + content + ", writerId=" + writerId
				+ ", regDate=" + regDate + ", hit=" + hit + "]";
	}



	
	
}
