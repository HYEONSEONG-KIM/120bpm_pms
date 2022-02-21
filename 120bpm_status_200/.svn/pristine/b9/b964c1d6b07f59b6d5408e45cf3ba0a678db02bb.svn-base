package kr.or.ddit.settings.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.groups.Default;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of= {"setupCode", "setupCnNo", "setupDetailNo"})
@ToString
public class SetupDetailVO {
	@NotBlank(groups=Default.class)
	private String setupCode; 
	@NotBlank(groups=Default.class)
	private Integer setupCnNo;
	@NotBlank(groups=Default.class)
	private String setupCn; 
	private String setupValue;
	@NotBlank(groups=Default.class)
	private Integer setupDetailNo;
	
	//수정시 넘어오는 vo 담을 객체 
	private List<SetupDetailVO> setupDetailList;
}
