package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Lawyer;
import com.dcm.repository.LawyerRepository;

@Service
@Transactional
public class LawyerService {
	
    private final LawyerRepository lawyerRepository;
	
	public LawyerService(LawyerRepository lawyerRepository) {
		this.lawyerRepository = lawyerRepository;
	}
	
	
	public void saveMyLawyer(Lawyer lawyer) {
		lawyerRepository.save(lawyer);
	}
	
	public List<Lawyer> showAllLawyer(){
		List<Lawyer> lawyer=new ArrayList<Lawyer>();
		lawyerRepository.findAll().forEach(lawyer :: add);
		return lawyer;
	}

	public void deleteMyLawyer(int lawyerid) {
		// TODO Auto-generated method stub
		lawyerRepository.deleteById(lawyerid);
		System.out.println("From service class " +lawyerid);
	}



	public Lawyer editMyLawyer(int lawyerid) {
		// TODO Auto-generated method stub
		return lawyerRepository.findByLawyerid(lawyerid);
	}
	
	public Long noOfLawyer() {
		return lawyerRepository.count();
		
	}
	
	public List<String> AllLawyerName() {
		List<String> lname=new ArrayList<String>();
		lawyerRepository.findName().forEach(lname :: add);
		return lname;
		
	}
	
	public Lawyer findLawyer(String name) {
		
		return lawyerRepository.findByName(name);
		
	}

}
