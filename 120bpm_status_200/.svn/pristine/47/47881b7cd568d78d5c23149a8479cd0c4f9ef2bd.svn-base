package kr.or.ddit.free.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.dao.FreeBoardDAO;
import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.notice.dao.NoticeDAO;
import kr.or.ddit.notice.vo.NoticeVO;


@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Inject
	private FreeBoardDAO freeBoardDAO;
	
	
	@Override
	public ServiceResult createBoard(FreeBoardVO freeboardInfo) {
		 ServiceResult result = ServiceResult.FAIL;
		 
	      int cnt = freeBoardDAO.insertBoard(freeboardInfo);
	      if (cnt > 0) {
	         result = ServiceResult.OK;
	      }
		return result;
	}

	@Override
	public int retriveBoardCount(FreePagingVO<FreeBoardVO> freePagingInfo) {
		// TODO Auto-generated method stub
	      return freeBoardDAO.selectTotalRecoard(freePagingInfo);

	}

	@Override
	public List<FreeBoardVO> retriveBoardList(FreePagingVO<FreeBoardVO> freePagingInfo) {
		// TODO Auto-generated method stub
	      return freeBoardDAO.selectBoardList(freePagingInfo);
	}

	@Override
	public FreeBoardVO retriveBoard(int boNo) {
		FreeBoardVO freeBoardInfo = freeBoardDAO.selectFreeboard(boNo);
	      if (freeBoardInfo == null)
	         throw new DataNotFoundException(boNo + "");
	      return freeBoardInfo;
	}

	@Override
	public ServiceResult modifyBoard(FreeBoardVO freeboardInfo) {
		FreeBoardVO saved =    freeBoardDAO.selectFreeboardDetailView(freeboardInfo);
	      if(saved==null) throw new DataNotFoundException(freeboardInfo.getBoNo());
	      ServiceResult result = null;
	      int cnt= 0 ;
	      System.out.println(saved.getMemId()+ "관리자"  + freeboardInfo.getMemId() );
	      if(saved.getMemId().equals(freeboardInfo.getMemId())) {
	          
	          cnt = freeBoardDAO.updateBoard(freeboardInfo);
	          if(cnt>0) {
	             result = ServiceResult.OK; //성공
	            
	            }else {
	               result = ServiceResult.FAIL; //실패           
	            }
	          
	      }
	      return result;
	      }
	
	public ServiceResult removeBoard(FreeBoardVO freeboardInfo) {
		FreeBoardVO saved = freeBoardDAO.selectFreeboardDetailView(freeboardInfo);
	      if(saved==null) throw new DataNotFoundException(freeboardInfo.getBoNo());
	      ServiceResult result = null;
	      int cnt= 0 ;
	      if(saved.getMemId().equals(freeboardInfo.getMemId())) {
	          cnt = freeBoardDAO.updateBoard(freeboardInfo);
	          if(cnt>0) {
	             result = ServiceResult.OK; //성공
	            
	            }else {
	               result = ServiceResult.FAIL; //실패             
	            }
	      }
	      return result;
	}



	@Override
	public FreeBoardVO selectFreeboard(int boNo) {
		FreeBoardVO freeBoardInfo = freeBoardDAO.selectFreeboard(boNo);
	      if (freeBoardInfo == null)
	         throw new DataNotFoundException(boNo + "");
	      return freeBoardInfo;
	}

	@Override
	public ServiceResult removeBoard(Integer boNo, FreeBoardVO freeBoardInfo) {
		FreeBoardVO saved = freeBoardDAO.selectFreeboardDetailView(freeBoardInfo);
	      if(saved==null) throw new DataNotFoundException(freeBoardInfo.getBoNo());
	      ServiceResult result = null;
	      int cnt= 0 ;
	      if(saved.getMemId().equals(freeBoardInfo.getMemId())) {
	          cnt = freeBoardDAO.deleteBoard(boNo);
	          if(cnt>0) {
	             result = ServiceResult.OK; //성공
	            
	            }else {
	               result = ServiceResult.FAIL; //실패             
	            }
	      }
	      return result;
		
	}

	@Override
	public ServiceResult incrementCount(int boNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
