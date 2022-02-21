package kr.or.ddit.settings.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="setupCode")
@ToString
public class SetupVO {
	private String setupCode;
	private String setupNm;
	private String setupTypeCode; 
}
