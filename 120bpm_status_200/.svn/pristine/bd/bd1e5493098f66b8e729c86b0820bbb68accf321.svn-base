package kr.or.ddit.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.main.dao.CustomMenuDao;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.mypage.vo.MyWorkBkmkVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Service 
public class CustomMenuServiceImpl implements CustomMenuService {

	@Inject
	private CustomMenuDao dao;
	
	@Override
	public List<MyWorkVO> retrieveMyPrjctWorkList(MyWorkVO work) {
		return dao.selectMyPrjctWorkList(work);
	}

	@Override
	public List<MyWorkVO> retrieveMyPrjctWorkBkmkList(MyWorkBkmkVO bkmk) {
		return dao.selectMyPrjctWorkBkmkList(bkmk); 
	}

	@Override
	public MyBoardVO retrievePrjctCurNews(int prjctNo) {
		return dao.selectPrjctCurNews(prjctNo);
	}

	@Override
	public MyBoardVO retrievePrjctCurWiki(int prjctNo) {
		return dao.selectPrjctCurWiki(prjctNo);
	}

	@Override
	public MyIssueVO retrievePrjctCurIssue(int prjctNo) {
		return dao.selectPrjctCurIssue(prjctNo); 
	}
 
}
