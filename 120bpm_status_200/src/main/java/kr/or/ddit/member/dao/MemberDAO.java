package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.member.vo.CareerVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

@Mapper
public interface MemberDAO {
	
	public int selectTotalRecord(PagingVO<MemberVO> memberPagingInfo);
	
	/**
	 * 회원목록조회
	 * @param pagingVO  = memberPagingInfo
	 * @return 없으면 size==0
	 */
	public List<MemberVO> selectMemberList(PagingVO<MemberVO> memberPagingInfo);

	public MemberVO selectMemberById(String memId);
	public int insertMember(MemberVO memberInfo);
	public int insertCareers(@Param("list") List<CareerVO> careerList);
} 
