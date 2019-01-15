package com.dcm.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.UpdateCase;
import com.dcm.repository.UpdatecaseRepository;

@Service
@Transactional
public class UpdatecaseService {
	
private final UpdatecaseRepository updatecaseRepository;
	
	public UpdatecaseService(UpdatecaseRepository updatecaseRepository) {
		this.updatecaseRepository = updatecaseRepository;
	}
	
	public void saveMyUpdateCaseDetail(UpdateCase updatecase) {
		updatecaseRepository.save(updatecase);
	}
	
	public UpdateCase getBycaseno(String caseno) {
		UpdateCase updatecase = updatecaseRepository.findTop1ByCasenoOrderByUpdateidDesc(caseno);
		return updatecase;
	}
	
	public List<UpdateCase> TodayDOH() {
		LocalDate dash = java.time.LocalDate.now();
		DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = dash.format(formatters);
		List<UpdateCase> caseDOH = new ArrayList<UpdateCase>();
		updatecaseRepository.findByNexthearing(d).forEach(caseDOH::add);
		dash = null;
		return caseDOH;
	}
	
	public List<UpdateCase> HearingReminder() {
		LocalDate date= java.time.LocalDate.now().plusDays(2);
		LocalDate date2= java.time.LocalDate.now().plusDays(1);
		 DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = date.format(formatters);
		String d2 = date2.format(formatters);
		
        System.out.println("Hearing reminder for date "+d+ " & "+d2);
        
		List<UpdateCase> caseNDOH = new ArrayList<UpdateCase>();
		updatecaseRepository.findHearings(d2, d).forEach(caseNDOH::add);
		d= null;	
		return caseNDOH;
	}

}
