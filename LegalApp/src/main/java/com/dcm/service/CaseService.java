package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcm.modal.Case;
import com.dcm.repository.CaseRepository;

@Service
@Transactional
public class CaseService {
	
private final CaseRepository caseRepository;
	
	public CaseService(CaseRepository caseRepository) {
		this.caseRepository = caseRepository;
	}
	
	public void SaveCase(Case c) {
		caseRepository.save(c);
	}
	
	public List<Case> AllCases(){
		List<Case> cases = new ArrayList<Case>();
		caseRepository.findAll().forEach(cases :: add);
		return cases;
	}

	public Long noOfCases() {
		// TODO Auto-generated method stub
		return caseRepository.count();
	}

	public Case getCaseDetail(int id) {
		// TODO Auto-generated method stub
		return caseRepository.findById(id);
	}
	
	
	
	public List<String> CaseTitle(){
		
		return caseRepository.findTitle();
		
	}

}
