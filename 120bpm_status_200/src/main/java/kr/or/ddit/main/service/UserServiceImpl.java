package kr.or.ddit.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.activity.vo.MyTimelineVO;
import kr.or.ddit.commons.exception.UserNotFoundExcpetion;
import kr.or.ddit.main.dao.UserDAO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.dao.MyAccountDAO;
import kr.or.ddit.mypage.vo.MyMemVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	MyAccountDAO mydao;
	
	@Inject
	UserDAO userDao;
	
	@Override
	public Map<String, Object> retrieveMemInfo(MyPrjctMemVO mem) {
		MyMemVO savedmem = mydao.selectMyAccountInfo(mem.getUserId());
		if(savedmem==null) {
			throw new UserNotFoundExcpetion(mem.getUserId() + " 회원 없음"); 
		}
		Map<String, Object> map = new HashMap<>();
		
		MyMemVO info = userDao.selectMemInfo(mem);
		List<MyWorkVO> workCnt = userDao.selectMemWorkCnt(mem);
		List<MyProjectVO> prjcts = userDao.selectMemPrjcts(mem);
		List<MyTimelineVO> tline = userDao.selectMemTimeline(mem);
		
		map.put("info", info);
		map.put("workCnt", workCnt);
		map.put("prjcts", prjcts);
		map.put("tline", tline); 
		return map;
	}

}
