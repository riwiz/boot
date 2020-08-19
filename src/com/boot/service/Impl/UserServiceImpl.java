package com.boot.service.Impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.boot.dao.UserDAO;
import com.boot.impl.UserDAOImpl;
import com.boot.service.UserService;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserServiceImpl implements UserService	{
	private UserDAO uDAO = new UserDAOImpl();
	
	@Override
	public int insertUser(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean doLogin(UserInfoVO user, HttpSession hs) {
		user = uDAO.selectUserForLogin(user);
		if(user!=null) {
			hs.setAttribute("user", user);
			return true;
		}
		return false;
	}

}
