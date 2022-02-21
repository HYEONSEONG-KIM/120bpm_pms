package kr.or.ddit.work.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.work.vo.CntcWorkVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkBkmkVO;
import kr.or.ddit.work.vo.WorkParentVO;
import kr.or.ddit.work.vo.WorkVO;

public interface WorkService {

	public void retriveWorkList(ExtendPagingVO<WorkVO> pagingVO); 
	public int retriveWorkCount(ExtendPagingVO<WorkVO> pagingVO); 
	public void retrieveMyWorkList(ExtendPagingVO<WorkVO> pagingVO); 
	public int retrieveMyWorkCount(ExtendPagingVO<WorkVO> pagingVO);
	
	public  Map<String ,Object> selectMyWorkCheck(WorkVO workVo);
	//내 일감의 퍼센트 얻는 함수 
	public List<WorkVO> selectMyWorkPercent(WorkVO workVO);
		
		//내 일감의 등록월에 따른 퍼센트 
		
	public List<WorkVO> selectMyWorkPerMonth(WorkVO workVO);
		
	public void selectAllBookMarkList(ExtendPagingVO<WorkVO> pagingVO);
	public int selectAllBookMarkCount(ExtendPagingVO<WorkVO> pagingVO);

	
	public ServiceResult insertBookMark(WorkBkmkVO bookMarkVO);
	public ServiceResult deleteBookMark(WorkBkmkVO bookMarkVO);
    public  Map<String ,Object>  retrieveWorkDetail(WorkVO workVO);
    public  Map<String ,Object>  retrieveWorkDetails(WorkVO workVO);
    
    public ServiceResult insertWork(WorkVO workVO);
    
    public List<WorkParentVO> retrieveWorkParent(WorkVO workVO);
	//이미 있는 연계 일감이면 못하도록 설정
    public ServiceResult ckeckCntInsertAt(CntcWorkVO cntWorkVO);

    //일감 일감 리스트 조회
    public List<CntcWorkVO> retrieveCntWorkDetail(String workCode);
    //일감 진척도 수정
    public ServiceResult updateDegree(WorkVO workVO);
    public List<WorkVO> retrieveAutoCompleteList( WorkVO workVO);
    
    public WorkVO retrieveSimpleWorkInfo(String workCode);
    public WorkAuthVO retriveProjectPM(WorkVO workVO);
   
    public ServiceResult updateReqStatus(WorkVO workVO);
    
    public String checkWorkId(String[] workCode , WorkVO workVO  , String memName);

    public String addWork(WorkVO workVO);

   //여러 일감 선택해서 삭제 
    public String deleteAllWork(String[] workCode , WorkVO workVO);
    
    public String updateWork(WorkVO workVO) ;

    //////////////////////////PM///////////////////////////////////
    public void retrieveAllProjectList(ExtendPagingVO<WorkVO> pagingVO);
    public int retrieveAllProjectCount(ExtendPagingVO<WorkVO> pagingVO); 
    public String acceptAllWork(WorkVO workVO);
    public String refuseWork(WorkVO workVO);
}
