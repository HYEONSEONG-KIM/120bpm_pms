package kr.or.ddit.pushMsg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;

@Mapper
public interface PushMsgDAO {
	
	/**
	 * 푸쉬알림 저장(한번에 한명)
	 * @return
	 */
	public int insertPushMsg(PushMsgVO pushMsg);
	
	/**
	 * 푸쉬알림 저장(한번에 여러명)
	 * @param pushMsg
	 * @return
	 */
	public int insertAllPushMsg(List<PushMsgVO> pushMsg);
	
	/**
	 * 한회원의 푸쉬알림(1~5개)
	 * @param memId
	 * @return
	 */
	public List<PushMsgVO> msgList(String memId);

	/**
	 * 한회원의 전체 푸쉬알림
	 * @param memId
	 * @return
	 */
	public List<PushMsgVO> allMsgList(String memId);
	
	/**
	 * 회원의 푸쉬알림 설정 정보 가져오기
	 * @param memId
	 * @return
	 */
	public List<MemSetVO> memSetList();
}
