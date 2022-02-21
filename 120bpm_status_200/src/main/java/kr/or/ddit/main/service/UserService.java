package kr.or.ddit.main.service;

import java.util.Map;

import kr.or.ddit.main.vo.MyPrjctMemVO;

public interface UserService {
	
	public Map<String, Object> retrieveMemInfo(MyPrjctMemVO mem);
}
 