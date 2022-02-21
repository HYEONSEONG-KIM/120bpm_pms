package kr.or.ddit.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.exception.UserNotFoundExcpetion;
import kr.or.ddit.mypage.vo.CareerListVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.mypage.vo.MyCareerVO;
import kr.or.ddit.mypage.vo.MyMemVO;

@Mapper
public interface MyAccountDAO { 
	/**
	 * 내 정보 조회
	 * @param memId
	 * @return 사용자 없으면 {@link UserNotFoundExcpetion}
	 */
	public MyMemVO selectMyAccountInfo(String memId);
	
	/**
	 * 내 경력사항 조회
	 * @param memId
	 * @return 사용자 없으면 {@link UserNotFoundExcpetion}
	 */
	public List<MyCareerVO> selectMyCareer(String memId); 
	 
	/**
	 * 내 정보 수정
	 * @param mem
	 * @return >0 성공, 사용자 없으면 {@link UserNotFoundExcpetion}
	 */
	public int updateMyAccountInfo(MyMemVO mem);
	
	/**
	 * 내 경력사항 추가
	 * @param mem 
	 * @return
	 */
	public int insertMyCareer(CareerListVO vo);
	
	/**
	 * 내 경력사항 수정
	 * @param myCareer
	 * @return 
	 */
	public int updateCareer(MyCareerVO myCareer);
	
	
	/**
	 * 내 경력사항 삭제
	 * @param career 
	 * @return
	 */
	public int deleteCareer(CareerListVO career);
	
	/**
	 * 비밀번호 수정
	 * @param mem
	 * @return > 성공
	 */ 
	public int updateMyPassword(MyMemVO mem);
	
	/**
	 * 마이페이지 프로필 이미지 수정
	 * @return 
	 */ 
	public int updatetMyProfileImg(MyMemVO mem);
	
	/**
	 * 마이페이지 프로필 설정 목록 조회
	 * @param memId
	 * @return
	 */
	public List<MemSetVO> selectMyProfileSet(String memId);
	
	/**
	 * 마아페이지 프로필 설정 수정
	 * @param set
	 * @return 
	 */
	public int updateMyProfileSet(MemSetVO memSet);
	
	/**
	 * 마이페이지 푸시알림 설정 목록 조회
	 * @param memId
	 * @return
	 */
	public List<MemSetVO> selectMyPushSet(String memId);
	
	
	/**
	 * 마이페이지 푸시알림 설정 수정
	 * @param memSet
	 * @return
	 */
	public int updateMyPushSet(MemSetVO memSet);
}
