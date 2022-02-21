package kr.or.ddit.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.vo.CareerVO;
import kr.or.ddit.member.vo.MemberVO;

@Service
public class CareerServiceImpl implements CareerService {
	@Inject
	MemberDAO memberDao;
	
	@Inject
	private PasswordEncoder passwordEncoder;

	@Transactional
	@Override
	public ServiceResult insertCareer(MemberVO memberInfo) {
		ServiceResult result = null;
		
		if(memberDao.selectMemberById(memberInfo.getMemId())==null) {
			String plain = memberInfo.getMemPass();
			String encoded = passwordEncoder.encode(plain);
			memberInfo.setMemPass(encoded);
			int cnt = createMember(memberInfo);
			List<CareerVO> list = new ArrayList<CareerVO>();
			List<CareerVO> careerList = null;
			if(cnt > 0) {
				if (memberInfo.getCareerList()!=null) { 
					careerList = memberInfo.getCareerList();
					for (CareerVO vo : careerList) {
						vo.setMemId(memberInfo.getMemId());
//						vo.setCareerMatterNo(careerMatterNo++);
						// xml에 보낼 리스트 생성
						list.add(vo);
					}
					cnt = memberDao.insertCareers(list);
				}
				result = ServiceResult.OK;
				}else {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}return result;
	}
	
	
	
	@Override
	public int createMember(MemberVO memberInfo) {
		return memberDao.insertMember(memberInfo);
	}
	
	
}
