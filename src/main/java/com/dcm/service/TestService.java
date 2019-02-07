package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Test;
import com.dcm.repository.TestRepository;

@Service
@Transactional
public class TestService {
	
	private final TestRepository testRepository;
	
	public TestService(TestRepository testRepository) {
		this.testRepository = testRepository;
	}
	
	
	public List<Test> showAllTest(){
		List<Test> test=new ArrayList<Test>();
		testRepository.findAll().forEach(test :: add);
		return test;
	}

	
}
