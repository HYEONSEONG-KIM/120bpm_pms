package kr.or.ddit.settings.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.settings.vo.SetupDetailVO;

@Mapper
public interface SettingsDAO {
  
	public int insertSetupDetail(SetupDetailVO setupDetail);
	
	public int deleteSetupDetail(String setupCode);
	 
	public int updateSetupDetail(SetupDetailVO setupDetail);
	
	public List<SetupDetailVO> selectSetupValues(String setupCode);
	
	public List<SetupDetailVO> selectSetupDetailList();
}
