package kr.or.ddit.security.service;

import java.util.List;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;

public interface SecurityService {

	/**
	 * 자원과 자원 매핑가져오기
	 * @return
	 */
	public List<ResourceVO> selectAllSortedResources();

	/**
	 * 역할 리스트 조회
	 * @return
	 */
	public List<AuthorityVO> retrieveRoleList();
	
	/**
	 * 프로젝트 역할 생성 month
	 * @param roleId
	 * @return
	 */
	public List<Integer> roleProjectMonthCnt(String roleId);
	
	/**
	 * 하나의 역할 상세조회
	 * @param roleId
	 * @return
	 */
	public AuthorityVO retrieveRole(String roleId);

	/**
	 * 모든 자원과 자원에 매핑된 역할 조회
	 * @return
	 */
	public List<ResourceVO> retrieveResourceList();
	
	/**
	 * 하나의 역할에 대한 권한 수정
	 * @return
	 */
	public ServiceResult updateResourceMapping(AuthorityVO auth);
	
	/**
	 * 프로젝트의 보호자원내용 가져오기
	 * @return
	 */
	public List<ResourceVO> retrieveProjectResource();
	
	/**
	 * 역할 생성
	 * @return
	 */
	public ServiceResult createRole(AuthorityVO auth);
	
	/**
	 * 역할 중복체크
	 * @param authNm
	 * @return
	 */
	public boolean authCheck(String authNm);

	/**
	 * 역할 삭제
	 * @param role
	 * @return
	 */
	public ServiceResult removeRole(String role);
	
	/**
	 * 역할별 프로젝트 갯수
	 * @return
	 */
	public List<AuthorityVO> authProjectCnt();
	
	/**
	 * 역할별 권한 갯수
	 * @return
	 */
	public List<AuthorityVO> roleAuthCnt();

	/**
	 * 역할별 프로젝트에 할당된 인원 조회
	 * @return
	 */
	public List<ProjectMemVO> retrieveProjectMem();
	
	/**
	 * level2인 보호자원 리스트 가져오기 
	 * @return
	 */
	public List<ResourceVO> retrieveLevel2Res();
}
