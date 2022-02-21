package kr.or.ddit.accept.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.service.AcceptMemberService;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.member.service.MailService;

@Controller
@RequestMapping("admin/mem")
public class AcceptMemberController {
	
	@Inject
	private AcceptMemberService service;
	
	@Inject
	private PasswordEncoder encoder;
	
	@Autowired
    private MailService mailService;
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
	
	@RequestMapping(value = "accept/{memId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult memberAccept(
				@PathVariable String memId
			) {
		ServiceResult result = service.acceptMember(memId);
		
		return result;
	}
	
	@RequestMapping(value = "allAccept", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult allAccept(
				String[] memId
			) {
		ServiceResult result = null;
		
		result = service.allAcceptMember(memId);
		
		return result;
	}
	
	@RequestMapping(value = "refuse", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult memberRefuse(
				String memId,
				String memEmail,
				String content,
				String memberPass,
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		ServiceResult result = null;
		AcceptMemberVO authMem = wrapper.getAdaptee();
		String memPass = authMem.getMemPass();
		if(!encoder.matches(memberPass, memPass)) {
			result = ServiceResult.INVALIDPASSWORD;
		}else {
			result = service.refuseMember(memId);
			if(ServiceResult.OK.equals(result)) {
				result = ServiceResult.OK;
				StringBuffer sb = new StringBuffer();
				sb.append("<h1>반려안내</h1>");
				sb.append("<hr>");
				sb.append("<p>※다음과 같은 이유로 반려 되었습니다※</p><p>*반려사유");
				sb.append(content);
				sb.append("</p>");
				sb.append("<p>-해당 계정은 자동 삭제 처리 되었으며 재가입하여 주시기 바랍니다-");
				sb.append("<hr>");
				
				
				boolean mail = mailService.send("120bpm 가입 승인 반려 안내", sb.toString(), "ykj7633@gmail.com", memEmail);
				
			}
		}
		System.out.println(result);
		return result;
		
	}
}
