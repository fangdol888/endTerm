package com.baek.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.baek.model.User;
import com.baek.util.DbUtil;

public class UserDao {

	private Connection connection; //db 접속하는 객체
	PreparedStatement pstmt;
	public UserDao() {
		connection = DbUtil.getConnection();
	}
	
	public int login(String userID, String userPassword) {
		String sql = "SELECT password FROM member_table	WHERE id = ? ";
		try { 
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}else
				{
					return 0;
				}
			}
			return -1; // 아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}
	
	public int register(User user) {
		String sql = "INSERT INTO member_table values(?,?,?,?,?)";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,user.getId());
			pstmt.setString(2,user.getPassword());
			pstmt.setString(3,user.getName());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getEmail());
			return pstmt.executeUpdate(); //정상 입력시 1 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 오류
	}
	
	public int authorization(User user, int auth){
		String sql = "INSERT INTO admin values(?,?)";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setInt(2, auth);
			return pstmt.executeUpdate(); //정상 입력시 1 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //오류
	}
	
	public int isAdmin(String userid) { //관리자인지 확인
		String sql = "SELECT authority FROM admin WHERE id = ? ";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					return 1; //관리자
				}else {
					return 0; //일반
				}
			}
			return -1; //데이터베이스 내의 권한 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}
	public int deleteAuth(String userid) {
		String sql = "delete from admin where id=?";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, userid);
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
		
	public void deleteUser(User user) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("delete from member_table where id=?");
			// Parameters start with 1
			preparedStatement.setString(1, user.getId());
			preparedStatement.executeUpdate();
			deleteAuth(user.getId());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int updateUser(User user) {
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("update member_table set name=?, password=?, gender=?, email=?" +
							"where id=?");
			// Parameters start with 1
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3,user.getGender());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getId());
			return preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from member_table");
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return users;
	}
	
	public User getUserById(String userId) {
		User user = new User();
		try {
			PreparedStatement preparedStatement = connection.
					prepareStatement("select * from member_table where id=?");
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
}
