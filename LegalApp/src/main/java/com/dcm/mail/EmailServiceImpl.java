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
import com.dcm.service.ReminderService;

@Component
public class EmailServiceImpl {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Autowired
	private ReminderService reminderService;
  
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
      List<Reminder> reminder = reminderService.MailReminder();  
      if(reminder.isEmpty()) {
    	  System.out.println("No reminders");
    	  LOGGER.info("No reminders today");
      }else {
    	  LOGGER.info("Reminders sent today");
      String m = "<html><h3><b>Namaste!</b></h3><p>Reminders for tomorrow's are : </p><br><br><table style=\"\r\n" + 
      		 
      		"    text-align:  center;     border: 1px solid #ddd; font-family: arial, sans-serif; border-collapse: collapse;\r\n" + 
      		"\">\r\n" + 
      		"                      <thead style=\" background-color: #17a2b8; color: #fff;\" class=\"thead-light\">\r\n" + 
      		"                            <th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"20%\">Case No</th>\r\n" + 
      		"							<th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"10%\">Date</th>\r\n" + 
      		"							<th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"10%\">Time</th>\r\n" + 
      		"							<th style=\" border: 1px solid #ddd; padding: 15px;\" width=\"55%\">Brief</th>\r\n" + 
      		"							<th  style=\" border: 1px solid #ddd; padding: 15px;\" width=\"15%\">Type</th>\r\n" + 
      		"                          \r\n" + 
      		"                        </tr>\r\n" + 
      		"                      </thead>" +  	  	
		    "<tbody>\r\n"; 
		for(Reminder reminder1: reminder) { 
			
			m = m + "						<tr>\r\n" + 
		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\" ><strong>"+reminder1.getCaseno()+"</strong></td>\r\n" + 
		      		"                           <td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+reminder1.getDate()+ "</td>\r\n" +
		      		"							<td style=\" border: 1px solid #ddd; padding: 15px; color: #212529;\">"+reminder1.getTime()+ "</td>\r\n" + 
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
      helper.setSubject("Tomorrow's reminder from Legal Software");     
      helper.setText("Hi from text plain value", m);
      
// 
//      FileSystemResource file = new FileSystemResource(new File("../../static/img/dcm.jpeg"));
//      helper.addAttachment("Smile.jpeg", file);  
      
      emailSender.send(message);
      } 
  }
}