package kr.or.ddit.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.project.dao.ProjectDAO;
import kr.or.ddit.project.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService {
	@Inject
	ProjectDAO projectDAO;
	
	@Override
	public int retrieveTotalCount(PagingVO<ProjectVO> projectPaingInfo) {
		return projectDAO.selectTotalRecord(projectPaingInfo);
	}
	@Override
	public List<ProjectVO> retrieveProjectList(PagingVO<ProjectVO> projectPaingInfo){
		return projectDAO.selectProjectList(projectPaingInfo);
		
	}
	
	
	
	
}
