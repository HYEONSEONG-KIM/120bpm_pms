package kr.or.ddit.file.vo;

public interface FancyTreeNode {
	public String getTitle();
	public boolean isFolder();
	public String getKey();
	public boolean isLazy();
	public String getTooltip();
}
