package com.jsontest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsontest.entity.User;
import com.jsontest.mapper.UserMapper;
import com.jsontest.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		
		userMapper.saveUser(user);
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(id);
	}

	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return null;
	}

}
