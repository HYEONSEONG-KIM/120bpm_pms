package kr.or.ddit.webIDE.service;

import java.util.List;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.webIDE.vo.CodeEditorVO;

public interface CodeEditorService {

	/**
	 * 코드에디터 리스트 조회
	 * @param prtId
	 * @return
	 */
	public List<CodeEditorVO> selectCodeEditorList(int prtId);
	
	/**
	 * 한 회원의 코드
	 * @param memId
	 * @return
	 */
	public int editCnt(CodeEditorVO editVO);
	
	/**
	 * 코드에디터 조회
	 * @param editCode
	 * @return
	 */
	public CodeEditorVO selectCodeEditor(int editCode);
	
	/**
	 * 코드에디터 생성
	 * @param editVO
	 * @return
	 */
	public ServiceResult createCodeEditor(CodeEditorVO editVO);

	/**
	 * 코드에디터 삭제
	 * @param editCode
	 * @return
	 */
	public ServiceResult removeCodeEditor(int editCode);
}
