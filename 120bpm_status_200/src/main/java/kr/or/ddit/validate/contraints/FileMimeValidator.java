package kr.or.ddit.validate.contraints;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.web.multipart.MultipartFile;

public class FileMimeValidator implements ConstraintValidator<FileMime, MultipartFile>{
	
	private FileMime annotation;
	
	@Override
	public void initialize(FileMime constraintAnnotation) {
		this.annotation = constraintAnnotation;
	}
	
	
	@Override
	public boolean isValid(MultipartFile value, ConstraintValidatorContext context) {
		if(value==null) return true;
		
		String contentType = value.getContentType();
		String mime = annotation.mime();
		
		return contentType!=null && contentType.startsWith(mime);
	}

}











