package kr.or.ddit.work.vo;

import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="workCode")
public class WorkVO {
	
	private String workDateStatus;
	
	@NotBlank(groups= {DeleteGroup.class, UpdateGroup.class} )
	private String workCode;
	
	@Size(max=150 , message="제목은 150자 이내로 작성되어야 합니다")
	@NotBlank(groups=Default.class , message="제목은 필수입력사항입니다")
	private String workSj;
	
	@NotBlank(groups=Default.class , message="내용은 필수입력사항입니다")
	private String workCn;
	
	@NotBlank(groups=Default.class, message="로그인된 회원만 일감을 등록할 수 있습니다")
	private String memId;
	@NotBlank(groups=Default.class  , message="시작일자는 필수입력사항입니다")
	private String workBgnde;
	@NotBlank(groups=Default.class  , message="종료일자는 필수입력사항입니다")
	private String workEndde;
	
	//@NotBlank(groups=InsertGroup.class)
	private String workRgsde;
	@Min(value=0)
	@NotNull(groups=Default.class, message="0 이상의 값을 입력해야합니다" )
	private Integer workPrgsDgreePoint;
	
	private String upperWorkCode;
	
	@NotBlank(groups=Default.class  , message="공개여부는 필수입력사항입니다")
	private String workOthbcAt; //공개여부
	
	private String workReqSttusCode; //일감신청상태코드 
	
	private String workReturnWhy;
	
	private String workUpdtde;
	private String workDeleteAt;
	@NotBlank(groups=Default.class  , message="카테고리는 필수입력사항입니다")
	private String ctgryCode;
	
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String prjctNo;
	private String prjctNm;
	
	//=============================================
	private String memFnm;
	private String memLnm;
	private String memName;
	private String memEmail;
	//=============================================
	
	private MultipartFile[] workFiles;
	private List<WorkBkmkVO> bookMarks;
	
	List<WorkFileVO> workFileList;
	List<ObserverVO> workObserverList;
	List<WorkParentVO> parentList;
	//private List<ObserverVO> observerList;
	
	 List<ProjectMemVO>  roleList;
	private String memRole;
	private String bookMarker;
	
	//private List<WorkRepVO> repList;
	private String[] memIds; //관람자들 등록 
	
	private String[] workCodes;
	//파일 넣을 때 
	private String[] delFileNo; //삭제할 파일이름 
	private String[] memMails;
	private String ctgryNm;
	@NotBlank(groups=Default.class  , message="상태는 필수입력사항입니다")
	private String workSttusCode; //일감의 상태이름 
	@NotBlank(groups=Default.class  , message="우선순위는 필수입력사항입니다")
	private String workPriortCode; //일감의 우선순위 코드 
	
	private String workStatus; //일감 상태 이름 
	
	private String priortNm; // 일감 우선순위 이름
	
	private String workReqNm; //일감의 상태 이름
	
	private String workOpen;//일감 공개 비공개 여부
	private String ReqMonth; //등록한 달
	private Integer percent; 
	private String workBkAt;
    
	private String upperWorkSj;

	 
	
}
