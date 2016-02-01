package com.jsontest.mapper;

import java.util.List;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jsontest.entity.User;
@Transactional(propagation=Propagation.REQUIRES_NEW,readOnly=false,isolation=Isolation.DEFAULT)
public interface UserMapper {
	
	public void saveUser(User user);
	public void deleteUser(User user);
	public void updateUser(User user);
	public User getUserById(int id);
	public List<User> getAllUser();
}
