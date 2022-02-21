package kr.or.ddit.webIDE.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.webIDE.vo.CodeEditorVO;

@Mapper
public interface CodeEditorDAO {

	/**
	 * 한 프로젝트의 코드에디터 리스트 조회
	 * @param prtId
	 * @return
	 */
	public List<CodeEditorVO> codeEditorList(int prtId);
	
	/**
	 * 한회원이 생성한 피드룸 갯수
	 * @return
	 */
	public int codeEditCntMem(CodeEditorVO editVO);
	
	/**
	 * 하나의 코드에디터 조회
	 * @param editorCode
	 * @return
	 */
	public CodeEditorVO selectCodeEditor(int editorCode);

	/**
	 * 코드에디터 생성
	 * @param editVO
	 * @return
	 */
	public int insertCodeEitor(CodeEditorVO editVO);
	
	/**
	 * 코드에디터 삭제
	 * @param editorCode
	 * @return
	 */
	public int deleteCodeEitor(int editorCode);
}
