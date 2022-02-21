package kr.or.ddit.chatting.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.chatting.dao.ChattingDAO;
import kr.or.ddit.chatting.vo.ChatRoomVO;
import kr.or.ddit.chatting.vo.MessageVO;
import kr.or.ddit.enumtype.ServiceResult;

@Service
public class ChattingServiceImple implements ChattingService{

	@Inject
	private ChattingDAO dao;
	
	@Override
	public List<ChatRoomVO> chatRoomList(ProjectMemVO prtMem) {
		return dao.selectChatRoom(prtMem);
	}

	@Override
	public List<MessageVO> messageList(String chatRoom) {
		return dao.messageList(chatRoom);
	}

	@Override
	@Transactional
	public ServiceResult messageInsert(MessageVO msg) {
		
		ServiceResult result = null;
		
		int rowCnt = dao.insertMsg(msg);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

}
