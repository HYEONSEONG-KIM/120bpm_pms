package kr.or.ddit.settings.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.settings.dao.SettingsDAO;
import kr.or.ddit.settings.vo.SetupDetailVO;

@Service
public class SettingsServiceImpl implements SettingsService {

	@Inject
	SettingsDAO dao;
	 
	@Override
	@Transactional  
	public ServiceResult createSetupDetail(SetupDetailVO setupDetail) {
		ServiceResult result = ServiceResult.FAIL;
		List<SetupDetailVO> sdList = setupDetail.getSetupDetailList();
		int rowcnt = 0;
		for(SetupDetailVO sd : sdList) { 
			sd.setSetupCode(setupDetail.getSetupCode());
			rowcnt = dao.updateSetupDetail(sd);
		} 
		if(rowcnt > 0 ) {  
			result = ServiceResult.OK; 
		}    
		return result;
	}

	@Override
	public List<SetupDetailVO> retrieveSetupValues(String setupCode) {
		return dao.selectSetupValues(setupCode);
	}


	

}
