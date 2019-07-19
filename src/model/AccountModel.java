package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import model.dbConnection.MySQLConnection;
import model.entity.Account;

public class AccountModel {

	public Account getAccount(String username, String pass) throws SQLException {
		String sql = "SELECT * FROM account WHERE username = ? AND pass = sha2(?, 256);";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		
		preState.setString(1, username);
		preState.setString(2, pass);
		
		ResultSet rs = preState.executeQuery();
		
		if (rs.next()) {
			return new Account(rs.getString(1), rs.getString(2) ,rs.getString(3));
		} else {
			return null;
		}
	}
	
	public Account getAccountByUsername(String username) throws SQLException {
		String sql = "SELECT * FROM account WHERE username= ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, username);
		ResultSet rs = preState.executeQuery();
		if (rs.next()) {
			return new Account(rs.getInt(1), rs.getString(2), rs.getString(3) ,rs.getString(4), rs.getString(5));
		} else {
			return null;
		}
	}
	
	public List<Account> getAllAccount() throws SQLException {
		List<Account> accList = new ArrayList<Account>();
		String sql = "SELECT * FROM account";
		Statement statement = MySQLConnection.getConnection().createStatement();
		ResultSet rs = statement.executeQuery(sql);
		Account acc;
		while(rs.next()) {
			acc = new Account();
			acc.setId(rs.getInt("id"));
			acc.setUsername(rs.getString("username"));
			acc.setPass(rs.getString("pass"));
			acc.setEmail(rs.getString("email"));
			acc.setAvatar(rs.getString("avatar"));
			accList.add(acc);
		}
		return accList;
	}
	
	public void registAccount(String username, String pass, String email) throws SQLException {
		String sql = "INSERT INTO account(username, pass, email) VALUE (?, SHA2(?, 256), ?)";

		Connection conn = MySQLConnection.getConnection();

		try {
			conn.setAutoCommit(false);
			PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
			preState.setString(1, username);
			preState.setString(2, pass);
			preState.setString(3, email);

			preState.execute();
			conn.commit();
		} catch(SQLException ex) {
			conn.rollback();
		}

	}
	
	public boolean updateAccount(Account acc) throws SQLException {
		String sql = "update account set pass = sha2('" + acc.getPass() + "', 256)," + " email = '" + acc.getEmail() + "'"
				+ "where username = '" + acc.getUsername() + "' ";
		return MySQLConnection.getConnection().createStatement().execute(sql);
	}
	
	
	public void updateAvatar(Account acc) throws SQLException {
		String sql = "update account set avatar = ? where username = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, acc.getAvatar());
		preState.setString(2, acc.getUsername());
		preState.executeUpdate();
		System.out.println(">>> Update avatar successfully");
	}
	
	public void updateAccountVer2(Account acc) throws SQLException {
		String sql = "update account set pass=sha2(?, 256), email = ?, avatar = ? where username = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setString(1, acc.getPass());
		preState.setString(2, acc.getEmail());
		preState.setString(3, acc.getAvatar());
		preState.setString(4, acc.getUsername());
		preState.executeUpdate();
		System.out.println(">>> Update account successfully _version 2");
	}
	
	public void deleteAccount(int id) throws SQLException {
		Connection con = MySQLConnection.getConnection();
		con.setAutoCommit(false);
		
		String sql = "DELETE FROM account WHERE id = ?";
		PreparedStatement preState = MySQLConnection.getConnection().prepareStatement(sql);
		preState.setInt(1, id);
		preState.executeQuery();
		con.commit();
		System.out.println(">>>Delete account successfully");
	}
	
	public static void main(String[] args) throws SQLException{
		AccountModel am = new AccountModel();
//		Account acc = new Account("admin1", "123456", "admin1@gmail.com");
//		am.registAccount("admin1", "123465", "admin1@gmail.com");
//		System.out.println(am.updateAccount(am.getAccount("admin1", "123465")));
//		am.registAccount("admin5", "123456", "admin5@gmail.com");
//		Account acc = new Account("admin5", "123", "admin5@yahoo.com");
		
//		List<Account> accList = new ArrayList<>();
//		accList = am.getAllAccount();
//		for (Account account : accList) {
//			account.setAvatar("main_avatar.jpg");
//			am.updateAvatar(account);
//		}
		Account acc = am.getAccountByUsername("admin");
		acc.setPass("123456");
		am.updateAccountVer2(acc);
		 
	}

}
