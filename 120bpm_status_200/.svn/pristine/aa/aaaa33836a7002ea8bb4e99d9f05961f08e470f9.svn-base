package kr.or.ddit.work.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;

@Data
public class WorkBkmkVO {
	@NotBlank(groups=DeleteGroup.class)
	private String workBkmkCode;
	@NotBlank(groups=InsertGroup.class)
	private String prjctNo;
	@NotBlank(groups=InsertGroup.class)
	private String memId;
	@NotBlank(groups=InsertGroup.class)
	private String workCode;
	@NotBlank(groups=InsertGroup.class)
	private String ctgryCode;
	
	
}
