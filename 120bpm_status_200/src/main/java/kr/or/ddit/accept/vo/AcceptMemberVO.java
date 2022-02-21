package kr.or.ddit.accept.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="memId")
@ToString
public class AcceptMemberVO implements Serializable{
	private String memId;
	private String memPass;
	private String memHp;
	private String memEmail;
	private String memZip;
	private String memAddr1;
	private String memAddr2;
	private String memFnm;
	private String memLnm;
	private String proflImgNm;
	private String memJoinConfmAt;
	private String memSttusClCode; // 상태코드
	private String memJoinDe;
	private String memJoinConfmDe;
	private String mngrAt;
	private String psitnClCode;
	private Integer passErrorCnt;
	private String indvdlinfoAgreDe;
	private String memLastLoginDe;
	private String memName;
	
	// 회원 승인 여부
	private boolean memAccept;
	// 회원 탈퇴 여부
	private boolean memSecession = true;
	// 회원 휴면 여부
	private boolean memDormancy = true;
	
	public void setMemJoinConfmAt(String memJoinConfmAt) {
		this.memJoinConfmAt = memJoinConfmAt;
		if(memJoinConfmAt.equals("0")) {
			memAccept = false;
		}else {
			memAccept = true;
		}
	}
	
	public void setMemSttusClCode(String memSttusClCode) {
		this.memSttusClCode = memSttusClCode;
		 if(memSttusClCode.equals("M00102")) {
			memDormancy = false;
		}else if(memSttusClCode.equals("M00103")) {
			memSecession = false;
		}
	}
	
	private List<ProjectMemVO> projectMemRole;
	
	private List<AcceptMemberCareerVO> careerList;
	
}
