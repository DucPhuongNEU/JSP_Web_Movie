package model.entity;

public class Comments {
	private int idcomment;
	private int idmovie;
	private String username;
	private String content;
	
	public Comments() {
		
	}

	public Comments(int idcomment, int idmovie, String username, String content) {
		super();
		this.idcomment = idcomment;
		this.idmovie = idmovie;
		this.username = username;
		this.content = content;
	}

	public int getIdcomment() {
		return idcomment;
	}

	public void setIdcomment(int idcomment) {
		this.idcomment = idcomment;
	}

	public int getIdmovie() {
		return idmovie;
	}

	public void setIdmovie(int idmovie) {
		this.idmovie = idmovie;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
