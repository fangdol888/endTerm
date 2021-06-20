package com.baek.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.baek.model.Bbs;
import com.baek.model.Rank;
import com.baek.util.DbUtil;


public class RankDao {
	private Connection conn; //db 접속하는 객체
	PreparedStatement pstmt; 
	private ResultSet rs; 
	
	public RankDao() {
		conn = DbUtil.getConnection();
	}
	
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int setRank(String gameName, String userID, int score) {
		String sql = "INSERT INTO ranking (id, gameName, time, score) VALUES (?,?,?,?)";
		Rank rank = getRank(gameName, userID);
		
		if(rank!=null) {//기록이 있다면
			if(rank.getScore() < score) //기록이 더 크면 갱신
				return updateRank(gameName, userID, score);
			else return -2; //기록 저조로 갱신 실패
	
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2, gameName);
			pstmt.setString(3, getDate());
			pstmt.setInt(4, score);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//오류
	}
	
	public int updateRank(String gameName, String userID, int score) {
		String sql = "UPDATE ranking SET time= ?, score=? WHERE id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,getDate());
			pstmt.setInt(2, score);
			pstmt.setString(3, userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int updateRank(String gameName, String userID, int score, String date) {
		String sql = "UPDATE ranking SET time= ?, score=? WHERE id =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,date);
			pstmt.setInt(2, score);
			pstmt.setString(3, userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Rank getRank(String gameName, String userID) {
		String sql = "SELECT * FROM ranking WHERE id=? and gameName=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			pstmt.setString(2, gameName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Rank rank = new Rank();
				rank.setId(rs.getString(2));
				rank.setGameName(rs.getString(3));
				rank.setTime(rs.getString(4));
				rank.setScore(rs.getInt(5));
				return rank;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int deleteRank(String gameName, String userID) {
		String sql = "DELETE from ranking where id=? AND gameName=?";
		// Parameters start with 1
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2, gameName);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 

	}
	
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select bbsID from bbs order by bbsID desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	
	public List<Rank> getList(String gameName){
		String sql = "select * from ranking where gameName=? order by score desc limit 100";
		List<Rank> list = new ArrayList<Rank>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gameName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Rank rank = new Rank();
				rank.setId(rs.getString(2));
				rank.setGameName(rs.getString(3));
				rank.setTime(rs.getString(4));
				rank.setScore(rs.getInt(5));
				list.add(rank);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
