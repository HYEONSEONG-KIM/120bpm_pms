package kr.or.ddit.webIDE.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.webIDE.dao.CodeEditorDAO;
import kr.or.ddit.webIDE.vo.CodeEditorVO;

@Service
public class CodeEditorServiceImpl implements CodeEditorService{

	@Inject
	private CodeEditorDAO dao;
	
	@Override
	public List<CodeEditorVO> selectCodeEditorList(int prtId) {
		
		List<CodeEditorVO> editorList = dao.codeEditorList(prtId);
		
		return editorList;
	}

	@Override
	public CodeEditorVO selectCodeEditor(int editCode) {
		
		CodeEditorVO editVO = dao.selectCodeEditor(editCode);
		return editVO;
	}

	@Override
	public ServiceResult createCodeEditor(CodeEditorVO editVO) {
		ServiceResult result = null;
		int rowCnt = dao.insertCodeEitor(editVO);
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public int editCnt(CodeEditorVO editVO) {
		
		return dao.codeEditCntMem(editVO);
	}

	@Override
	public ServiceResult removeCodeEditor(int editCode) {
		
		ServiceResult result = null;
		int rowCnt = dao.deleteCodeEitor(editCode);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		return result;
	}
	

}
