package kr.or.ddit.member.vo;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.ToString;


@ToString
public class CareerVO {
	
	
	@NotNull(groups=UpdateGroup.class)
	private Integer careerMatterNo;
	
	@NotEmpty(message="프로젝트명을 입력하세요")
	private String partcptnBiz;
	
	@NotNull(message="해당날짜를 입력하세요")
	private String beginde;
	@Future(message="해당날짜를 입력하세요")
	private String endde;
	@NotEmpty
	private String orntNm; 
	@NotEmpty
	private String wrkplcNm;
	@NotBlank(message="이름을 입력하세요")
	private String ofcpsNm;
	@NotBlank(message="이름을 입력하세요")
	private String atndDu; 
	@NotEmpty
	private String memId;
	
	
	
	
	public Integer getCareerMatterNo() {
		return careerMatterNo;
	}
	public void setCareerMatterNo(Integer careerMatterNo) {
		this.careerMatterNo = careerMatterNo;
	}
	public String getPartcptnBiz() {
		return partcptnBiz;
	}
	public void setPartcptnBiz(String partcptnBiz) {
		this.partcptnBiz = partcptnBiz;
	}
	public String getBeginde() {
		return beginde;
	}
	public void setBeginde(String beginde) {
		this.beginde = beginde;
	}
	public String getEndde() {
		return endde;
	}
	public void setEndde(String endde) {
		this.endde = endde;
	}
	public String getOrntNm() {
		return orntNm;
	}
	public void setOrntNm(String orntNm) {
		this.orntNm = orntNm;
	}
	public String getWrkplcNm() {
		return wrkplcNm;
	}
	public void setWrkplcNm(String wrkplcNm) {
		this.wrkplcNm = wrkplcNm;
	}
	public String getOfcpsNm() {
		return ofcpsNm;
	}
	public void setOfcpsNm(String ofcpsNm) {
		this.ofcpsNm = ofcpsNm;
	}
	public String getAtndDu() {
		return atndDu;
	}
	public void setAtndDu(String atndDu) {
		this.atndDu = atndDu;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
	
	
	
}
	
