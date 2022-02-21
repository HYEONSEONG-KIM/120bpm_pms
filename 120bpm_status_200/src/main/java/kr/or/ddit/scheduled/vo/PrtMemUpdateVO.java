package kr.or.ddit.scheduled.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.accept.vo.ProjectMemVO;
import lombok.Data;

@Data
public class PrtMemUpdateVO implements Serializable{
	
	private Integer prjctNo;
	private List<ProjectMemVO> memId;
}
