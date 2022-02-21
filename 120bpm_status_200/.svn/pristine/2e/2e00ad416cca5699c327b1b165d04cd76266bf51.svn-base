package kr.or.ddit.projectSetting.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="ctgryCode")
@ToString
@NoArgsConstructor
public class WorkCategoryVO implements Serializable{
	private String ctgryCode;
	@NotBlank
	private String ctgryNm;
	private Integer prjctNo;
	private Integer workCnt;
	private Integer prgsAvg;
	
	private int emergency;
	private int high;
	private int middle;
	private int low;
}
