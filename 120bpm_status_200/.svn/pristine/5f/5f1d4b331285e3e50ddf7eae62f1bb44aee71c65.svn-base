package kr.or.ddit.mypage.vo;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.contraints.FileMime;
import kr.or.ddit.validate.contraints.TelNumber;
import kr.or.ddit.validate.groups.UpdatePassGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@AllArgsConstructor
//@NoArgsConstructor  
@EqualsAndHashCode(of="memId") 
@ToString(exclude= {"memPass","profileImg"})
public class MyMemVO implements Serializable{
	
	public MyMemVO() {
		super();
	}
 
	public MyMemVO(String memId, String memPass) {
		super();
		this.memId = memId;
		this.memPass = memPass;
	}

	@NotBlank
	@Size(min=4, max=12, message="영소문자+숫자 8~12자리를 입력해주세요")
	private String memId;
	@NotBlank(groups=UpdatePassGroup.class) 
	@Size(min=8, max=16, message="영문자+숫자+특수문자 8~16자리를 입력해주세요")
	private String memPass;
	@NotBlank
	@TelNumber(message="휴대폰 형식에 맞게 입력해주세요 ex)010-1234-1234")
	private String memHp; 
	@NotBlank
	@Email(message="이메일 형식에 맞게 입력해주세요")
	private String memEmail;
	private String memZip;
	private String memAddr1; 
	private String memAddr2;
	@NotBlank(message="이름을 입력하세요")
	private String memFnm;
	@NotBlank(message="성을 입력하세요")
	private String memLnm;
	private String memJoinConfmAt;
	private String memSttusClCode; 
	private String memJoinDe;
	private String memJoinConfmDe;
	private String mngrAt;
	private String psitnClCode;
	private Integer passErrorCnt;
	private String indvdlinfoAgreDe;
	private String proflImgNm;
	
	private String memName;
	
	@FileMime(mime="image/") 
	private transient MultipartFile profileImg;
	public void setProfileImg(MultipartFile profileImg) {
		if(profileImg!=null && !profileImg.isEmpty()) {
			this.profileImg = profileImg; 
			this.proflImgNm = UUID.randomUUID().toString()+ ".jpg"; 
		}
	}
	
	//has many 경력사항
	private List<MyCareerVO> myCareerList;
	 
	private int careerMatterNo;
	
	private List<MemSetVO> memSetList;
	//자기소개 컬럼
	private String memIntro;
}
