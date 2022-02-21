package kr.or.ddit.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Mapper
public interface MyProjectsDAO {
	
	/**
	 * 총 레코드 수 조회
	 * @param paging
	 * @return
	 */
	public int totalRecord(MakeProjectPagingVO<MakeProjectVO> paging);
	
	/**
	 * 내 프로젝트 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<MakeProjectVO> selectProjectList(MakeProjectPagingVO<MakeProjectVO> paging);
	
	
}
