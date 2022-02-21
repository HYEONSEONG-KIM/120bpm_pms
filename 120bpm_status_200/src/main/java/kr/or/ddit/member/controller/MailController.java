package kr.or.ddit.member.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MailService;

@Controller
public class MailController {
    @Inject
    private MailService mailService;

    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
    
    @Value("${email.sendId}")
    private String id;
    
    // 회원가입 이메일 인증
    @RequestMapping(value = "/sendMail/auth", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String sendMailAuth(HttpSession session, @RequestParam String email) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");

        boolean result = mailService.send(subject, sb.toString(), id, email);
        if (result == true) {
        	
        	//session 정보저장
        	session.setAttribute("joinCode", joinCode);
        	session.setAttribute("isAuthJoin", false);
        	
        	return joinCode;
        }
        return "fail";
    }
}