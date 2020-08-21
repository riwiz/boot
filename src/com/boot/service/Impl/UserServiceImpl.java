package com.boot.service.Impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.boot.dao.UserDAO;
import com.boot.dao.impl.UserDAOImpl;
import com.boot.listener.SessionListener;
import com.boot.service.UserService;
import com.boot.vo.UserInfoVO;

public class UserServiceImpl implements UserService	{
	private UserDAO uDAO = new UserDAOImpl();
	
	@Override
	public int insertUser(UserInfoVO user)
	{
		if(uDAO.selectUserById(user.getUi_id())!=null)	{
			return -1;
		}
		return uDAO.insertUser(user);
	}

	@Override
	public int deleteUser(UserInfoVO user)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(UserInfoVO user, HttpSession hs)
	{
		// TODO Auto-generated method stub
		return uDAO.updateUser(user);
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user)
	{
		return null;
	}


	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user)
	{
		return null;
	}

	@Override
	public boolean doLogin(UserInfoVO user, HttpSession hs) {
		user = uDAO.selectUserForLogin(user);
		if(user!=null) {
			SessionListener.checkUserId(user.getUi_id());
			hs.setAttribute("user", user);
			return true;
		}
		return false;
	}

	@Override
	public boolean checkUserId(String ui_id) {
		UserInfoVO user = uDAO.selectUserById(ui_id);
		if(user==null) {
			return true;
		}
		return false;
	}
}
