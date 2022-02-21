package kr.or.ddit.accept.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.dao.AcceptDao;
import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Service
public class AcceptMemberServiceImpl implements AcceptMemberService {

	@Inject
	private AcceptDao dao;
	
	
	@Override
	public void retrieveMemList(AcceptMemPagingVO<AcceptMemberVO> paging) {
		int totalRecord = dao.totalMemRecord(paging);
		List<AcceptMemberVO> memList = dao.selectMemList(paging);
		
		paging.setTotalRecord(totalRecord);
		paging.setDataList(memList);
	}

	@Override
	public AcceptMemberVO retrieveMember(String memId) {
		return dao.selectMember(memId);
	}

	@Override
	public List<MakeProjectVO> memProjectInfo(String memId) {		
		return dao.memProjectInfo(memId);
	}

	@Override
	public void retrieveNotAcceptList(AcceptMemPagingVO<AcceptMemberVO> paging) {
		int totalRecord = dao.totalNotAcceptRecord(paging);
		List<AcceptMemberVO> memList = dao.selectNotAcceptList(paging);
		
		paging.setTotalRecord(totalRecord);
		paging.setDataList(memList);
	}

	@Override
	@Transactional
	public ServiceResult acceptMember(String memId) {
		
		ServiceResult result = null;
		int rowCnt = dao.memberAccept(memId);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	@Transactional
	public ServiceResult refuseMember(String memId) {
		
		ServiceResult result = null;
		int rowCnt = dao.refuseMem(memId);
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}

	@Override
	public ServiceResult allAcceptMember(String[] memId) {
		List<String> memList = new ArrayList<String>();
		for(String id : memId) {
			memList.add(id);
		}
		
		int rowCnt = dao.allAccept(memList);
		ServiceResult result = null;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

}
