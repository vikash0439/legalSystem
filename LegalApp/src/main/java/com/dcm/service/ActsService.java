package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Acts;
import com.dcm.repository.ActsRepository;

@Service
@Transactional
public class ActsService {
	
	private final ActsRepository actsRepository;
	
	public ActsService(ActsRepository actsRepository) {
		this.actsRepository = actsRepository;
	}
	
	public void saveMyAct(Acts act) {
		actsRepository.save(act);
	}
	
	public List<Acts> showAllActs(){
		List<Acts> acts=new ArrayList<Acts>();
		actsRepository.findAll().forEach(acts :: add);
		return acts;
	}

	public Long noOfActs() {
		// TODO Auto-generated method stub
		return actsRepository.count();
	}
	
	public List<String> AllActsName() {
		List<String> section=new ArrayList<String>();
		actsRepository.findName().forEach(section :: add);
		return section;
		
	}
	
	public Acts findAct(String name) {
		return actsRepository.findByName(name);
	}

}
