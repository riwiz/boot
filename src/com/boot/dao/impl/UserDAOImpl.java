package com.boot.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.boot.dao.UserDAO;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserDAOImpl implements UserDAO	{

	@Override
	public int insertUser(UserInfoVO user)	{
		String sql ="insert into user_info(\r\n" + 
				"ui_num,ui_name,ui_age,ui_birth,ui_id,ui_pwd,ui_phone,ui_email,ui_credat,ui_nickname)\r\n" + 
				"values(\r\n" + 
				"seq_ui_num.nextval,?,?,?,?,?,?,?,SYSDATE,?\r\n" + 
				")";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUi_name());
			ps.setInt(2, user.getUi_age());
			ps.setString(3, user.getUi_birth());
			ps.setString(4, user.getUi_id());
			ps.setString(5, user.getUi_PWD());
			ps.setString(6, user.getUi_phone());
			ps.setString(7, user.getUi_email());
			ps.setString(8, user.getUi_nickname());
			int cnt = ps.executeUpdate();
			con.commit();
			return cnt;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int deleteUser(UserInfoVO user)	{
		return 0;
	}

	@Override
	public int updateUser(UserInfoVO user)	{
		return 0;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user)	{
		return null;
	}

	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user)	{
		return null;
	}

	@Override
	public UserInfoVO selectUserForLogin(UserInfoVO user)	{
		String sql = "select * from user_info where ui_id=? and ui_pwd=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try	{
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUi_id());
			ps.setString(2, user.getUi_PWD());
			rs = ps.executeQuery();
			if(rs.next())	{
				UserInfoVO ui = new UserInfoVO();
				ui.setUi_num(rs.getInt("ui_num"));
				ui.setUi_age(rs.getInt("ui_age"));
				ui.setUi_birth(rs.getString("ui_birth"));
				ui.setUi_credat(rs.getString("ui_credat"));
				ui.setUi_email(rs.getString("ui_email"));
				ui.setUi_name(rs.getString("ui_name"));
				ui.setUi_nickname(rs.getString("ui_nickname"));
				ui.setUi_phone(rs.getString("ui_phone"));
				ui.setUi_id(rs.getString("ui_id"));
				ui.setUi_PWD(rs.getString("ui_PWD"));
				return ui;
			}
		
			
		}catch(SQLException e)	{
			
		}finally {
			InitServlet.close(rs,ps,con);
		}
		return null;
	}

	
}
	

