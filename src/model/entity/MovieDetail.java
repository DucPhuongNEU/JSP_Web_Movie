package model.entity;

public class MovieDetail {
	private int idmoviedetail;
	private int id;
	private String episode;
	private String episodename;
	private String episodelink;
	public MovieDetail() {
	}
	public MovieDetail(int idmoviedetail, int id, String episode, String episodename, String episodelink) {
		super();
		this.idmoviedetail = idmoviedetail;
		this.id = id;
		this.episode = episode;
		this.episodename = episodename;
		this.episodelink = episodelink;
	}
	public int getIdmoviedetail() {
		return idmoviedetail;
	}
	public void setIdmoviedetail(int idmoviedetail) {
		this.idmoviedetail = idmoviedetail;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEpisode() {
		return episode;
	}
	public void setEpisode(String episode) {
		this.episode = episode;
	}
	public String getEpisodename() {
		return episodename;
	}
	public void setEpisodename(String episodename) {
		this.episodename = episodename;
	}
	public String getEpisodelink() {
		return episodelink;
	}
	public void setEpisodelink(String episodelink) {
		this.episodelink = episodelink;
	}
	
}
