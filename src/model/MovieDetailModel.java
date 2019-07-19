package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.dbConnection.MySQLConnection;
import model.entity.MovieDetail;

public class MovieDetailModel {
	public List<MovieDetail> getAllMovieDetail() throws SQLException{
		List<MovieDetail> mdList = new ArrayList<>();
		String sql = "Select * from moviedetail";
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		MovieDetail md;
		while(rs.next()) {
			md = new MovieDetail();
			md.setIdmoviedetail(rs.getInt("idmoviedetail"));
			md.setId(rs.getInt("id"));
			md.setEpisode(rs.getString("episode"));
			md.setEpisodename(rs.getString("episodename"));
			md.setEpisodelink(rs.getString("episodelink"));
			
			mdList.add(md);
		}
		return mdList;
	}
	
	public List<MovieDetail> getAllMovieDetailById(int id) throws SQLException {
		List<MovieDetail> mdList = new ArrayList<>();
		String sql = "SELECT * FROM moviedetail WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		ResultSet rs = preState.executeQuery();
		MovieDetail md;
		while (rs.next()) {
			md = new MovieDetail();
			md.setIdmoviedetail(rs.getInt("idmoviedetail"));
			md.setId(rs.getInt("id"));
			md.setEpisode(rs.getString("episode"));
			md.setEpisodename(rs.getString("episodename"));
			md.setEpisodelink(rs.getString("episodelink"));
			mdList.add(md);
		}
		return mdList;
	}
	
	public List<MovieDetail> getMovieDetailById(int id) throws SQLException {
		List<MovieDetail> mdList = new ArrayList<>();
		String sql = "SELECT * FROM moviedetail WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		ResultSet rs = preState.executeQuery();
		MovieDetail md = null;
		while (rs.next()) {
			md = new MovieDetail();
			md.setIdmoviedetail(rs.getInt("idmoviedetail"));
			md.setId(rs.getInt(id));
			md.setEpisode(rs.getString("episode"));
			md.setEpisodename(rs.getString("episodename"));
			md.setEpisodelink(rs.getString("episodelink"));
			mdList.add(md);
		}
		return mdList;
	}
	
	public MovieDetail getMovieDetailByIdmoviedetail(int idmoviedetail) throws SQLException {
		String sql = "SELECT * FROM moviedetail WHERE idmoviedetail = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idmoviedetail);
		ResultSet rs = preState.executeQuery();
		MovieDetail md = null;
		while (rs.next()) {
			md = new MovieDetail();
			md.setIdmoviedetail(idmoviedetail);
			md.setId(rs.getInt("id"));
			md.setEpisode(rs.getString("episode"));
			md.setEpisodename(rs.getString("episodename"));
			md.setEpisodelink(rs.getString("episodelink"));
		}
		return md;
	}
	
	public void insertMovieDetail(MovieDetail md) throws SQLException {
		String sql = "insert into moviedetail(id, episode, episodename, episodelink) value(?,?,?,?)";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, md.getId());
		preState.setString(2, md.getEpisode());
		preState.setString(3, md.getEpisodename());
		preState.setString(4, md.getEpisodelink());
		
		preState.executeUpdate();
	}
	
	public void updateMovieDetail(MovieDetail md) throws SQLException {
		String sql = "UPDATE moviedetail SET episode = ?, episodename = ?, episodelink = ? WHERE idmoviedetail = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, md.getEpisode());
		preState.setString(2, md.getEpisodename());
		preState.setString(3, md.getEpisodelink());
		preState.setInt(4, md.getIdmoviedetail());
		preState.executeUpdate();
		System.out.println(">>> Update movie detail successfully");
	}
	
	public void deleteMovieDetail(int idmoviedetail) throws SQLException {
		String sql = "DELETE FROM moviedetail WHERE idmoviedetail = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idmoviedetail);
		preState.executeUpdate();
	}
	
	public void deleteAllMovieDetail(int id) throws SQLException {
		String sql = "DELETE FROM moviedetail WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		preState.executeUpdate();
	}
	
	public int getNumberExistingEpisode(int id) throws SQLException {
		String sql = "SELECT COUNT(id) FROM moviedetail WHERE id=?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		ResultSet rs = preState.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}
	
	public static void main(String[] args) throws SQLException{
		MovieDetailModel mdm = new MovieDetailModel();
//		for (MovieDetail md : mdm.getAllMovieDetail()) {
//			System.out.println(md.getEpisode());
//		}
		System.out.println(mdm.getNumberExistingEpisode(30));
	}

}
