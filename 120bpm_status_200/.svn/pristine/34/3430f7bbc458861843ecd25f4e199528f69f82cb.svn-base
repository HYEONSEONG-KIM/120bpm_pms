package kr.or.ddit.chatting.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.chatting.dao.ChattingDAO;
import kr.or.ddit.chatting.service.ChattingService;
import kr.or.ddit.chatting.vo.ChatRoomVO;
import kr.or.ddit.chatting.vo.MessageVO;

@Controller
@RequestMapping("project/{prtId}")
public class ChattingController {

	@Inject
	private ChattingService service;
	
	@Inject
	private ChattingDAO dao;

	@RequestMapping("chatting")
	public String chatRoomForm(
				@PathVariable int prtId,
				Model model
			) {
//		ProjectMemVO prtMem = new ProjectMemVO();
//		prtMem.setPrjctNo(prtId);
//		
//		List<ChatRoomVO> chatRoom = service.chatRoomList(prtMem);
		String chatRoom = dao.chatRoomNo(prtId);
		List<MessageVO> msgList = service.messageList(chatRoom);

		model.addAttribute("msgList", msgList);
		
		return "chatting/chatRoom";
	}
}











