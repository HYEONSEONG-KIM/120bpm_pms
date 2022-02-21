package kr.or.ddit.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.commons.exception.DeleteImpossibleException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.security.ReloadableFilterInvocationSecurityMetadataSource;
import kr.or.ddit.security.dao.AuthorityDAO;
import kr.or.ddit.security.dao.ResourceDAO;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;
import oracle.net.aso.a;

@Service
public class SecurityServiceImpl implements SecurityService {

	@Inject
	private ResourceDAO resDAO;
	
	@Inject
	private AuthorityDAO authDAO;
	
	@Inject
	private ReloadableFilterInvocationSecurityMetadataSource metaSource;
	
	@Override
	public List<ResourceVO> selectAllSortedResources() {
		return resDAO.selectAllSortedResources();
	}

	@Override
	public List<AuthorityVO> retrieveRoleList() {
		return authDAO.selectAllRole();
	}

	@Override
	public List<Integer> roleProjectMonthCnt(String roleId) {
		List<ProjectMemVO> prjtRoleMonth = resDAO.selectProjectRoleMonth(roleId);
		List<Integer> monthList = new ArrayList<Integer>();
		for(int i = 1; i <= 12; i++) {
			int cnt = 0;
			for(int j = 0; j < prjtRoleMonth.size(); j++) {
				if(i == prjtRoleMonth.get(j).getCreateMonth()) {
					cnt++;
				}
			}
			monthList.add(cnt);
		}
		
		return monthList;
	}

	@Override
	public AuthorityVO retrieveRole(String roleId) {
		return authDAO.selectRole(roleId);
	}

	@Override
	public List<ResourceVO> retrieveResourceList() {
		return resDAO.selectAllResource();
	}

	@Override
	@Transactional
	public ServiceResult updateResourceMapping(AuthorityVO auth) {
		
		ServiceResult result = null;
		String[] resource = auth.getResrceCode();
		
		int rowCnt = resDAO.deleteResourceMapping(auth);
		
		if(resource != null && resource.length > 0) {
			rowCnt += resDAO.insertResourceMapping(auth);
		}
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
			metaSource.reload();
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public List<ResourceVO> retrieveProjectResource() {
		return resDAO.seleteProjectResource();
	}

	@Override
	@Transactional
	public ServiceResult createRole(AuthorityVO auth) {
		
		ServiceResult result = null;
		
		int rowCnt = authDAO.insertRole(auth);
		String[] resource = auth.getResrceCode();
		
		if(resource != null && resource.length > 0) {
			rowCnt += resDAO.insertResourceMapping(auth);
		}
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public boolean authCheck(String authNm) {
		
		AuthorityVO auth = authDAO.autorCheck(authNm);
		boolean result = false;
		
		if(auth == null) {
			result = true;
		}else {
			result = false;
		}
		
		return result;
	}

	@Override
	@Transactional
	public ServiceResult removeRole(String role) {
		
		ServiceResult result = null;
		
		AuthorityVO auth =  authDAO.selectRole(role);
		
		if(auth == null) {
			result = ServiceResult.NOTEXIST;
		}else if(auth.getProjectCnt() != 0) {
			result = ServiceResult.DELETEIMPOSSIBLE;
		}else {
			int rowCnt = resDAO.deleteResourceMapping(auth);
			rowCnt += authDAO.deleteRole(role);
			
			if(rowCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAIL;
			}
		}
		
		return result;
	}

	@Override
	public List<AuthorityVO> authProjectCnt() {

		List<AuthorityVO> authList = authDAO.authProjectCnt();
		double totlaCnt = authDAO.totalProject() + 0.0;
		
		for(AuthorityVO auth : authList) {
			int avg = (int) ((auth.getProjectCnt() / totlaCnt) * 100);
			auth.setProjectCnt(avg);
		}
		
		return authList;
	}

	@Override
	public List<AuthorityVO> roleAuthCnt() {
		
		List<ResourceVO> resList = resDAO.selectAllResource();
		List<AuthorityVO> authList = authDAO.selectAllRole();
		
		for(AuthorityVO auth : authList) {
			int cnt = 0;
			for(ResourceVO res : resList) {
				if(res.getLevel() == 3) {
					for(AuthorityVO auth2 : res.getAuthorities()) {
						if(auth2.getAuthor().equals(auth.getAuthor())) {
							cnt++;
						}
					}
				}
			}
			auth.setProjectCnt(cnt);
		}
		
		return authList;
	}

	@Override
	public List<ProjectMemVO> retrieveProjectMem() {
		return resDAO.selectProjectMem();
	}

	@Override
	public List<ResourceVO> retrieveLevel2Res() {
		return resDAO.selectLevel2Res();
	}
	
	

}
