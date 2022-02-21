package kr.or.ddit.notice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.init.FileSavePathInfo;
import kr.or.ddit.notice.dao.NoticeDAO;
import kr.or.ddit.notice.dao.NoticeFileDAO;
import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.notice.vo.NoticePagingVO;
import kr.or.ddit.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

   @Inject
   private NoticeDAO noticeDAO;

   @Inject
   private NoticeFileDAO noticeFileDAO;

   @Inject
   private FileSavePathInfo savePathInfo;
   
   @Override
   public NoticeVO retriveNoticeById(String noticeCode) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int retriveNoticeCount(NoticePagingVO<NoticeVO> noticePagingInfo) {
      // TODO Auto-generated method stub
      return noticeDAO.selectTotalRecord(noticePagingInfo);
   }

   @Override
   public List<NoticeVO> retriveNoticeList(NoticePagingVO<NoticeVO> noticePagingInfo) {
      // TODO Auto-generated method stub
      return noticeDAO.selectNoticeList(noticePagingInfo);
   }

   @Override
   public NoticeVO retriveNotice(int noticeCode) {
      NoticeVO noticeInfo = noticeDAO.selectNotice(noticeCode);
      if (noticeInfo == null)
         throw new DataNotFoundException(noticeCode + "");
      return noticeInfo;
   }

   @Override
   public ServiceResult createNotice(NoticeVO noticeInfo) {
      ServiceResult result = ServiceResult.FAIL;

      int cnt = noticeDAO.insertNotice(noticeInfo);
      if (cnt > 0) {
         ServiceResult rowcnt = insertnoticeFiles(noticeInfo);
         result = ServiceResult.OK;
      }

      return result;
   }

   @Transactional
   private int insertNoticeFile(NoticeVO noticeInfo) {
      List<NoticeFileVO> noticeFileList =  noticeInfo.getNoticeFileList(); //각자의 vo에서 file을 담는 리스트 꺼냄
      if(noticeFileList==null || noticeFileList.isEmpty()) return 0;
      List<NoticeFileVO> insertFileList = new ArrayList<>(); 
      // 이게 진짜로 인서트할 리스트(각자 인서트할 파일 리스트 새로 생성하면 됨) -->
      //ex) List<NewsFileVO> newsFileVO ex)List<NoticeFileVO> noticeFileVO
      for(NoticeFileVO vo   : noticeFileList) {
         if("0".equals(vo.getNoticeFileDelAt())) { //파일 삭제 여부가 0인 경우 파일을 추가해야 함
            insertFileList.add(vo);
         }
      }
		if(insertFileList==null || insertFileList.isEmpty()) return 0;
		noticeInfo.setNoticeFileList(insertFileList);//위에서 필터링된 리스트 다시 넣어줍니다.
		int cnt = noticeFileDAO.insertNoticeFile(noticeInfo);
		 if(cnt>0) {
			cnt += updateFile(noticeInfo);
		 } 
		return cnt;
   }

	@Transactional
	private ServiceResult insertnoticeFiles(NoticeVO noticeVO) {
		List<NoticeFileVO> noticeFileList =  noticeVO.getNoticeFileList(); //각자의 vo에서 file을 담는 리스트 꺼냄
		if(noticeFileList==null || noticeFileList.isEmpty()) return ServiceResult.OK;
		List<NoticeFileVO> insertFileList = new ArrayList<>(); 
		// 이게 진짜로 인서트할 리스트(각자 인서트할 파일 리스트 새로 생성하면 됨) -->
		//ex) List<NewsFileVO> newsFileVO ex)List<NoticeFileVO> noticeFileVO
		for(NoticeFileVO vo	: noticeFileList) {
			if("0".equals(vo.getNoticeFileDelAt())) { //파일 삭제 여부가 0인 경우 파일을 추가해야 함
				insertFileList.add(vo);
			}
		}
		//ServiceResult result = ServiceResult.FAIL;
		if(insertFileList==null || insertFileList.isEmpty())  return ServiceResult.OK;
		noticeVO.setNoticeFileList(insertFileList);//위에서 필터링된 리스트 다시 넣어줍니다.
		int cnt = noticeFileDAO.insertNoticeFile(noticeVO);
		 if(cnt>0) {
			cnt += updateFile(noticeVO);
			return ServiceResult.OK;
		 }else {
			return ServiceResult.FAIL;
		 }
		 
	}
   
   
   public ServiceResult modifyNotice(NoticeVO noticeInfo) {
      NoticeVO saved =    noticeDAO.selectNoticeDetailView(noticeInfo);
      if(saved==null) throw new DataNotFoundException(noticeInfo.getNoticeCode());
      ServiceResult result = null;
      int cnt= 0 ;
      System.out.println(saved.getMemId()+ "관리자"  + noticeInfo.getMemId() );
      if(saved.getMemId().equals(noticeInfo.getMemId())) {
          
          cnt = noticeDAO.updateNotice(noticeInfo);
          if(cnt>0) {
             result = ServiceResult.OK; //성공
            
            }else {
               result = ServiceResult.FAIL; //실패             }
            }
          
      }
      return result;
      }
      

   private int deleteFiles(NoticeVO noticeInfo) {
      int rowcnt = 0 ; 
      int cnt = 0 ; 
      int end = 0 ;
      System.out.println("1");
     String[] delFileNo =    noticeInfo.getDelFileNo() ;
      if(delFileNo != null && delFileNo.length>0) {
         List<String> saveNames = new ArrayList<>();
         for(int i = 0 ; i< delFileNo.length ; i++) {
            NoticeFileVO noticeFile = noticeFileDAO.selectNoticeFileInfo(delFileNo[i]);
            saveNames.add(noticeFile.getNoticeFileSavedNm()) ;
         }
         System.out.println("2Z");
         cnt = noticeFileDAO.deleteAttatches(noticeInfo);
         end =noticeFileDAO.deleteNoticeFile(noticeInfo);
         if(cnt==end) {
            System.out.println("3");
            deleteBinaryFiles(saveNames);
         }
      }
     // String [] saveNames = new String[delFileNo.length];
   return rowcnt;
   }

   private void deleteBinaryFiles(List<String> saveNames) {
      File saveFolder = savePathInfo.getTempSaveFolder();
      if(saveNames==null || saveNames.size()==0) return;
      for(String saveName : saveNames) {
         FileUtils.deleteQuietly(new File(saveFolder, saveName));
      }
   }


   @Transactional
   private int updateFile(NoticeVO noticeInfo) {
      List<NoticeFileVO> noticeFileList = noticeInfo.getNoticeFileList();
      if (noticeFileList == null || noticeFileList.isEmpty())
         return 0;
      int cnt = noticeFileDAO.noticeFileUpdate(noticeInfo);
      return cnt;

   }

   @Override
   @Transactional
   public ServiceResult updateNotice(NoticeVO noticeInfo) {
	      NoticeVO saved =    noticeDAO.selectNoticeDetailView(noticeInfo);
	      if(saved==null) throw new DataNotFoundException(noticeInfo.getNoticeCode());
	      ServiceResult result = null;
	      int cnt= 0 ;
	      System.out.println(saved.getMemId()+ "관리자"  + noticeInfo.getMemId() );
			if(saved.getMemId().equals(noticeInfo.getMemId())) {
				 cnt = noticeDAO.updateNotice(noticeInfo); 
				 if(cnt>0) {
				 result = ServiceResult.OK; //성공
				 //내용 업데이트
					 if(ServiceResult.OK.equals(result)) {
						 result = insertnoticeFiles(noticeInfo); 
								  deleteFiles(noticeInfo);
					 }else{
						 result = ServiceResult.FAIL; //파일 실패
					 }
				 }else {
					 result = ServiceResult.FAIL; //실패 
				 }
			}
			return result;
	   }


   
   
   
   
	@Override
	public Map<String, Object> retrieveNoticeDetail(NoticeVO noticeInfo) {
		NoticeVO notice = noticeDAO.selectNoticeDetailView(noticeInfo);
		Map<String, Object> resultMap = new HashMap<>();
		if(notice==null) {
			resultMap.put("result" , "FAIL");
			
		}else {
			resultMap.put("result" , "SUCCESS");
			resultMap.put("notice", notice);
		}
		return resultMap;
	}

	@Override
	@Transactional
	public String removeNotice(String[] noticeCode, NoticeVO noticeInfo) {
		int cnt = 0;
		int end = 0 ;
		NoticeVO vo = new NoticeVO();
		ServiceResult result = ServiceResult.FAIL;
		String resultId = "DELFAIL";
		//삭제할 파일 명 담기
		List<String> saveNames = new ArrayList<>();
		for(int i =0 ; i< noticeCode.length;i++) {
			noticeInfo.setNoticeCode(noticeCode[i]);
			vo = noticeDAO.selectNoticeDetailView(noticeInfo);
			if(vo == null) throw new DataNotFoundException(noticeCode[i]);
			if(vo.getMemId().equals(noticeInfo.getMemId())) {
				cnt++;
				List<NoticeFileVO> fileList = vo.getNoticeFileList(); 
				if(!fileList.isEmpty()) { //파일 리스트 
					//saveNames.add()
					for(NoticeFileVO fileVO :fileList) {
						if(fileVO.getNoticeFileSavedNm()!=null) {
							saveNames.add(fileVO.getNoticeFileSavedNm());
						}	
					}
				}
			}
		} 
		 int rowcnt = 0 ;
		 	if(cnt==noticeCode.length) {//다 내가 쓴 글일 경우
			 	vo.setNoticeCodes(noticeCode);
				rowcnt = noticeFileDAO.deleteALLNoticeFile(vo);//메타데이터 데이터 삭제
				end = noticeFileDAO.deleteALLAttatch(vo);
				if(rowcnt==end) {
					for(int i =0 ; i<cnt;i++) {
						noticeDAO.deleteNoticeInfo(noticeCode[i]);
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



}