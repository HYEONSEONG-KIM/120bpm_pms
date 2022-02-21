package kr.or.ddit.pushMsg.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.pushMsg.dao.PushMsgDAO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;

@Controller
@RequestMapping("push")
public class PushMsgRetrieveController {

	@Inject
	private PushMsgDAO dao;

	@RequestMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<PushMsgVO> msgList(
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){
		AcceptMemberVO auth = wrapper.getAdaptee();
		List<PushMsgVO> msgList = dao.msgList(auth.getMemId());
		
		return msgList;
		
	}
}
