package model.entity;

public class Rating {
	private int idrating;
	private float valuerating;
	private int idmovie;
	private String username;
	
	public Rating() {
		
	}
	
	public Rating(int idrating, float valuerating, int idmovie, String username) {
		this.idrating = idrating;
		this.valuerating = valuerating;
		this.idmovie = idmovie;
		this.username = username;
	}

	public int getIdrating() {
		return idrating;
	}
	public void setIdrating(int idrating) {
		this.idrating = idrating;
	}
	public float getValuerating() {
		return valuerating;
	}
	public void setValuerating(float valuerating) {
		this.valuerating = valuerating;
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
	
	
}
