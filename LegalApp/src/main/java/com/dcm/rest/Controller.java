package com.dcm.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dcm.service.CaseService;

@RestController
@RequestMapping("/api")
public class Controller{

	@Autowired
	private CaseService caseService;
	
	@GetMapping("/")
	public String hello() {
		return "Hi Rest API";
	}
	
	@GetMapping("/case")
	public String Case(HttpServletRequest request) {
		request.setAttribute("cases", caseService.AllCases());
		request.setAttribute("mode", "All_Cases");
		return "case";
		
	}
}
