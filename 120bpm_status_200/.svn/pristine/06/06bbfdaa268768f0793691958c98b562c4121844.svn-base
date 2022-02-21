package kr.or.ddit.chatting.service;

import java.util.List;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.chatting.vo.ChatRoomVO;
import kr.or.ddit.chatting.vo.MessageVO;
import kr.or.ddit.enumtype.ServiceResult;

public interface ChattingService {
	
	
	/**
	 * 채팅방 정보 리스트 조회
	 * @param prtMem
	 * @return
	 */
	public List<ChatRoomVO> chatRoomList(ProjectMemVO prtMem);
	
	
	/**
	 * 채팅방 메세지 가져오기
	 * @param chatRoom
	 * @return
	 */
	public List<MessageVO> messageList(String chatRoom);

	/**
	 * 채팅방 메세지 insert
	 * @param msg
	 * @return
	 */
	public ServiceResult messageInsert(MessageVO msg);
}
