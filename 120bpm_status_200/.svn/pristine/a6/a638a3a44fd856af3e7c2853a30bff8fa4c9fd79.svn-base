package kr.or.ddit.file.vo;

import java.io.IOException;
import java.io.Serializable;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

import org.apache.commons.io.FileUtils;
import org.apache.tika.Tika;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
//@EqualsAndHashCode(of="fileCode")
@ToString(exclude="file")
@NoArgsConstructor
public class AtchFIleVO implements Serializable {
	@JsonIgnore
	private transient MultipartFile file;
	
	private String tempAt;
	@NotBlank(message="필수데이터 누락")
	private String fileNm;
	private long fileSize;
	private String fileRgsde;
	private String fileSavedNm;
	private String fancySize;
	private String fileMime;
	//private String addDc;
	private String fileSizeStr;
	private String fileNo;
	private String menuClNm;
	@NotBlank(message="필수데이터 누락" ,groups= {Default.class})
	private String menuClCode;
	private String prjctNo;
	private String prjctNm;
	private String boNo;
	private String memId;
	private int startAttNo;
	private int fileCount;
	private String boLink;
	private String memName;
	
	@NotNull(groups= {DeleteGroup.class ,UpdateGroup.class})
	private String[] fileNos;
	private String[] menuClCodes;
	
	
	@NotBlank(groups= {UpdateGroup.class})
	private String reFileNm;
	
	public AtchFIleVO(MultipartFile file) throws IOException {
		super();
		Tika tika = new Tika();
		this.file = file;
		this.fileNm = file.getOriginalFilename();
		this.fileMime = tika.detect(file.getBytes());
		this.fileSize = file.getSize();
		this.fancySize = FileUtils.byteCountToDisplaySize(fileSize);
		this.fileSavedNm = UUID.randomUUID().toString();
	}
	
}
