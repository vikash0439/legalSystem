package com.dcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Users;
import com.dcm.repository.UsersRepository;

@Service
@Transactional
public class UserService{
	
	 public final UsersRepository usersRepository;
   
	 public UserService(UsersRepository usersRepository) {
			this.usersRepository = usersRepository;
		}
	 
	 public Long noOfUsers() {
		 return usersRepository.count();
	 }
	 
	 public List<Users> showAllUsers(){
		 List<Users> users = usersRepository.findAll();
		 return users;
	 }
	 
	 public Users findUser(String name) {
		 Users user=usersRepository.findByName(name);
		 return user;
	 }

	public void saveUser(Users user) {		
		usersRepository.save(user);		
	}
	
	public String[] getEmail(){
		String[] email = usersRepository.findUsername();
		return email;
	}
}
