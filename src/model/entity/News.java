package model.entity;

import java.sql.Date;

public class News {
	private int idnews;
	private String title;
	private String image;
	private String content;
	private Date releasedate;
	private int view;
	
	public News() {
		
	}
	
	public News(int idnews, String title, String image, String content, Date releasedate, int view) {
		this.idnews = idnews;
		this.title = title;
		this.image = image;
		this.content = content;
		this.releasedate = releasedate;
		this.view = view;
	}

	public int getIdnews() {
		return idnews;
	}
	public void setIdnews(int idnews) {
		this.idnews = idnews;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(Date releasedate) {
		this.releasedate = releasedate;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	
	
	
}
