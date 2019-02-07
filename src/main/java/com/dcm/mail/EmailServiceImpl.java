package com.dcm.mail;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.dcm.modal.Reminder;
import com.dcm.modal.UpdateCase;
import com.dcm.service.ReminderService;
import com.dcm.service.UpdatecaseService;

@Component
public class EmailServiceImpl {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Autowired
	private ReminderService reminderService;	

	@Autowired
	private UpdatecaseService updatecaseService;
  
    @Autowired
    public JavaMailSender emailSender; 
 
    public void sendSimpleMessage(String to) throws MessagingException{
    	
        SimpleMailMessage message = new SimpleMailMessage(); 
        message.setTo(to); 
        message.setSubject("Test Mail from Legal"); 
        message.setText("Please ignore");
        emailSender.send(message);   
         
    }
    
    public void sendMailWithAttachement( String[] to) throws MessagingException {
     
  	MimeMessage message = emailSender.createMimeMessage();
//      List<Reminder> reminder = reminderService.MailReminder();  
  	List<Reminder> reminder = reminderService.MailReminderwithTime();
      if(reminder.isEmpty()) {
    	  System.out.println("No reminders");
    	  
      }else {
    	 
      String m = "<html><h3><b>Namaste!</b></h3><p>Legal-cases reminder : </p><br><br><table style=\"\r\n" + 
      		 
      		"    text-align:  center;     border: 1px solid #ddd; font-family: arial, sans-serif; border-collapse: collapse;\r\n" + 
      		"\">\r\n" + 
      		"                      <thead style=\" background-color: #17a2b8; color: #fff;\" class=\"thead-light\">\r\n" + 
      		"                            <th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"20%\">Case No</th>\r\n" + 
      		"							<th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"55%\">Brief</th>\r\n" + 
      		"							<th  style=\" border: 1px solid #ddd; padding: 15px;\" width=\"15%\">Type</th>\r\n" + 
      		"                          \r\n" + 
      		"                        </tr>\r\n" + 
      		"                      </thead>" +  	  	
		    "<tbody>\r\n"; 
		for(Reminder reminder1: reminder) { 
			
			m = m + "						<tr>\r\n" + 
		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\" ><strong>"+reminder1.getCaseno()+"</strong></td>\r\n" + 
		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+reminder1.getBrief()+"</td>\r\n" + 
		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+reminder1.getType()+ "</td>\r\n" + 
		      		"						</tr>						\r\n" ;
		}
		
		m = m + "					</tbody>\r\n" + 
	      	     
 		"                    </table>\r\n" + 
 		"                  </div>\r\n" + 
 		"                </div>\r\n" + 
 		"              </div>\r\n" + 
 		"              <!--/.col-->\r\n" + 
 		"            </div><br><br><h3>Thanks & Regards</h3><p>DCM Textiles </p><br><br>"+		
 		
 		"</body>\r\n" + 
 		"</html>";
			
					
      MimeMessageHelper helper = new MimeMessageHelper(message, true);      
      helper.setTo(to);
      helper.setSubject("Reminder from Legal Software");     
      helper.setText("Hi from text plain value", m);
      
// 
//      FileSystemResource file = new FileSystemResource(new File("../../static/img/dcm.jpeg"));
//      helper.addAttachment("Smile.jpeg", file);  
      
      emailSender.send(message);
      } 
  }
    
    public void hearingReminder( String[] to) throws MessagingException {
        
      	MimeMessage message = emailSender.createMimeMessage();
      	
          List<UpdateCase> caseReminder = updatecaseService.HearingReminder();  
          if(caseReminder.isEmpty()) {
        	  System.out.println("No reminders");
        	  LOGGER.info("No reminders today");
          }else {
        	  LOGGER.info("Reminders sent today");
          String rem = "<html><h3><b>Namaste!</b></h3><p>Folllowing are the upcoming hearings dates reminder : </p><br><br><table style=\"\r\n" + 
          		 
          		"    text-align:  center;     border: 1px solid #ddd; font-family: arial, sans-serif; border-collapse: collapse;\r\n" + 
          		"\">\r\n" + 
          		"                      <thead style=\" background-color: #007bff; color: #fff;\" class=\"thead-light\">\r\n" + 
          		"                            <th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"20%\">NDOH</th>\r\n" + 
          		"							<th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"25%\">Case No</th>\r\n" + 
          		"							<th  style=\" border: 1px solid #ddd; padding: 15px;\" width=\"55%\">Title</th>\r\n" + 
          		"							<th  style=\" border: 1px solid #ddd; padding: 15px;\" width=\"55%\">LDOH</th>\r\n" + 
          		"							<th  style=\" border: 1px solid #ddd; padding: 15px;\" width=\"55%\">Status</th>\r\n" + 

          		"                          \r\n" + 
          		"                        </tr>\r\n" + 
          		"                      </thead>" +  	  	
    		    "<tbody>\r\n"; 
    		for(UpdateCase ndoh: caseReminder) { 
    			
    			rem = rem + "						<tr>\r\n" + 
    		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\" ><strong>"+ndoh.getNexthearing()+"</strong></td>\r\n" + 
    		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+ndoh.getCaseno()+"</td>\r\n" + 
    		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+ndoh.getTitle()+ "</td>\r\n" + 
    		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+ndoh.getLasthearing()+ "</td>\r\n" + 
    		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+ndoh.getStatus()+ "</td>\r\n" + 

    		      		"						</tr>						\r\n" ;
    		}
    		
    		rem = rem + "					</tbody>\r\n" + 
    	      	     
     		"                    </table>\r\n" + 
     		"                  </div>\r\n" + 
     		"                </div>\r\n" + 
     		"              </div>\r\n" + 
     		"              <!--/.col-->\r\n" + 
     		"            </div><br><br><h3>Thanks & Regards</h3><p>DCM Textiles </p><br><br>"+		
     		
     		"</body>\r\n" + 
     		"</html>";
    			
    					
          MimeMessageHelper helper = new MimeMessageHelper(message, true);      
          helper.setTo(to);
          helper.setSubject("Upcoming Legal cases hearing-dates reminder from Legal Software");     
          helper.setText("Hi from text plain value", rem); 
          
          emailSender.send(message);
          } 
      }
}