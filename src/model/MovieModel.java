package model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import model.dbConnection.MySQLConnection;
import model.entity.Movie;

public class MovieModel {
	public List<Movie> getAllMovie() throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = "Select * from movie";
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		Movie m;
		while(rs.next()) {
			m = new Movie();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSeason(rs.getInt("season"));
			m.setAuthor(rs.getString("author"));
			m.setCountry(rs.getString("country"));
			m.setMovieType(rs.getString("movieType"));
			m.setGenre(rs.getString("genre"));
			m.setReleaseDate(rs.getInt("releasedate"));
			m.setEpisode(rs.getInt("episode"));
			m.setStatus(rs.getString("status"));
			m.setDescription(rs.getString("description"));
			m.setImageLink(rs.getString("imageLink"));
			m.setView(rs.getInt("view"));
			m.setRating(rs.getFloat("rating"));
			mList.add(m);
		}
		
		return mList;
	}
	
	public Movie getMovieById(int id) throws SQLException {
		String sql = "SELECT * FROM movie WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		ResultSet rs = preState.executeQuery();
		Movie m = new Movie();
		if (rs.next()) {
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSeason(rs.getInt("season"));
			m.setAuthor(rs.getString("author"));
			m.setCountry(rs.getString("country"));
			m.setMovieType(rs.getString("movieType"));
			m.setGenre(rs.getString("genre"));
			m.setReleaseDate(rs.getInt("releasedate"));
			m.setEpisode(rs.getInt("episode"));
			m.setStatus(rs.getString("status"));
			m.setDescription(rs.getString("description"));
			m.setImageLink(rs.getString("imageLink"));
			m.setView(rs.getInt("view"));
			m.setRating(rs.getFloat("rating"));
		}
		return m;
	}

	public byte[] getImageByMovieId(int id) throws SQLException {
		String sql = "SELECT img FROM movie WHERE id=" + id;
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		byte[] bytes = new byte[] {};
		if(rs.next()) {
			return rs.getBytes("img"); 
		}
		return new byte[] {};
	}
	
	public List<Movie> getSearchMovie(HttpServletRequest request, String name) throws SQLException {
		List<Movie> movieList = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE title LIKE ?;";
		
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, "%" + name + "%");
		ResultSet rs = preState.executeQuery();
		
		if (!rs.isBeforeFirst()) {
			request.setAttribute("Result", "Can not find result");
		} else {
			Movie m;
			while (rs.next()) {
				m = new Movie();
				m.setId(rs.getInt("id"));
				m.setImageLink(rs.getString("imageLink"));
				m.setTitle(rs.getString("title"));
				
				movieList.add(m);
			}
		}
		return movieList;
	}
	
	public List<Movie> getAllMovieByGenre(String name) throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE genre LIKE ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, "%" + name + "%");
		ResultSet rs = preState.executeQuery();
		
		Movie m;
		while (rs.next()) {
			m = new Movie();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSeason(rs.getInt("season"));
			m.setAuthor(rs.getString("author"));
			m.setCountry(rs.getString("country"));
			m.setMovieType(rs.getString("movieType"));
			m.setGenre(rs.getString("genre"));
			m.setReleaseDate(rs.getInt("releasedate"));
			m.setEpisode(rs.getInt("episode"));
			m.setStatus(rs.getString("status"));
			m.setDescription(rs.getString("description"));
			m.setImageLink(rs.getString("imageLink"));
			m.setView(rs.getInt("view"));
			m.setRating(rs.getFloat("rating"));
			
			mList.add(m);
		}
		
		return mList;
	}
	
	public List<Movie> getAllMovieByCountry(String country) throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE country LIKE ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, "%" + country + "%");
		ResultSet rs = preState.executeQuery();
		
		Movie m;
		while (rs.next()) {
			m = new Movie();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSeason(rs.getInt("season"));
			m.setAuthor(rs.getString("author"));
			m.setCountry(rs.getString("country"));
			m.setMovieType(rs.getString("movieType"));
			m.setGenre(rs.getString("genre"));
			m.setReleaseDate(rs.getInt("releasedate"));
			m.setEpisode(rs.getInt("episode"));
			m.setStatus(rs.getString("status"));
			m.setDescription(rs.getString("description"));
			m.setImageLink(rs.getString("imageLink"));
			m.setView(rs.getInt("view"));
			m.setRating(rs.getFloat("rating"));
			
			mList.add(m);
		}
		
		return mList;
	}
	
	
	public List<Movie> getTopActionMovie(String action) throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = null;
		switch(action) {
		case "view":
			sql = "SELECT * FROM movie ORDER BY view DESC";
			break;
		case "rate":
			sql = "SELECT * FROM movie ORDER BY rating DESC";
			break;
		case "added":
			sql = "SELECT * FROM movie ORDER BY id DESC";
			break;
		default: 
			sql = "SELECT * FROM movie ORDER BY id DESC";
			break;
		}
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		Movie m;
		while (rs.next()) {
			m = new Movie();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSeason(rs.getInt("season"));
			m.setAuthor(rs.getString("author"));
			m.setCountry(rs.getString("country"));
			m.setMovieType(rs.getString("movieType"));
			m.setGenre(rs.getString("genre"));
			m.setReleaseDate(rs.getInt("releasedate"));
			m.setEpisode(rs.getInt("episode"));
			m.setStatus(rs.getString("status"));
			m.setDescription(rs.getString("description"));
			m.setImageLink(rs.getString("imageLink"));
			m.setView(rs.getInt("view"));
			m.setRating(rs.getFloat("rating"));
			
			mList.add(m);
		}
		return mList;
	}
	
	public List<Movie> getGenrePage(int start, int count, String genre,HttpServletRequest request) throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE genre LIKE ? ORDER BY id DESC LIMIT ?, ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		String genreFormat = genre.toString().replace('-', ' ');
		preState.setString(1, "%" + genreFormat + "%");
		preState.setInt(2, start);
		preState.setInt(3, count);
		ResultSet rs = preState.executeQuery();
		if (!rs.isBeforeFirst()) {
			request.setAttribute("ErrorResult", "There's no movie containing this genre at this moment");
		} else {
			while (rs.next()) {
				Movie m = new Movie();
				m.setId(rs.getInt("id"));
				m.setTitle(rs.getString("title"));
				m.setSeason(rs.getInt("season"));
				m.setAuthor(rs.getString("author"));
				m.setCountry(rs.getString("country"));
				m.setMovieType(rs.getString("movieType"));
				m.setGenre(rs.getString("genre"));
				m.setReleaseDate(rs.getInt("releasedate"));
				m.setEpisode(rs.getInt("episode"));
				m.setStatus(rs.getString("status"));
				m.setDescription(rs.getString("description"));
				m.setImageLink(rs.getString("imageLink"));
				m.setView(rs.getInt("view"));
				m.setRating(rs.getFloat("rating"));
				mList.add(m);
			}
		}
		System.out.println(">>> Getting new list for genre page");
		return mList;
	}
	
	public List<Movie> getCountryPage(int start, int count, String country,HttpServletRequest request) throws SQLException {
		List<Movie> mList = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE country LIKE ? ORDER BY id DESC LIMIT ?, ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		String countryFormat = country.toString().replace('-', ' ');
		preState.setString(1, "%" + countryFormat + "%");
		preState.setInt(2, start);
		preState.setInt(3, count);
		ResultSet rs = preState.executeQuery();
		if (!rs.isBeforeFirst()) {
			request.setAttribute("ErrorResult", "There's no movie coming from this " + country + " at this moment");
		} else {
			while (rs.next()) {
				Movie m = new Movie();
				m.setId(rs.getInt("id"));
				m.setTitle(rs.getString("title"));
				m.setSeason(rs.getInt("season"));
				m.setAuthor(rs.getString("author"));
				m.setCountry(rs.getString("country"));
				m.setMovieType(rs.getString("movieType"));
				m.setGenre(rs.getString("genre"));
				m.setReleaseDate(rs.getInt("releasedate"));
				m.setEpisode(rs.getInt("episode"));
				m.setStatus(rs.getString("status"));
				m.setDescription(rs.getString("description"));
				m.setImageLink(rs.getString("imageLink"));
				m.setView(rs.getInt("view"));
				m.setRating(rs.getFloat("rating"));
				mList.add(m);
			}
		}
		System.out.println(">>> Getting new list for country page");
		return mList;
	}
	
	public void insertMovie(Movie m) throws SQLException {
		String sql = "INSERT INTO movie (title, season, author, country, movieType, genre, releasedate, episode, status, description, imageLink) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, m.getTitle());
		preState.setInt(2, m.getSeason());
		preState.setString(3, m.getAuthor());
		preState.setString(4, m.getCountry());
		preState.setString(5, m.getMovieType());
		preState.setString(6, m.getGenre());
		preState.setInt(7, m.getReleaseDate());
		preState.setInt(8, m.getEpisode());
		preState.setString(9, m.getStatus());
		preState.setString(10, m.getDescription());
		preState.setString(11, m.getImageLink());
		preState.executeUpdate();
		
		System.out.println(">>> Insert a new movie successfully");
	}
	
	public void updateMovie(Movie m) throws SQLException {
		String sql = "UPDATE movie SET title = ?, author = ?, country = ?, movieType = ?, genre = ?, releasedate = ?, episode = ?, status = ?, description = ?, imageLink = ? WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		
		preState.setString(1, m.getTitle());
		preState.setString(2, m.getAuthor());
		preState.setString(3, m.getCountry());
		preState.setString(4, m.getMovieType());
		preState.setString(5, m.getGenre());
		preState.setInt(6, m.getReleaseDate());
		preState.setInt(7, m.getEpisode());
		preState.setString(8, m.getStatus());
		preState.setString(9, m.getDescription());
		preState.setString(10, m.getImageLink());
		preState.setInt(11, m.getId());
		
		preState.executeUpdate();
		System.out.println(">>> Update movie successfully: id: " + m.getId());
	}
	
	public void updateMovieView(Movie m) throws SQLException {
		String sql = "UPDATE movie SET view = ? WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, m.getView());
		preState.setInt(2, m.getId());
		
		preState.executeUpdate();
		System.out.println(">>> Update view successfully");
	}
	
	public void updateMovieRating(int idmovie, float rating) throws SQLException {
		String sql = "UPDATE movie SET rating = ? WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setFloat(1, rating);
		preState.setInt(2, idmovie);
		preState.executeUpdate();
		System.out.println(">>> Update rating for a movie: idmovie: " + idmovie);
	}

	public void deleteMovie(int id) throws SQLException {
		String sql = "DELETE FROM movie WHERE id = ?;";
		MovieDetailModel mdModel = new MovieDetailModel();
		mdModel.deleteAllMovieDetail(id);
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		preState.executeUpdate();
		System.out.println(">>>Delete movie successfully");
	}
	
	
	public static void main(String[] args) throws SQLException{
		//		MovieModel mm = new MovieModel();
		//		for (Movie m : mm.getAllMovie()) {
		//			System.out.println(m.getTitle().replaceAll("\\s", ""));
		//		}

		//		MovieModel mModel = new MovieModel();
		//		List<Movie> mList = mModel.getAllMovie();
	
		//		String a = "./images/anime/"+mList.get(0).getTitle().replaceAll("\\s", "")+".jpg";
		//		System.out.println(a);

		MovieModel mModel = new MovieModel();
//		List<Movie> mList = mModel.getAllMovie();
//		Movie m = mList.get(mList.size()-1);
//		System.out.println(m.getId());
			
//		for (int i = 0; i < mList.size(); i++) {
//			System.out.println(mList.get(i).getTitle());
//		}
//		List<Movie> mList = mModel.getAllMovieByGenre("adventure");
//		for (Movie movie : mList) {
//			System.out.println(movie.getTitle());
//		}
		List<Movie> mList = mModel.getTopActionMovie("rate");
		for (Movie movie : mList) {
			System.out.println(movie.getRating());
		}
	}
}
