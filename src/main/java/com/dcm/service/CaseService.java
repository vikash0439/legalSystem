package com.dcm.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

	public Case getCaseDetail(String caseno) {
		// TODO Auto-generated method stub
		return caseRepository.findByCaseno(caseno);
	}
	
	
	
	public List<String> CaseTitle(){		
		return caseRepository.findTitle();
		
	}

	public List<String> findCaseno() {
		List<String> caseno = caseRepository.findCaseno();
		System.out.println(caseno);
		return caseno;
	}
	
	public List<Case> HearingReminder() {
		LocalDate date= java.time.LocalDate.now().plusDays(2);
		 DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = date.format(formatters);
        System.out.println("Hearing reminder for date "+d);
		List<Case> caseNDOH = new ArrayList<Case>();
		caseRepository.findByNexthearing(d).forEach(caseNDOH::add);
		d= null;	
		return caseNDOH;
	}
	
	public List<Case> TodayDOH() {
		LocalDate dash = java.time.LocalDate.now();
		DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = dash.format(formatters);
		List<Case> caseDOH = new ArrayList<Case>();
		caseRepository.findByNexthearing(d).forEach(caseDOH::add);
		dash = null;
		return caseDOH;
	}
	
	public List<Case> CategoryCount(){		
		return caseRepository.countBycategory();
		
	}

}
