package kr.or.ddit.work.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.init.FileSavePathInfo;
import kr.or.ddit.member.service.MailService;
import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.pushMsg.dao.PushMsgDAO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.work.dao.CntcWorkDAO;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.dao.WorkFileDAO;
import kr.or.ddit.work.vo.CntcWorkVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkBkmkVO;
import kr.or.ddit.work.vo.WorkFileVO;
import kr.or.ddit.work.vo.WorkParentVO;
import kr.or.ddit.work.vo.WorkVO;
@Service
public class workServiceImpl implements WorkService {

	@Inject
	private CntcWorkDAO cntDao;
	
	@Inject
	private WorkDAO workDao;
	
	@Inject
	private WorkFileDAO workFileDao;
	
	@Inject
    private MailService mailService;
 
	@Inject
	private FileSavePathInfo savePathInfo;

	@Inject
	private SimpMessagingTemplate messageTemplate;
	
	@Inject
	private PushMsgDAO pushDao;
	
	@Value("${email.sendId}")
	String id;
	
	/**
	 * 파일 처리 예시
	 */
	@Override
	@Transactional
	public ServiceResult insertWork(WorkVO workVO) {
		ServiceResult result = ServiceResult.FAIL;
		 
		
		int cnt = workDao.insertWork(workVO);
		if(cnt>0) {
			int rowcnt = insertWorkFile(workVO);
			result = ServiceResult.OK;
		}
		
		return result;
	}
	@Transactional
	private int insertWorkFile(WorkVO workVO) {
		List<WorkFileVO> workFileList =  workVO.getWorkFileList(); //각자의 vo에서 file을 담는 리스트 꺼냄
		if(workFileList==null || workFileList.isEmpty()) return 0;
		List<WorkFileVO> insertFileList = new ArrayList<>(); 
		// 이게 진짜로 인서트할 리스트(각자 인서트할 파일 리스트 새로 생성하면 됨) -->
		//ex) List<NewsFileVO> newsFileVO ex)List<NoticeFileVO> noticeFileVO
		for(WorkFileVO vo	: workFileList) {
			if("0".equals(vo.getWorkFileDelAt())) { //파일 삭제 여부가 0인 경우 파일을 추가해야 함
				insertFileList.add(vo);
			}
		}
		if(insertFileList==null || insertFileList.isEmpty()) return 0;
		workVO.setWorkFileList(insertFileList);//위에서 필터링된 리스트 다시 넣어줍니다.
		int cnt = workFileDao.insertWorkFile(workVO);
		 if(cnt>0) {
			cnt += updateFile(workVO);
		 } 
		return cnt;
	}
	@Transactional
	private int updateFile(WorkVO workVO) {
		List<WorkFileVO> workFileList =  workVO.getWorkFileList(); 
		if(workFileList==null || workFileList.isEmpty()) return 0;
		int cnt = workFileDao.workFileUpdate(workVO);
		System.out.println(" 파일 cnt 결과 " + cnt);
		return cnt;
		
	}
	
	///////////////////////////여기까지////////////////////////////////
	
	@Transactional
	@Override
	public String addWork(WorkVO workVO) {
	String result = "FAIL";
	ServiceResult end = ServiceResult.FAIL;	
	System.out.println(workVO);
	System.out.println();
	String upper = workVO.getUpperWorkCode();
	if(upper!=null && upper.length()>0) {
		String[] getUppers = upper.split(",");
		if(getUppers.length>0) {
			workVO.setUpperWorkCode(getUppers[0]);
		}
	}
		 int cnt = workDao.insertWork(workVO);
				if(cnt>0) {
					end = insertObserver(workVO);
					if(ServiceResult.OK.equals(end)) {
						end = insertWorkFiles(workVO); 
						if(ServiceResult.OK.equals(end)) {
							end = ServiceResult.OK;
						}else {
							result = "FILEFAIL";
						}
					}else {
						result = "OBSERVERFAIL";
					}
		 }
				if(ServiceResult.OK.equals(end)) {
					result = "OK";
				} 
				 
				
				return result;
	}

	@Transactional
	private ServiceResult insertWorkFiles(WorkVO workVO) {
		
		List<WorkFileVO> workFileList =  workVO.getWorkFileList(); //각자의 vo에서 file을 담는 리스트 꺼냄
		if(workFileList==null || workFileList.isEmpty()) return ServiceResult.OK;
		List<WorkFileVO> insertFileList = new ArrayList<>(); 
		// 이게 진짜로 인서트할 리스트(각자 인서트할 파일 리스트 새로 생성하면 됨) -->
		//ex) List<NewsFileVO> newsFileVO ex)List<NoticeFileVO> noticeFileVO
		for(WorkFileVO vo	: workFileList) {
			if("0".equals(vo.getWorkFileDelAt())) { //파일 삭제 여부가 0인 경우 파일을 추가해야 함
				insertFileList.add(vo);
			}
		}
		//ServiceResult result = ServiceResult.FAIL;
		if(insertFileList==null || insertFileList.isEmpty())  return ServiceResult.OK;
		workVO.setWorkFileList(insertFileList);//위에서 필터링된 리스트 다시 넣어줍니다.
		int cnt = workFileDao.insertWorkFile(workVO);
		 if(cnt>0) {
			cnt += updateFile(workVO);
			return ServiceResult.OK;
		 }else {
			return ServiceResult.FAIL;
		 }
		 
	}
	 
	@Transactional
	private ServiceResult insertObserver(WorkVO workVO) {
		
		String[] memIds = workVO.getMemIds();
		if(memIds==null) return ServiceResult.OK;
		String CtgryCode = workVO.getCtgryCode();
		String pCode = workVO.getPrjctNo();
		String workCode = workVO.getWorkCode();
		//String pCode = workVO.get
		List<ObserverVO> observerList = new ArrayList<>();
		for(String observerId : memIds) {
			ObserverVO vo = new ObserverVO();
			vo.setCtgryCode(CtgryCode+"");
			vo.setMemId(observerId);
			vo.setPrjctNo(pCode);
			vo.setWorkCode(workCode);
			observerList.add(vo);
		}
		
		int cnt = workDao.insertAllObserver(observerList);
		if(cnt>0) {
			return ServiceResult.OK;
		 }else {
			return ServiceResult.FAIL;
		 }
	}
	
	@Override
	public void retriveWorkList(ExtendPagingVO<WorkVO> pagingVO) {
		
		
		pagingVO.setDataList(workDao.selectAllWork(pagingVO));
		 
	}

	@Override
	public int retriveWorkCount(ExtendPagingVO<WorkVO> pagingVO) {
	
		return workDao.selectWorkCount(pagingVO);
		
	}

	@Override
	public void retrieveMyWorkList(ExtendPagingVO<WorkVO> pagingVO) {
			//acceptWrapper에서 vo를 꺼내와서 내 아이디를 찾아와야 함
		
		pagingVO.setDataList(workDao.selectMyWork(pagingVO));
	}

	@Override
	public int retrieveMyWorkCount(ExtendPagingVO<WorkVO> pagingVO) {
		
		
		return workDao.selectMyWorkCount(pagingVO);
	}

	@Override
	public  Map<String ,Object> selectMyWorkCheck(WorkVO workVO) {

		Map<String, Object> resultMap = new HashMap<>();
		WorkVO work= workDao.selectWorkDetail(workVO);
		
		if(work==null) {
			resultMap.put("result" , "FAIL");
			resultMap.put("why" , "해당 일감을 조회할 수 없습니다");
		}else {
			resultMap.put("result" , "SUCCESS");
			resultMap.put("why", work.getWorkReturnWhy());
		}
		return resultMap;
	}
	@Override
	public List<WorkVO> selectMyWorkPercent(WorkVO workVO) {
		List<WorkVO> percents=	workDao.selectMyWorkPercent(workVO);
		return percents;
	}

	@Override
	public List<WorkVO> selectMyWorkPerMonth(WorkVO workVO) {
		List<WorkVO> perMonth=	workDao.selectMyWorkPerMonth(workVO);
		return perMonth;
	}

 
	@Override
	public void selectAllBookMarkList(ExtendPagingVO<WorkVO> pagingVO) {
		pagingVO.setDataList(workDao.selecBookMarkWork(pagingVO));
		
	}

	@Override
	public int selectAllBookMarkCount(ExtendPagingVO<WorkVO> pagingVO) {
		return workDao.selectBookMarkWorkCount(pagingVO);
	}


	@Override
	public ServiceResult insertBookMark(WorkBkmkVO bookMarkVO) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt =	workDao.insertBookMarkWork(bookMarkVO);
		if(cnt >0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	
	
	@Override
	public ServiceResult deleteBookMark(WorkBkmkVO bookMarkVO) {
		
		WorkBkmkVO bookmark= workDao.selectBookMarkCheck(bookMarkVO);
		ServiceResult result = ServiceResult.FAIL;
		String bookCode = bookMarkVO.getWorkBkmkCode();
		//System.out.println(bookmark + "bookmark");
		String [] bookString =	bookCode.split("\\*");
		//System.out.println(bookString);
		String workCode =	bookString[2];
		
		//System.out.println(workCode);
		if(bookmark==null) return result;
	 	
		int cnt = workDao.deleteBookMarkWork(bookMarkVO);
		 if(cnt>0) {
			  result = ServiceResult.OK;
		} 
		return result;
	}

	@Override
	public  Map<String ,Object>  retrieveWorkDetail(WorkVO workVO) {
		WorkVO work = workDao.selectWorkDetailView(workVO);
		Map<String, Object> resultMap = new HashMap<>();
		if(work==null) {
			resultMap.put("result" , "FAIL");
			
		}else {
			resultMap.put("result" , "SUCCESS");
			resultMap.put("work", work);
		}
		return resultMap;
	}
	@Override
	public  Map<String ,Object>  retrieveWorkDetails(WorkVO workVO) {
		WorkVO work = workDao.selectWorkDetail(workVO);
		Map<String, Object> resultMap = new HashMap<>();
		if(work==null) {
			resultMap.put("result" , "FAIL");
			
		}else {
			resultMap.put("result" , "SUCCESS");
			resultMap.put("work", work);
		}
		return resultMap;
	}


	@Override
	public List<WorkParentVO> retrieveWorkParent(WorkVO workVO) {
	
		List<WorkParentVO> workList = workDao.selectUpperWork(workVO);
			 
			return workList;
	}
	
	
	
	

	@Override
	public ServiceResult ckeckCntInsertAt(CntcWorkVO cntWorkVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CntcWorkVO> retrieveCntWorkDetail(String workCode) {
		 List<CntcWorkVO> cntcList=	cntDao.selectCntcWorkList(workCode);
		return cntcList;
	}
	
	

	@Override
	public ServiceResult updateDegree(WorkVO workVO) {
		WorkVO saved = 	workDao.checkWork(workVO.getWorkCode());
		if(saved==null) throw new DataNotFoundException(workVO.getWorkCode());
		ServiceResult result = null;
		if(saved.getMemId().equals(workVO.getMemId())) {
			 int cnt = workDao.updateDegree(workVO);
			 if(cnt>0) {
				 result = ServiceResult.OK; //성공
			 }else {
				 result = ServiceResult.FAIL; //실패 
			 }
		}else {
			result = ServiceResult.NOTEXIST; //자기 일감 아닌데 수정하려한 경우 막기
		}
		return result;
	}
	@Override
	public List<WorkVO> retrieveAutoCompleteList(WorkVO workVO) {
		
			List<WorkVO>autoList =	workDao.autoComplete(workVO);
		return autoList;
	}
	
	@Override
	public WorkVO retrieveSimpleWorkInfo(String workCode) {
		WorkVO workVO = workDao.checkWork(workCode);
		return workVO;
	}
	@Override
	public WorkAuthVO retriveProjectPM(WorkVO workVO) {
		WorkAuthVO authVO = workDao.selectProjectPM(workVO);
		return authVO;
	}
	
	@Override
	public ServiceResult updateReqStatus(WorkVO workVO) {

		ServiceResult result = ServiceResult.FAIL;
		
		int cnt= workDao.updateWorkReqStatus(workVO);
		if(cnt >0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	@Override
	@Transactional
	public String refuseWork(WorkVO workVO) {
		 String result = "FAIL"; 
		 WorkVO vo = workDao.checkWork(workVO.getWorkCode());
		 List<ObserverVO> obList = new ArrayList<>();
		 
		 if(vo==null)	return result;
		 workVO.setWorkReqSttusCode("W00303");
		 int cnt= workDao.updateReqStatus(workVO);
			if(cnt >0) {
				result = workRefuseMail(workVO);
				if("SEND".equals(result)) {
					result = "OK";
					obList = workDao.selectWorkObserver(workVO);
					if(obList!=null&& obList.size()>0) {
						String[] memIds = new String[obList.size()];
						for(int i =0 ; i<obList.size();i++) {
							ObserverVO observer = obList.get(i);
							memIds[i] = observer.getMemId();
						}
						workVO.setMemIds(memIds);
					}
					
				}else {
					result ="SENDFAIL";
				}
				
			}
		return result;
	}
 
	
	
	
	@Transactional
	private String workRefuseMail(WorkVO workVO) {
		
		String result = "SENDFAIL";
		
		String to = workVO.getMemEmail();
		String subject = workVO.getMemName() + "님의 일감이 반려처리되었습니다";
		String text  = 
				 "<h2> " +workVO.getMemName() +  "의 " + workVO.getWorkSj() +"일감이 반려되었습니다<br>" ;  
		boolean mailResult = 	mailService.send(subject, text, id, to);
		 if(mailResult) {
			 result = "SEND";
		 }
		
		
		return result;
		
		
	}
	@Override
	@Transactional
	public String checkWorkId(String[] workCode, WorkVO workVO , String memName) {
			WorkVO vo = new WorkVO();
			ServiceResult result = ServiceResult.FAIL;
			String resultId = null;
			List<WorkVO> workList = new ArrayList<>();
			int cnt  = 0 ;
				for(int i =0 ; i< workCode.length;i++) {
					vo = workDao.checkWork(workCode[i]);
					if(vo.getMemId().equals(workVO.getMemId())) {
						cnt++;
						workList.add(vo);
					}
				}
			if(cnt==workCode.length) {
				 resultId 	 =	UpdateReqStatusAll(workList , memName ,workVO);
			
			}
			 
		return resultId;
	}
	@Transactional
	private String UpdateReqStatusAll(List<WorkVO> workList , String memName , WorkVO workVO ) {
		 
		WorkVO work = new WorkVO();
		int  mailCount = 0;
		String  result= "FAIL";
		 int cnt=0;
		// ServiceResult result = ServiceResult.FAIL;
		 for(WorkVO vo : workList) {
			 	vo.setWorkReqSttusCode("W00301");
			 	cnt+= workDao.updateWorkReqStatus(vo);
		 }
		 
		 
		 if(cnt==workList.size()) {
			 	result ="OK";
			 	WorkAuthVO authVO = workDao.selectProjectPM(workVO);	
			 	String to =  authVO.getMemEmail();
			 	String  subject =  memName +"님이 " + cnt+ "개의 일감 승인을 요청했습니다" ;
			 	String text = "<h2> " +memName +  "승인요청 일감</h2>" ;
			 	text += "<table border='1' cellpadding='0' cellspacing='0'><tr>";
			 	text+= "<th>일감코드</th> <th> 일감 제목</th></tr>"; 
			 	for(WorkVO vo : workList) {
			 		text+= "<tr><td>" + vo.getWorkCode() +"</td>" +  "<td> " + vo.getWorkSj() + "</td></tr>" ;
			 		mailCount ++;
			 	}
			 	text+= "</table>";
			 	boolean mailResult = 	mailService.send(subject, text, id, to);
			 	System.out.println(mailCount);
			 		if(workList.size() == mailCount) {
			 			result ="SEND";
			 		}else {
			 			result ="SENDFAIL";
			 		}
		 }else {
			 result = "FAIL";
		 }
		 
		 
		return result;
		 
				
	}
	@Override
	@Transactional
	public String deleteAllWork(String[] workCode, WorkVO workVO) {
		int cnt = 0;
		int end = 0 ;
		WorkVO vo = new WorkVO();
		ServiceResult result = ServiceResult.FAIL;
		String resultId = "DELFAIL";
		//List<WorkVO> workList = new ArrayList<>();
		//fileList = new ArrayList<>();
		//삭제할 파일 명 담기
		 
		List<String> saveNames = new ArrayList<>();
		for(int i =0 ; i< workCode.length;i++) {
			workVO.setWorkCode(workCode[i]);
			vo = workDao.selectWorkDetailView(workVO);
			if(vo == null) throw new DataNotFoundException(workCode[i]);
				cnt++;
				List<WorkFileVO> fileList = vo.getWorkFileList(); 
				if(!fileList.isEmpty()) { //파일 리스트 
					//saveNames.add()
					for( WorkFileVO fileVO :fileList) {
						if(fileVO.getWorkFileSavedNm()!=null) {
							saveNames.add(fileVO.getWorkFileSavedNm());
						}
							
					}
				}
		} 
		 int rowcnt = 0 ;
		//=======================
		 	if(cnt==workCode.length) {//다 내가 쓴 글일 경우
			 	vo.setWorkCodes(workCode);
				rowcnt = workFileDao.deleteALLWorkFile(vo);//메타데이터 데이터 삭제
				end = workFileDao.deleteALLAttatch(vo);
				if(rowcnt==end) {
					for(int i =0 ; i<cnt;i++) {
						workDao.deleteWorkInfo(workCode[i]);
						rowcnt ++ ;
					}
				}
				if(rowcnt > 0) {
					deleteBinaryFiles(saveNames);
					result = ServiceResult.OK;
					resultId = "OK";
				}// 
		}	
		
		
		return resultId;
	}
	@Transactional
	private void deleteBinaryFiles(List<String> saveNames) {
		 File saveFolder = savePathInfo.getTempSaveFolder();
		if(saveNames==null || saveNames.size()==0) return;
		for(String saveName : saveNames) {
			FileUtils.deleteQuietly(new File(saveFolder, saveName));
		}
	}
	@Transactional
	@Override
	public String updateWork(WorkVO workVO) {
		
		WorkVO saved = 	workDao.selectWorkDetailView(workVO);
		if(saved==null) throw new DataNotFoundException(workVO.getWorkCode());
		ServiceResult result = null;
		String resultId = null;
		int cnt= 0 ;
		int end = 0;
		 List<ProjectMemVO> roles=workVO.getRoleList();
		 String memRole = "";
		 String pCode =	workVO.getPrjctNo();
		 
		 for(ProjectMemVO vo :	roles ) {
			 String findPcode=vo.getPrjctNo() +"";
			 if(pCode.equals(findPcode)) {
				 memRole=	vo.getAuthor();
			 }
		 }
		 
		if(saved.getMemId().equals(workVO.getMemId()) ||"ROLE_PM".equals(memRole)) {
			 
			 cnt = workDao.updateWork(workVO);
			 if(cnt>0) {
				 result = ServiceResult.OK; //성공
				 //내용 업데이트
				 workDao.deleteAllObserver(workVO);
				 result =	insertObserver(workVO);
				 if(ServiceResult.OK.equals(result)) {
					 result = insertWorkFiles(workVO); 
						if(ServiceResult.OK.equals(result)) {
							result = ServiceResult.OK;
								deleteFiles(workVO);
								resultId = "OK";
							}
						}else {
							resultId = "FILEUPLOADFAIL";
						}
					}else {
						resultId = "OBSERVERFAIL";
					}
			 }else {
				 result = ServiceResult.FAIL; //실패 
				 resultId ="UPDATEFAIL";
			 }
		System.out.println("resultId : " + resultId);
		return resultId;
		
		}
		 
 
		
	 
	@Transactional
   public int deleteFiles (WorkVO workVO) {
		int rowcnt = 0 ; 
		int cnt = 0 ; 
		int end = 0 ;
		System.out.println("1");
	  String[] delFileNo = 	workVO.getDelFileNo() ;
	   if(delFileNo != null && delFileNo.length>0) {
		   List<String> saveNames = new ArrayList<>();
		   for(int i = 0 ; i< delFileNo.length ; i++) {
			   WorkFileVO workFile = workFileDao.selectWorkFileInfo(delFileNo[i]);
			   saveNames.add(workFile.getWorkFileSavedNm()) ;
		   }
		   cnt = workFileDao.deleteAttatches(workVO);
		   end =workFileDao.deleteWorkFile(workVO);
		   if(cnt==end) {
			   deleteBinaryFiles(saveNames);
		   }
		   
	   }
	  // String [] saveNames = new String[delFileNo.length];
	return rowcnt;
   }
	@Override
	public void retrieveAllProjectList(ExtendPagingVO<WorkVO> pagingVO) {
		pagingVO.setDataList(workDao.selectAllPeqList(pagingVO));
		
	
	}
	
	
	@Override
	public int retrieveAllProjectCount(ExtendPagingVO<WorkVO> pagingVO) {
		//return workDao.selectMyWorkCount(pagingVO);
		return workDao.selectAllPeqTotal(pagingVO);
	}
	
	@Override
	@Transactional
	public String acceptAllWork(WorkVO workVO) {
		String result = "FAIL" ;
		if(workVO.getWorkCodes().length==0||workVO.getWorkCodes()==null) return result;
		
		workVO.setWorkReqSttusCode("W00302");
		workVO.setWorkSttusCode("W00103");
		int cnt = workDao.updateAllAccept(workVO);
		if(cnt>0) {
			result = "OK";
			//result = workSendAccetMail(workVO);
			/*if("SEND".equals(result)) {
			}else {
				result ="SENDFAIL";
			}*/
		} 
		return result;
	}
	
	@Transactional
	private String workSendAccetMail(WorkVO workVO) {
		String result = "SENDFAIL";
		String[] works = 	workVO.getWorkCodes();
		String[] memIds = workVO.getMemIds();
		List<WorkAuthVO> mailInfo = new ArrayList<>();
		for(int i = 0 ; i <works.length;i++) {
			mailInfo.add(workDao.selectWorkManInfo(works[i]))
;		}
		
		int cnt = 0 ;
		List<PushMsgVO> pushList = new ArrayList<>();
		for(WorkAuthVO vo: mailInfo) {
		/*	String to = vo.getMemEmail();
			String subject = vo.getMemName() + "님의 일감이 승인처리되었습니다";
			String text  = 
					 "<h2> " +vo.getMemName() +  "의 " + vo.getWorkSj() +"일감이 승인되었습니다<br>" ;  
			boolean mailResult = 	mailService.send(subject, text, id, to);
			*/
			// 푸쉬알림 보내기 위한 로직
			String message = "'"+ vo.getWorkSj() +"' 일감의 승인이 완료되었습니다";
			List<MemSetVO> memSetList = pushDao.memSetList();
			for(MemSetVO memSet : memSetList) {
				if(memSet.getMemId().equals(vo.getMemId()) && memSet.getSetupCnNo() == 4 && memSet.getSetupValue().equals("1")) {
					PushMsgVO push = new PushMsgVO(message, vo.getMemId());
					messageTemplate.convertAndSend("/topic/push/" + vo.getMemId(),message);
					pushList.add(push);
				}
				cnt ++;
			}
			//--------------------------------
			
			/*memIds[cnt] = vo.getMemId();*/
			/*if(mailResult==true) {
				cnt ++;
			}else {
				break;
			}*/
		}
		//푸쉬알림 DB 저장
		pushDao.insertAllPushMsg(pushList);
		
			if(cnt==works.length) {
				workVO.setMemIds(memIds);
				result ="SEND";
	 		}else {
	 			result ="SENDFAIL";
	 		}
		return result;
		
	}
	
	 
 
}
