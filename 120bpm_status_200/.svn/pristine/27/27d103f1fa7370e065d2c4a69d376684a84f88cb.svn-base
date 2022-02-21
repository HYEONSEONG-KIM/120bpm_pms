package kr.or.ddit.security.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;

@Mapper
public interface ResourceDAO {

	/**
	 * 자원과 자원역할패핑 태이블 조인하여 자원에 어떤 역할을 허용 하는가에 대한 정보
	 * @return
	 */
	public List<ResourceVO> selectAllSortedResources();
	
	/**
	 * 프로젝트에서 하나의 역할을 등록했을때의 month
	 * @return
	 */
	public List<ProjectMemVO> selectProjectRoleMonth(String role);
	
	/**
	 * 모든 보호자원과 그에 매핑된 역할 조회
	 * @return
	 */
	public List<ResourceVO> selectAllResource();
	
	/**
	 * 하나의 역할에 해당하는 권한 수정을 위한 삭제작업
	 * @param author
	 * @return
	 */
	public int deleteResourceMapping(AuthorityVO author);

	/**
	 * 하나의 역할에 해당하는 권한 수정을 위한 insert작업
	 * @param author
	 * @return
	 */
	public int insertResourceMapping(AuthorityVO author);

	/**
	 * 프로젝트에 해당하는 보호자원 가져오기
	 * @return
	 */
	public List<ResourceVO> seleteProjectResource();
	
	/**
	 * 한 역할에 대해 몇명의 유저가 할당 되었는지 알기위해 프로젝트 멤버 조회
	 * @return
	 */
	public List<ProjectMemVO> selectProjectMem();

	/**
	 * level2인 보호자원 리스트 가져오기
	 * @return
	 */
	public List<ResourceVO> selectLevel2Res();
}
