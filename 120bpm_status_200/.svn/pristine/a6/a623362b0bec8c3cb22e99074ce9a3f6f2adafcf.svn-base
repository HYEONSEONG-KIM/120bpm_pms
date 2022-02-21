package kr.or.ddit.work.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.work.vo.WorkFileVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface WorkFileDAO {
	  //첨부파일 상태 변경 
	//일감 파일이 있을 때 파일 템프 파일에서 변경 시켜야함 
    public int workFileUpdate(WorkVO workVO);
    //파일이 존재할 때 파일 업로드 할 수 있도록 함 
    public int insertWorkFile(WorkVO workVO);
    
    public int deleteALLWorkFile(WorkVO workVO);//workFileList // 워크 파일 테이블의 자료 삭제
    public int deleteALLAttatch(WorkVO workVO);//attatchFileVO 파일 삭제
    
    public int deleteAttatches(WorkVO workVO); //선택 삭제 
    public int deleteWorkFile(WorkVO workVO);
    
    public WorkFileVO selectWorkFileInfo(String delFile);
    
}
