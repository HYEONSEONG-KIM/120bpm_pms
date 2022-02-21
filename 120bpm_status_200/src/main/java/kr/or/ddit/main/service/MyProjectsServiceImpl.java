package kr.or.ddit.main.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.dao.MyProjectsDAO;
import kr.or.ddit.makeProject.vo.MakeProjectPagingVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Service
public class MyProjectsServiceImpl implements MyProjectsService {


	@Inject
	private MyProjectsDAO dao;
	
	
	@Override
	public void retrieveProjectList(MakeProjectPagingVO<MakeProjectVO> paging) {
		int totalRecord = 0; 
		List<MakeProjectVO> projectList = new ArrayList<>();
		
		totalRecord = dao.totalRecord(paging);
		projectList = dao.selectProjectList(paging);
		
		paging.setTotalRecord(totalRecord);
		paging.setDataList(projectList);
	}

}
