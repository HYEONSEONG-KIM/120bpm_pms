package kr.or.ddit.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.SMSService;

@Controller
public class SMSController {
	
	@Autowired
    private SMSService smsService;
 
    //sms인증
  	@RequestMapping(value = "/sendSMS/authSMS")
    @ResponseBody
    public String sendSMS(HttpSession session, @RequestParam String sms) {
	
	  	  Random rand  = new Random();
	      String numStr = "";
	      for(int i=0; i<4; i++) {
	          String ran = Integer.toString(rand.nextInt(10));
	          numStr+=ran;
	      }
	      
	      System.out.println("수신자 번호 : " + sms);
	      System.out.println("인증번호 : " + numStr);
	      smsService.certifiedPhoneNumber(sms,numStr);
	      
	      //session 정보저장.
	      session.setAttribute("joinCode", numStr);
	      session.setAttribute("isAuthJoin", false);
      	
      	
	      return numStr;
	      
  	}
}

	