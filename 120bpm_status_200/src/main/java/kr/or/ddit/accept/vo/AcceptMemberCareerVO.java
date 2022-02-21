package kr.or.ddit.accept.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="careerMatterNo")
@ToString
@NoArgsConstructor
public class AcceptMemberCareerVO implements Serializable{

	private Integer careerMatterNo;
	private String partcptnBiz;
	private String beginde;
	private String endde;
	private String orntNm;
	private String wrkplcNm;
	private String ofcpsNm;
	private String atnddu;
	private String memId;
}
