package kr.or.ddit.mypage.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.commons.exception.UserNotFoundExcpetion;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.init.FileSavePathInfo;
import kr.or.ddit.mypage.dao.MyAccountDAO;
import kr.or.ddit.mypage.vo.CareerListVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.mypage.vo.MyCareerVO;
import kr.or.ddit.mypage.vo.MyMemVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MyAccountServiceImpl implements MyAccountService {
	
	@Inject
	MyAccountDAO mydao;
	
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Resource(name="authManager")
	private AuthenticationManager authenticationManager;
	
	@Inject
	private FileSavePathInfo fileSavePathInfo;
	private File saveFolder;
	
	@Override
	public MyMemVO retrieveMyAccountInfo(String memId) {
		MyMemVO savedmem = mydao.selectMyAccountInfo(memId);
		if(savedmem==null) {
			throw new UserNotFoundExcpetion(memId + " 회원 없음"); 
		}
		return mydao.selectMyAccountInfo(memId);
	}
	
	@Override
	public List<MyCareerVO> retrieveMyCareer(String memId) {
		MyMemVO savedmem = mydao.selectMyAccountInfo(memId);
		if(savedmem==null) {
			throw new UserNotFoundExcpetion(memId + " 회원 없음"); 
		} 
		return mydao.selectMyCareer(memId);
	}
	
	@Transactional
	@Override
	public ServiceResult modifyMyAccountInfo(MyMemVO mem) {
		retrieveMyAccountInfo(mem.getMemId());
		ServiceResult result = ServiceResult.FAIL;
		int cnt = mydao.updateMyAccountInfo(mem);
		if(cnt > 0) {
			result = ServiceResult.OK;
		} 
		return result;
	}
	 
	@Transactional
	@Override
	public ServiceResult modifyMyCareer(CareerListVO vo) {
		retrieveMyAccountInfo(vo.getMemId()); 
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		if(vo.getMyCareerList()!=null && !vo.getMyCareerList().isEmpty()) { 
			for(MyCareerVO career : vo.getMyCareerList()) {
				cnt += mydao.updateCareer(career);
			}
		}
		System.out.println("cnt : " + cnt);
		if(vo.getNewCareerList()!=null && !vo.getNewCareerList().isEmpty()) {
			System.out.println(vo.getNewCareerList().get(0));
			cnt += mydao.insertMyCareer(vo);  
		}    
		System.out.println("cnt : " + cnt);
		 
		if(cnt > 0) {
			result = ServiceResult.OK;
		}   
		System.out.println("result : " + result);
		return result; 
	}

	 
	@Transactional
	@Override
	public ServiceResult changePassword(String oldPassword, String newPassword) throws AuthenticationException{
		Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
		if(currentUser==null) {
			throw new AccessDeniedException("현재 사용자의 컨텍스트에서 인증 개체를 찾을 수 없으므로 암호를 변경할 수 없습니다.");
		}
		String memId = currentUser.getName();  
		if(authenticationManager != null) {
			log.info(memId + "회원의 비밀번호 변경 요청에 대한 사용자 재인증");
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(memId, oldPassword));
			log.info(oldPassword);  
		}else {
			log.info("인증 관리자가 설정되지 않았습니다. 비밀번호는 재확인되지 않습니다.");
		}
		log.info(memId + "회원의 비밀번호 변경"); 
		
		ServiceResult result = ServiceResult.FAIL;
		String encodedPass = passwordEncoder.encode(newPassword);
		MyMemVO mem = new MyMemVO(memId, encodedPass);
		int cnt = mydao.updateMyPassword(mem);  
		if(cnt > 0) {
			result = ServiceResult.OK; 
			Authentication newAuthentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(memId, newPassword));
			SecurityContextHolder.getContext().setAuthentication(newAuthentication);
			log.info("logTest");
		}else { 
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public ServiceResult removeCareer(CareerListVO career) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = mydao.deleteCareer(career);
		if(cnt > 0) { 
			result = ServiceResult.OK;
		}
		return result; 
	}

	@Override
	public int modifyMyProfileSetting(MyMemVO mem) { 
		MyMemVO savedmem = mydao.selectMyAccountInfo(mem.getMemId());
		if(savedmem==null) {
			throw new UserNotFoundExcpetion(mem.getMemId() + " 회원 없음"); 
		}
		int cnt = mydao.updatetMyProfileImg(mem);
		if(cnt > 0) { 
			uploadProfileImg(mem); 
		}  
		return cnt;
	}  

	private void uploadProfileImg(MyMemVO mem) {
		MultipartFile profileImg = mem.getProfileImg();
		if(profileImg==null) return;
		String savename = mem.getProflImgNm(); 
		saveFolder = fileSavePathInfo.getMemberSaveFolder();
		File saveFile = new File(saveFolder, savename);
		try(
			InputStream is = profileImg.getInputStream();	
			FileOutputStream fos = new FileOutputStream(saveFile);
				){ 
			int pointer = -1;
			byte[] buffer = new byte[1024];
			while((pointer = is.read(buffer)) != -1) {
				fos.write(buffer, 0, pointer);
			}
			fos.flush();
			
//			FileUtils.copyInputStreamToFile(is, saveFile);
		} catch (IOException e) {
			throw new RuntimeException(e);    
		}
		
	}

	@Override
	public List<MemSetVO> retrieveMyProfileSet(String memId) {
		return mydao.selectMyProfileSet(memId); 
	}

	@Override
	public ServiceResult modifyMyProfileSet(MyMemVO memSet) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		if(memSet.getProfileImg()!=null && !memSet.getProfileImg().isEmpty()) {
			cnt += modifyMyProfileSetting(memSet);
		}else { 
			cnt++;
		} 
		List<MemSetVO> memSetList = memSet.getMemSetList();
		if(cnt>0) {  
			for(MemSetVO set : memSetList) {
				set.setMemId(memSet.getMemId()); 
				cnt += mydao.updateMyProfileSet(set);
			}
		}
		if(cnt>0) {
			result = ServiceResult.OK;
		} 
		return result;
	}

	@Override
	public List<MemSetVO> retrieveMyPushSet(String memId) {
		return mydao.selectMyPushSet(memId);
	}

	@Override
	public ServiceResult modifyMyPushSet(MyMemVO memSet) {
		MyMemVO savedmem = mydao.selectMyAccountInfo(memSet.getMemId());
		if(savedmem==null) {
			throw new UserNotFoundExcpetion(memSet.getMemId() + " 회원 없음"); 
		}
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		List<MemSetVO> memSetList = memSet.getMemSetList();
		for(MemSetVO set : memSetList) {
			set.setMemId(memSet.getMemId()); 
			cnt += mydao.updateMyPushSet(set); 
		}
		if(cnt>0) {
			result = ServiceResult.OK;
		} 
		return result;
	}



	
}
