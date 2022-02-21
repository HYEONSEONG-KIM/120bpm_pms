package kr.or.ddit.work.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkRepVO;

@Mapper
public interface WorkRepDAO {

		public List<WorkRepVO> selectWorkRepList(ExtendPagingVO<WorkRepVO> pagingVO);
	
		public int selectWorkRepTotal(ExtendPagingVO<WorkRepVO> pagingVO);
		//삭제
		//아이디만 일치하면 삭제하도록 처리
		public int deleteWorkRep(WorkRepVO workRepVO);
		//아이디만 일치하면 수정하도록 처리
		public int modifyWorkRep(WorkRepVO workRepVO);
		//댓글 추가
		public int insertWorkRep(WorkRepVO workRepVO);
		
		public WorkRepVO selectWorkRepInfo(WorkRepVO workRepVO);
}
