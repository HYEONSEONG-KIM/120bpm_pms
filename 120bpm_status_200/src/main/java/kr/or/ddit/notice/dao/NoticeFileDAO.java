package kr.or.ddit.notice.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.notice.vo.NoticeVO;

@Mapper
public interface NoticeFileDAO {
	 //첨부파일 상태 변경 
	//일감 파일이 있을 때 파일 템프 파일에서 변경 시켜야함 
  public int noticeFileUpdate(NoticeVO noticeInfo);
  //파일이 존재할 때 파일 업로드 할 수 있도록 함 
  public int insertNoticeFile(NoticeVO noticeInfo);
  
  public int deleteALLNoticeFile(NoticeVO noticeInfo);//noticeFileList // 워크 파일 테이블의 자료 삭제
  public int deleteALLAttatch(NoticeVO noticeInfo);//attatchFileVO 파일 삭제
  
  public int deleteAttatches(NoticeVO noticeInfo); //선택 삭제 
  public int deleteNoticeFile(NoticeVO noticeInfo);
  
  public NoticeFileVO selectNoticeFileInfo(String delFile);
	
	
}
