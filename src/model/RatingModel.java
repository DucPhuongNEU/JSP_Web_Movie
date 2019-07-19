package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.dbConnection.MySQLConnection;
import model.entity.Rating;

public class RatingModel {
	public Rating getRating(int idmovie, String username) throws SQLException {
		String sql = "SELECT * FROM rating WHERE idmovie = ? AND username = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idmovie);
		preState.setString(2, username);
		ResultSet rs = preState.executeQuery();
		Rating r = new Rating();
		if (!rs.next()) {
			r.setValuerating(0);
			r.setUsername(username);
			r.setIdmovie(idmovie);
			r.setIdrating(0);
		} else {
			rs.beforeFirst();
			rs.next();
			r.setIdrating(rs.getInt("idrating"));
			r.setValuerating(rs.getFloat("valuerating"));
			r.setIdmovie(rs.getInt("idmovie"));
			r.setUsername(rs.getString("username"));
		}
		return r;
	}
	
	public float getRatingValue(int idmovie) throws SQLException {
		String sql = "SELECT AVG(valuerating) AS averageValue FROM rating WHERE idmovie = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idmovie);
		ResultSet rs = preState.executeQuery();
		rs.next();
		return rs.getFloat("averageValue");
	}
	
	public void insertRating(Rating r) throws SQLException {
		String sql = "INSERT INTO rating(valuerating, idmovie, username) VALUE(?, ?, ?)";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setFloat(1, r.getValuerating());
		preState.setInt(2, r.getIdmovie());
		preState.setString(3, r.getUsername());
		
		preState.executeUpdate();
		System.out.println(">>> Insert new rating for a movie: idmovie: " + r.getIdmovie() + "user: " + r.getUsername());
		new MovieModel().updateMovieRating(r.getIdmovie(), new RatingModel().getRatingValue(r.getIdmovie()));
	}
	
	public void updateRating(Rating r) throws SQLException {
		String sql = "UPDATE rating SET valuerating = ? WHERE idmovie = ? AND username = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setFloat(1, r.getValuerating());
		preState.setInt(2, r.getIdmovie());
		preState.setString(3, r.getUsername());
		preState.executeUpdate();
		System.out.println(">>> Update new rating for a movie: idmovie: " + r.getIdmovie() + "user: " + r.getUsername());
		new MovieModel().updateMovieRating(r.getIdmovie(), new RatingModel().getRatingValue(r.getIdmovie()));
	}
	
	public static void main(String[] args) throws SQLException {
		RatingModel rModel = new RatingModel();
//		Rating r = new Rating();
//		r.setValuerating(3);
//		r.setUsername("admin3");
//		r.setIdmovie(36);
//		try {
//			rModel.insertRating(r);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		System.out.println(rModel.getRatingValue(36));
	}
}
