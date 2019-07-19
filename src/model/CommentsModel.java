package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dbConnection.MySQLConnection;
import model.entity.Comments;

public class CommentsModel {
	public List<Comments> getComments(int idmovie) throws SQLException {
		List<Comments> cmList = new ArrayList<>();
		String sql = "select * from comments where idmovie = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idmovie);
		ResultSet rs = preState.executeQuery();
		Comments c;
		while (rs.next()) {
			c = new Comments();
			c.setIdcomment(rs.getInt("idcomment"));
			c.setIdmovie(rs.getInt("idmovie"));
			c.setUsername(rs.getString("username"));
			c.setContent(rs.getString("content"));
			cmList.add(c);
		}
		return cmList;
	}

	public void insertComments(Comments c) throws SQLException {
		String sql = "insert into comments(idmovie, username, content) value(?, ?, ?)";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, c.getIdmovie());
		preState.setString(2, c.getUsername());
		preState.setString(3, c.getContent());

		System.out.println("insert comments succesffully");
		preState.executeUpdate();
	}
	
	public void updateComments(int idcomment, String content) throws SQLException {
		String sql = "update comments set content = ? where idcomment = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		
		preState.setString(1, content);
		preState.setInt(2, idcomment);

		System.out.println(">>> Updating comments");
		preState.executeUpdate();
		System.out.println(">>> Update comments successfully");
	}

	public void deleteComments(int idcomment) throws SQLException {

		Connection con = MySQLConnection.getConnection();
		con.setAutoCommit(false);

		String sql = "delete from comments where idcomment= ?";

		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);

		preState.setInt(1, idcomment);

		preState.executeUpdate();
		con.commit();
		System.out.println(">>>>>>delete comment successfully");
	}

	public static void main(String[] args) {
		//		CommentsModel cm = new CommentsModel();
		//		try {
		//			List<Comments> list = cm.getComments(1);
		//			System.out.println(list.size());
		//		} catch (SQLException e) {
		//			// TODO Auto-generated catch block
		//			e.printStackTrace();
		//		}
	}
}
