package model.entity;

public class Movie {
	private int id;
	private String title;
	private int season;
	private String author;
	private String country;
	private String movieType;
	private String genre;
	private int releaseDate;
	private int episode;
	private String status;
	private String description;
	private String img;
	private String imageLink;
	private int view = 0;
	private float rating = 0;
	
	public Movie(int id, String title, int season, String country, String movieType, String genre, int releaseDate,
			int episode, String status, String description, String img, String imageLink, int view, float rating) {
		this.id = id;
		this.title = title;
		this.season = season;
		this.country = country;
		this.movieType = movieType;
		this.genre = genre;
		this.releaseDate = releaseDate;
		this.episode = episode;
		this.status = status;
		this.description = description;
		this.img = img;
		this.imageLink = imageLink;
		this.view = view;
		this.rating = rating;
	}
	public Movie(int id, String title, String country, String movieType, String genre, int releaseDate,
			int episode, String status, String description) {
		this.id = id;
		this.title = title;
		this.country = country;
		this.movieType = movieType;
		this.genre = genre;
		this.releaseDate = releaseDate;
		this.episode = episode;
		this.status = status;
		this.description = description;
	}
	public Movie() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSeason() {
		return season;
	}
	public void setSeason(int season) {
		this.season = season;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(int releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getEpisode() {
		return episode;
	}
	public void setEpisode(int episode) {
		this.episode = episode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	
	
}
