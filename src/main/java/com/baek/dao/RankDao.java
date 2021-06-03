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


public class RankDao {
	private Connection conn; //db 접속하는 객체
	PreparedStatement pstmt; 
	public RankDao() {
		conn = DbUtil.getConnection();
	}
	
}
