package kr.or.ddit.chatting.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.chatting.vo.ChatRoomVO;
import kr.or.ddit.chatting.vo.MessageVO;

@Mapper
public interface ChattingDAO {
	
	/**
	 * 프로젝트 내 채팅방 리스트 조회
	 * @param prtMem
	 * @return
	 */
	public List<ChatRoomVO> selectChatRoom(ProjectMemVO prtMem);
	
	/**
	 * 채팅방의 메세지 가져오기
	 * @param chatRoomNo
	 * @return
	 */
	public List<MessageVO> messageList(String chatRoomNo);
	
	/**
	 * 하나의 프로젝트에 하나의 채팅방이 있다고 했을때 채팅방 코드 가져오기
	 * @param prtId
	 * @return
	 */
	public String chatRoomNo(int prtId);
	
	
	/**
	 * 메세지 insert
	 * @param msg
	 * @return
	 */
	public int insertMsg(MessageVO msg);
	
}
