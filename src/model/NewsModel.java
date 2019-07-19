package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.dbConnection.MySQLConnection;
import model.entity.News;

public class NewsModel {
	public List<News> getAllNews() throws SQLException {
		List<News> newsList = new ArrayList<>();
		String sql = "SELECT * FROM news ORDER BY idnews DESC;";

		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		News n;
		while(rs.next()) {
			n = new News();
			
			n.setIdnews(rs.getInt("idnews"));
			n.setTitle(rs.getString("title"));
			n.setImage(rs.getString("image"));
			n.setContent(rs.getString("content"));
			n.setReleasedate(rs.getDate("releasedate"));
			n.setView(rs.getInt("view"));

			newsList.add(n);
		}
		return newsList;
	}
	
	public List<News> getAllNewsOrderByView() throws SQLException {
		List<News> newsList = new ArrayList<>();
		String sql = "SELECT * FROM news ORDER BY view DESC;";

		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		News n;
		while(rs.next()) {
			n = new News();
			
			n.setIdnews(rs.getInt("idnews"));
			n.setTitle(rs.getString("title"));
			n.setImage(rs.getString("image"));
			n.setContent(rs.getString("content"));
			n.setReleasedate(rs.getDate("releasedate"));
			n.setView(rs.getInt("view"));

			newsList.add(n);
		}
		return newsList;
	}
	
	
	
	public News getNewById(int idnews) throws SQLException {
		String sql = "SELECT * FROM news WHERE idnews = ?;";

		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idnews);
		
		ResultSet rs = preState.executeQuery();
		News n = null;
		while(rs.next()) {
			n = new News();			
			n.setIdnews(rs.getInt("idnews"));
			n.setTitle(rs.getString("title"));
			n.setImage(rs.getString("image"));
			n.setContent(rs.getString("content"));
			n.setReleasedate(rs.getDate("releasedate"));
			n.setView(rs.getInt("view"));
		}
		return n;
	}
	
	public int getCountNews() throws SQLException {
		String sql = "select count(*) from news;";
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		rs.next();
		int count = rs.getInt(1);
		return count;
	}
	
	public List<News> getNewPage(int start, int count) throws SQLException {
		List<News> nList = new ArrayList<>();
		String sql = "select * from news ORDER BY idnews DESC limit ?, ?;";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, start);
		preState.setInt(2, count);
		ResultSet rs = preState.executeQuery();
		while(rs.next()) {
			News n = new News();
			n.setIdnews(rs.getInt("idnews"));
			n.setTitle(rs.getString("title"));
			n.setImage(rs.getString("image"));
			n.setContent(rs.getString("content"));
			n.setReleasedate(rs.getDate("releasedate"));
			n.setView(rs.getInt("view"));
			nList.add(n);
		}
		System.out.println(">>> Getting new list for new page");
		return nList;
	}
	
	public void insertNews(News n) throws SQLException {
		String sql = "insert into news(title, image, content, releasedate) value(?, ?, ?, ?)";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		
		preState.setString(1, n.getTitle());
		preState.setString(2, n.getImage());
		preState.setString(3, n.getContent());
		preState.setDate(4, date);
		
		preState.executeUpdate();
	}
	
	public void updateNews(News n) throws SQLException {
		String sql = "update news set title = ?, image = ?, content = ?, releasedate = ? where idnews = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		
		preState.setString(1, n.getTitle());
		preState.setString(2, n.getImage());
		preState.setString(3, n.getContent());
		preState.setDate(4, date);
		preState.setInt(5, n.getIdnews());
		preState.executeUpdate();
		System.out.println(">>> Update news successfully: idnews: " + n.getIdnews() + ": " + n.getTitle());
	}
	
	public void updateNewsView(News n) throws SQLException {
		String sql = "UPDATE news SET view = ? WHERE idnews = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, n.getView());
		preState.setInt(2, n.getIdnews());
		preState.executeUpdate();
		System.out.println(">>> Increase view for news successfully: idnews: " + n.getIdnews());
	}
	
	public void deleteNews(int idnews) throws SQLException {
		String sql = "delete from news where idnews = ?";

		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, idnews);

		preState.executeUpdate();
		System.out.println(">>>>>> Delete news successfully");
	}
	
	public void swap(Object a, Object b) {
		Object temp = a;
		a = b;
		b = temp;
	}
	
	public static void main(String[] args) {
		NewsModel nModel = new NewsModel();
//		List<News> nList = null;
//		try {
//			nList = nModel.getNewPage(1, 6);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		for (News n : nList) {
//			System.out.println(n.getTitle());
//		}
		List<News> nList = null;
		try {
			nList = nModel.getAllNewsOrderByView();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (News news : nList) {
			System.out.println(news.getView());
		}
	}

}
