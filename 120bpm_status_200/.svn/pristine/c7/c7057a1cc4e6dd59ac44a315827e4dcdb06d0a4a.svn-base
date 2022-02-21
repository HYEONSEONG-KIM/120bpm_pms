package kr.or.ddit.member.service;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

//MailService Interface 구현 클래스
@Service
public class MailServiceImpl implements MailService {

	@Inject
    private JavaMailSender javaMailSender;

    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public boolean send(String subject, String text, String from, String to) {
        // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            //제목 설정
            helper.setSubject(subject);
            //본문 설정
            helper.setText(text, true);
            //송신 주소 설정
            helper.setFrom(from);
            helper.setTo(to);

            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

//	@Override
//	public boolean sendHTML(String subject, String test, String from, String to) {
//		MimeMessage message = javaMailSender.createMimeMessage();
//		
//		try {
//			MimeMessageHelper helper = new MimeMessageHelper(message,true, "UTF-8");
//			helper.setText(test, true);
//			helper.se
//			
//			
//		} catch (MessagingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return false;
//	}
//    
    
}