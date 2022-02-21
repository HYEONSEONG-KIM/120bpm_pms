package kr.or.ddit.listener;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import kr.or.ddit.accept.dao.AcceptDao;
import kr.or.ddit.accept.vo.LogginInfoVO;
import lombok.extern.slf4j.Slf4j;

@Component
public class LoginSucessHandler extends SimpleUrlAuthenticationSuccessHandler{



	@Inject
	private AcceptDao dao;
	
	public LoginSucessHandler(String defualURL) {
		super(defualURL);
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		User user = (User) authentication.getPrincipal();
		
		
		String id = user.getUsername();
		String ip = request.getRemoteAddr();
		String sessionId = request.getSession().getId();
		
		int pushCnt = dao.memPushCnt(id);
		
		LogginInfoVO log = new LogginInfoVO();
		log.setIpAddr(ip);
		log.setMemId(id);
		log.setSesionId(sessionId);

		dao.insertLog(log);
		dao.updateLastLoginDate(log.getMemId());
		
		request.getSession().setAttribute("loginSuccess", "loginSuccess");  
		request.getSession().setAttribute("pushCnt", pushCnt);
		super.onAuthenticationSuccess(request, response, authentication);
		
	}

}
