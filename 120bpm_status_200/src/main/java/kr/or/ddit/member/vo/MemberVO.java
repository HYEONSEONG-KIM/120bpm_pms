package kr.or.ddit.member.vo;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import kr.or.ddit.validate.contraints.TelNumber;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="memId")
@ToString(exclude="memPass")
public class MemberVO {
	
	@Size(min=4, max=12, message="아이디는 4자~12자 입니다")
	private String memId;
	@Size(min=8, max=16, message="비밀번호 8자~16자리를 입력해주세요")
	private String memPass;
	@TelNumber(message="휴대폰 형식 010-0000-0000 입력해주세요")
	private String memHp;
	@Email(message="이메일 형식에 맞게 입력해주세요")
	private String memEmail;
	private String memZip;
	private String memAddr1;
	private String memAddr2;
	@NotBlank(message="이름을 입력하세요")
	private String memFnm;
	@NotBlank(message="성을 입력하세요")
	private String memLnm;
	private String memJoinDe;
	private String memLastLoginDe;
	private String MemSttusClCode;
	
	private CareerVO careerInfo;
	private List<CareerVO> careerList;
}



