package kr.or.ddit.activity.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.activity.dao.MyTimelineDAO;
import kr.or.ddit.activity.vo.MyTimelineVO;

@Service
public class MyTimelineServiceImpl implements MyTimelineService{
	@Inject
	private MyTimelineDAO dao;
	 
	@Override
	public List<MyTimelineVO> retrievePrjctTimeline(MyTimelineVO timeline) {
		return dao.selectPrjctTimeline(timeline);
	}

	@Override
	public MyTimelineVO retrieveTermDate(String termDate) {
		return dao.selectTermDate(termDate); 
	}

}
