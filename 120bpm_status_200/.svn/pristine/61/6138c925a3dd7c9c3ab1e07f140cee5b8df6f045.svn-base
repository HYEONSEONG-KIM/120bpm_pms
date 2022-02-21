package kr.or.ddit.news.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
@Data
public class NewsRepVO implements Serializable {
	@NotBlank(groups= {UpdateGroup.class,DeleteGroup.class})
	private String boRepNo;
	@NotBlank(groups=InsertGroup.class)
	private String memId;
	private String memName;
	@NotBlank(groups=InsertGroup.class)
	private Integer boNo;
	private String boRepRgsde;
	@NotBlank(groups=Default.class)
	private String boRepCn;
	@NotBlank(groups=InsertGroup.class)
	private Integer prjctNo;
	private Integer boRepParent;
	private String boRepDeleteAt;
}
