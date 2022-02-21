package kr.or.ddit.file.vo;

import java.io.Serializable;

import com.google.inject.internal.util.Objects;

import lombok.Getter;
@Getter
public class AttatchWrapper implements FancyTreeNode , Serializable{
	private AtchFIleVO adaptee;
	
	public AttatchWrapper(AtchFIleVO attatch) {
		super();
		this.adaptee = attatch;
	}

	@Override
	public String getTitle() {
		if(adaptee.getFileNm()!=null) {
				 
			return adaptee.getFileNm();
		}else {
			return adaptee.getMenuClNm();
		}
		 
	}

	
	
	@Override
	public boolean isFolder() {
		return adaptee.getFileCount()>0;
		
	}

	@Override
	public String getKey() {
		if(adaptee.getFileNo()!=null) {
			return adaptee.getFileNo();
		}else {
			return adaptee.getMenuClCode();
		}
		
		 
	}

	@Override
	public boolean isLazy() {
		// TODO Auto-generated method stub
		return isFolder() ;
	}

	@Override
	public String getTooltip() {
		return getTitle() ;
	}

}
