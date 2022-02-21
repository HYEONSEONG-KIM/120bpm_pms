package kr.or.ddit.validate.contraints;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

/**
 * 전화번호 형식 확인을 위한 검증 어노테이션
 *
 */
@Target(FIELD)
@Retention(RUNTIME)
@Constraint(validatedBy= TelNumberValidator.class)
public @interface TelNumber {
	String message() default "{kr.or.ddit.validate.contraints.TelNumber.message}";
	Class<?>[] groups() default {};
	Class<? extends Payload>[] payload() default { };
	 
	String regexp() default "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
	String placeholder() default "000-0000-0000"; 
}







