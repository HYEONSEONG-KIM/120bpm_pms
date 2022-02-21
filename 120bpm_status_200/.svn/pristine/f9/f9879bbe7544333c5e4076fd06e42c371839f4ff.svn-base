package kr.or.ddit.security.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.security.vo.AuthorityVO;

@Mapper
public interface AuthorityDAO {
	
	/**
	 * 역할 계층 구조 조회
	 * @return
	 */
	public List<String> roleHierarchy();
	
	/**
	 * 모든 역할 조회
	 * @return
	 */
	public List<AuthorityVO> selectAllRole();
	
	/**
	 * 하나의 역할 조회
	 * @param roleId
	 * @return
	 */
	public AuthorityVO selectRole(String roleId);
	
	/**
	 * 역할 생성
	 * @param role
	 * @return
	 */
	public int insertRole(AuthorityVO role);
	
	/**
	 * 역할 중복 체크
	 * @param authNm
	 * @return
	 */
	public AuthorityVO autorCheck(String authNm);
	
	/**
	 * 역할 삭제
	 * @param role
	 * @return
	 */
	public int deleteRole(String role);
	
	/**
	 * 역할별 프로젝트에 포함된 카운트 조회
	 * @return
	 */
	public List<AuthorityVO> authProjectCnt();
	
	/**
	 * 전체 프로젝트 갯수
	 * @return
	 */
	public int totalProject();
	

}
