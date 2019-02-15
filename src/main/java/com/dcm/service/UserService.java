package com.dcm.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.UpdateCase;
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
	
	public List<Users> TodayBirthday() {
		
		LocalDate date= java.time.LocalDate.now();
		 DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = date.format(formatters);
		
        System.out.println("Birthday reminder for date "+d );
        
		List<Users> birthday = new ArrayList<Users>();
		usersRepository.findBirthdays(d).forEach(birthday::add);
		System.out.println("Birthday wishes send for "+d );
		d= null;	
		return birthday;
	}
}
