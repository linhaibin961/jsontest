package com.jsontest.service;

import java.util.List;

import com.jsontest.entity.User;

public interface UserService {
	void saveUser(User user);     
	void deleteUser(User user);   
	void updateUser(User user);   
	User getUserById(int id);     
	List<User> getAllUser();      
}
