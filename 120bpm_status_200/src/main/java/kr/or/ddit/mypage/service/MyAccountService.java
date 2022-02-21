package kr.or.ddit.mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.commons.exception.UserNotFoundExcpetion;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.vo.CareerListVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.mypage.vo.MyCareerVO;
import kr.or.ddit.mypage.vo.MyMemVO;

public interface MyAccountService {
	
	/**
	 * 내 정보 조회
	 * @param memId
	 * @return  사용자 없으면 {@link UserNotFoundExcpetion}
	 */
	public MyMemVO retrieveMyAccountInfo(String memId);
	
	/** 
	 * 내 경력사항 조회
	 * @param memId
	 * @return 사용자 없으면 {@link UserNotFoundExcpetion}
	 */
	public List<MyCareerVO> retrieveMyCareer(String memId);
	
	/**
	 * 내 정보 수정
	 * @param mem 
	 * @return  사용자 없으면 {@link UserNotFoundExcpetion}, OK, FAIL
	 */
	public ServiceResult modifyMyAccountInfo(MyMemVO mem);
	
	/**
	 * 내 경력사항 수정
	 * @param mem
	 * @return
	 */
	public ServiceResult modifyMyCareer(CareerListVO vo); 
	
	/**
	 * 내 경력사항 삭제
	 * @param career
	 * @return
	 */
	public ServiceResult removeCareer(CareerListVO career);
	
	/**
	 * 비밀번호 수정
	 * @param oldPassword 기존 비밀번호
	 * @param newPassword 신규 비밀번호
	 * @return 
	 */
	public ServiceResult changePassword(String oldPassword, String newPassword);
	
	/**
	 * 마이페이지 프로필 설정 수정
	 * @param mem
	 * @return
	 */
	public int modifyMyProfileSetting(MyMemVO mem);
	
	public List<MemSetVO> retrieveMyProfileSet(String memId);
	
	public ServiceResult modifyMyProfileSet(MyMemVO memSet);
	
	public List<MemSetVO> retrieveMyPushSet(String memId);
	 
	public ServiceResult modifyMyPushSet(MyMemVO memSet);
}
