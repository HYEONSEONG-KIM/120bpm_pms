package kr.or.ddit.issue.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.work.vo.ObserverVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="issueNo")
public class IssueVO {
	@NotBlank(groups= { UpdateGroup.class} )
	private String issueNo;
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String issueSj;
	private String issueRgsde;
	private String issueOthbcAt;
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String issueCn;
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String workCode;
	@NotBlank(groups= {Default.class,DeleteGroup.class}  , message="필수입력사항입니다")
	private String memId;
	private String memName;
	
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String prjctNo;
	private Integer repCount;
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String ctgryCode;
	private String ctgryNm;
	private String issuePercent;
	private Integer totalCount;
	private String workSj;
	
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String issuePriortCode;
	private String priorNm;
	
	private String[] memIds; //관람자들 등록 
	private String[] memMails;
	
	
	private String issueUpdtde;
	private String issueSolutAt;
	private String soluteNm;
	
	private	List<ProjectMemVO>  roleList;
	public List<IssueFileVO> issueFileList;
	List<ObserverVO> workObserverList;
	private Integer rnum;
	//푸시 알림에 대한 처리를 위해  생성 삭제 시 프로젝트 이름 담아주기
	private String prjctNm;
	private String memEmail;
	
	public String[] delFileNo;
	@NotNull(groups=DeleteGroup.class  , message="필수입력사항입니다")
	public String[] issueNos;
	
}
