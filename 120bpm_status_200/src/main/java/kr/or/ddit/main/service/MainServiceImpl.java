package kr.or.ddit.main.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.main.dao.MainDAO;
import kr.or.ddit.main.vo.MainNoticeVO;
import kr.or.ddit.main.vo.MyBoardVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.dao.MyAccountDAO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	MainDAO dao;
	
	@Inject
	MyAccountDAO accDao;
	
	@Override
	public List<MyProjectVO> retrieveMyProjectList(String memId) {
		return dao.selectMyProjectList(memId); 
	}

	@Override
	public List<MainNoticeVO> retrieveNoticeList() {
		return dao.selectNoticeList();
	}

	@Override 
	public MyProjectVO retrieveMyProject(MyPrjctMemVO prjct) { 
		MyProjectVO prjctVO = dao.selectMyProject(prjct);
		if(prjctVO==null) {
			new DataNotFoundException(prjct.getPrjctNo() + " 프로젝트 없음");
		}  
		return prjctVO;
	}

	@Override
	public MyWorkVO retrieveWorkCounts(MyWorkVO work) {
		MyPrjctMemVO prjct = new MyPrjctMemVO();
		prjct.setPrjctNo(work.getPrjctNo());
		MyProjectVO prjctVO = dao.selectMyProject(prjct);
		if(prjctVO==null) {
			new DataNotFoundException(prjct.getPrjctNo() + " 프로젝트 없음");
		}  
		
		return  dao.selectWorkCounts(work);
	}

	@Override
	public List<MyPrjctMemVO> retrieveMyPrjctMems(MyPrjctMemVO prjct) {
		return dao.selectMyPrjctMems(prjct); 
	}

	@Override
	public List<MyWorkVO> retrieveMyWorkCtgrys(int prjctNo) {
		return dao.selectMyWorkCtgrys(prjctNo); 
	}

	@Override
	public List<MyWorkVO> retrieveMyWorkCounts(String memId) {
		accDao.selectMyAccountInfo(memId); //exception
		
		return dao.selectMyWorkCounts(memId); 
	}

	@Override
	public MyBoardVO retrieveCurNews(String memId) {
		return dao.selectCurNews(memId);
	}

	@Override
	public List<MyProjectVO> retrieveMyPrjctRegCnts() {
		return dao.selectMyPrjctRegCnts(); 
	}

	@Override
	public MyProjectVO retrievePrjctSttsCount() {
		return dao.selectPrjctSttsCount();
	}

	@Override
	public List<MyPrjctMemVO> endPrtMemList(int prtId) {
		return dao.endPrtMemList(prtId);
	} 

}
