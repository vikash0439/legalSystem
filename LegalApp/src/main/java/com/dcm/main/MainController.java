package com.dcm.main;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;

import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dcm.mail.EmailServiceImpl;
import com.dcm.modal.Acts;
import com.dcm.modal.Case;
import com.dcm.modal.Document;
import com.dcm.modal.Lawyer;
import com.dcm.modal.Logs;
import com.dcm.modal.Payment;
import com.dcm.modal.Reminder;
import com.dcm.modal.Test;
import com.dcm.service.ActsService;
import com.dcm.service.CaseService;
import com.dcm.service.DocumentService;
import com.dcm.service.LawyerService;
import com.dcm.service.LogsService;
import com.dcm.service.PayService;
import com.dcm.service.PaymentService;
import com.dcm.service.ReminderService;
import com.dcm.service.TestService;
import com.dcm.service.UpdatecaseService;
import com.dcm.service.UserService;

@Controller
@SessionAttributes("name")
public class MainController {
	
	@Autowired
	private ActsService actsService;
	
	@Autowired
	private LawyerService lawyerService;
	
	@Autowired
	private ReminderService reminderService;
	
	@Autowired
	private EmailServiceImpl emailService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private CaseService caseService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private PayService payservice;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private UpdatecaseService updatecaseService;
	
	@Autowired
	private LogsService logsService;
	
	@Autowired
	private TestService testService;
	
	//Save the uploaded file to this folder
	private static String UPLOADED_FOLDER = "E:\\temp\\";


	@ResponseBody
	@RequestMapping("/mail")
	public String mail() throws MessagingException {
		String[] to = {"vikash0439@gmail.com"};
		emailService.sendMailWithAttachement(to);
		return "Mail sent Successfully";		
	}
	
	                     /* Spring Security */
	@RequestMapping("/")
	public String login() {	
		return "redirect:/home";		
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout) {

	  ModelAndView model = new ModelAndView();
	  if (error != null) {
		model.addObject("error", "Invalid username and password!");
	  }

	  if (logout != null) {
		model.addObject("msg", "Logged out successfully.");
	  }
	  model.setViewName("login");
	  return model;

	}
	
	@RequestMapping("/accessDenied")
	public String accessDenied() {

		return "accessDenied";
		
	}	
	
	
	@ResponseBody
	@RequestMapping("/count")
	public Long Count(HttpServletRequest request) {
		Long nol=lawyerService.noOfLawyer();
		System.out.println(nol);
		return nol;
		
	}
	
	@ResponseBody
	@RequestMapping("/countacts")
	public Long CountActs() {
		Long noa=actsService.noOfActs();
		System.out.println(noa);
		return noa;
		
	}
	
	@ResponseBody
	@RequestMapping("/countusers")
	public Long CountUsers() {
		Long nou=userservice.noOfUsers();
		System.out.println(nou);
		return nou;
		
	}
	
    
	@ResponseBody
	@RequestMapping("/countcases")
	public Long CountCases() {
		Long noc=caseService.noOfCases();
		System.out.println(noc);
		return noc;
		
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "test";
    }
 
    
    @RequestMapping(value = "/caseno", method = RequestMethod.GET)
    public @ResponseBody List<Case> caseno() {
        return caseService.AllCases();
    }
    
    @RequestMapping(value = "/field1", method = RequestMethod.GET)
    public @ResponseBody List<Test> field1() {
        return testService.showAllTest();
    }


	
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request, Principal principal, Model model) {
		 String name = principal.getName();
		 model.addAttribute("name", name);
		request.setAttribute("reminder", reminderService.AllReminder());
		return "home";
		
	}
	                   /* Users controller */
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/user")
	public String Users(HttpServletRequest request) {	
		request.setAttribute("users", userservice.showAllUsers());
		request.setAttribute("mode", "All_User");
		return "user";		
	}
	
	@RequestMapping("/newuser")
	public String NewUsers(HttpServletRequest request) {	
		request.setAttribute("mode", "New_User");
		return "user";		
	}
	
	@RequestMapping("/viewuser")
	public String ViewUsers(HttpServletRequest request, @RequestParam String name) {
		request.setAttribute("user", userservice.findUser(name));;
		request.setAttribute("mode", "View_User");
		return "user";		
	}
	
	@RequestMapping("/save-user")
	public String saveUsers(@ModelAttribute com.dcm.modal.Users user, BindingResult bindingResult) {
		userservice.saveUser(user);
		return "redirect:/user";		
	}
	
	
	                   /* Cases controller */
	@RequestMapping("/case")
	public String Case(HttpServletRequest request) {
		request.setAttribute("cases", caseService.AllCases());
		request.setAttribute("mode", "All_Cases");
		return "case";
		
	}
	
	@RequestMapping("/case-submit")
	public String SaveCase(@ModelAttribute com.dcm.modal.Case c, @ModelAttribute Payment payment, @RequestParam String advocate, @RequestParam String act, BindingResult bindingResult) {
		c.setPayment(payment);	
		System.out.println(advocate);
	    Lawyer lawyer1=lawyerService.findLawyer(advocate);
		c.setLawyer(lawyer1);	
		System.out.println(act);
		Acts acts1= actsService.findAct(act);
		c.setActs(acts1);
		caseService.SaveCase(c);
		return "redirect:/case";
		
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/newcase")
	public String NewCase(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("l", lawyerService.AllLawyerName());
		request.setAttribute("section", actsService.AllActsName());
		request.setAttribute("mode", "Add_Cases");
		return "case";
		
	}
	
	
	
	@RequestMapping("/view-cases")
	public String ViewCase(HttpServletRequest request, @RequestParam int id) {
		request.setAttribute("c", caseService.getCaseDetail(id));		
		System.out.println("hi "+caseService.getCaseDetail(id).getCaseno());
		request.setAttribute("document", documentService.showByCaseno(caseService.getCaseDetail(id).getCaseno()));
		request.setAttribute("reminder", reminderService.showByCaseno(caseService.getCaseDetail(id).getCaseno()));
		request.setAttribute("updatecase", updatecaseService.getBycaseno(caseService.getCaseDetail(id).getCaseno()));
		int paymentid=caseService.getCaseDetail(id).getPayment().getPaymentid();
		request.setAttribute("pay", payservice.getPay(paymentid));
		request.setAttribute("mode", "View_Cases");
		return "case";
		
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@ResponseBody
	@RequestMapping(path="/case-update", method=RequestMethod.POST)
	public void UpdateCase(@ModelAttribute com.dcm.modal.UpdateCase updatecase, BindingResult bindingResult, HttpServletRequest request) {
		
		updatecaseService.saveMyUpdateCaseDetail(updatecase);
		
	}
	
	@ResponseBody
	@RequestMapping("/lawyer-name")
    public String LawyerName(HttpServletRequest request, @RequestParam String name) {
		request.setAttribute("lawyer", lawyerService.findLawyer(name));		
		return "lawyer";
	}
	
	                          /* Lawyer controller */
	
	@RequestMapping("/lawyer")
	public String lawyer(HttpServletRequest request) {
		request.setAttribute("lawyer", lawyerService.showAllLawyer());
		request.setAttribute("mode", "All_Lawyer");
		return "lawyer";		
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/newlawyer")
	public String NewLawyer(HttpServletRequest request) {
		request.setAttribute("mode", "Add_Lawyer");
		return "lawyer";
		
	}
	
	@PostMapping("/save-lawyer")
	public String saveLawyer(@ModelAttribute Lawyer lawyer, BindingResult bindingResult) {
		lawyerService.saveMyLawyer(lawyer);
		return "redirect:/lawyer";
		
	}
	
	
	@RequestMapping("/viewlawyer")
	public String editLawyer(@RequestParam int lawyerid, HttpServletRequest request) {
		request.setAttribute("lawyer", lawyerService.editMyLawyer(lawyerid));	
		System.out.println("Hi " +lawyerService.editMyLawyer(lawyerid).getCases().toString());	
		request.setAttribute("mode", "View_Lawyer");	
		return "lawyer";
	}
	
	                     /* Acts controller */
	@RequestMapping("/acts")
	public String acts(HttpServletRequest request) {
		request.setAttribute("acts", actsService.showAllActs());
		request.setAttribute("mode", "All_Act");
		return "acts";	
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/newacts")
	public String NewActs(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("mode", "New_Act");
		return "acts";
		
	}
	
	
	@PostMapping("/saveact")
	public String registerAct(@ModelAttribute Acts act, BindingResult bindingResult, HttpServletRequest request) {
		actsService.saveMyAct(act);
		request.setAttribute("msg", "Acts saved into the system successfully");
		return "redirect:/acts";
		
	}
	
	                   /* Reminder controller */
	@RequestMapping("/reminder")
	public String reminder(HttpServletRequest request) {
		request.setAttribute("reminder", reminderService.showAllReminder());
		request.setAttribute("mode", "All_Reminder");
		return "reminder";	
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/newreminder")
	public String NewReminder(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("mode", "New_Reminder");
		return "reminder";
		
	}
	
	@PostMapping("/save-reminder")
	public String saveReminder(@ModelAttribute Reminder reminder, BindingResult bindingResult) {
		reminderService.saveReminder(reminder);
		return "redirect:/reminder";
		
	}
	
	                 /* Documents controller */
	@RequestMapping("/document")
	public String document(HttpServletRequest request) {
		request.setAttribute("reminder", reminderService.showAllReminder());
		 File directory = new File(UPLOADED_FOLDER);
	        //get all the files from a directory
	        File[] fList = directory.listFiles();
	        request.setAttribute("documents", fList);
	        request.setAttribute("document",documentService.showAllDocument());
	        request.setAttribute("mode", "All_Document");
		return "document";	
	}
	
	@PostMapping("/upload-document") // //new annotation since 4.3
    public String singleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, @ModelAttribute Document document,  BindingResult bindingResult) {
        System.out.println("Check 1");
		document.setFile(file.getOriginalFilename());
		System.out.println("Check 1");
        documentService.saveMyDocument(document);
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "There was no file provided to upload. Please select a file to upload");
            return "redirect:/document";
        }

        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

            redirectAttributes.addFlashAttribute("message",
                    "You successfully uploaded '" + file.getOriginalFilename() + "'");

        } catch (IOException e) {
            e.printStackTrace();
        }       
        return "redirect:/document";
    }
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/newdocument")
	public String NewDocument(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("mode", "New_Document");
		return "document";
		
	}
	
	
	           /*  Case-logs controller */
	
	@RequestMapping("/case-logs")
	public String CaseLogs(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("mode", "Case-Logs");
		return "case-logs";
	}
	

	@RequestMapping("/get-logs")
	public String getLogs(@RequestParam String caseno, HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("logs", logsService.getLog(caseno));
		request.setAttribute("mode", "Case-Logs");
		return "case-logs";
	}
	
	@PreAuthorize("hasAnyRole('ADMIN')")
	@RequestMapping("/add-logs")
	public String AddLogs(HttpServletRequest request) {
		request.setAttribute("title", caseService.CaseTitle());
		request.setAttribute("mode", "Add-logs");
		return "case-logs";
	}
	
	@PostMapping("/save-logs")
	public String saveLogs(@ModelAttribute Logs logs, @RequestParam String date, BindingResult bindingResult, HttpServletRequest request) {
		System.out.println("From log input "+date);
		request.setAttribute("msg", "Logs Entries Updated Seccessfully");
		logsService.saveLogs(logs);
		return "redirect:/add-logs";
		
	}
	
	 
	       /* Payment */
	@PreAuthorize("hasAnyRole('ADMIN')")
	@ResponseBody
	@RequestMapping(path="/payment-update", method=RequestMethod.POST)
	public void PaymentUpdate(HttpServletRequest request,  @ModelAttribute Payment payment) {
		
		paymentService.UpdatePaymentById(payment);
	
		
	}
}
