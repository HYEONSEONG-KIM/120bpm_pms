package kr.or.ddit.free.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="boNo")
public class FreeReplyVO implements Serializable {

	
	private Integer repNo;
	private Integer boNo;
	private String repCn;
	private Integer prjctNo;
	private String repRgsde;
	private String menuClCode;
	private String memId;
	
	private String repWriter;
	private String displayCn;
	private Integer repParent;
	@NotBlank
	private String repPass;
	
}
