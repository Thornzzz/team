package com.bookshop01.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop01.member.dao.MemberDAO;
import com.bookshop01.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map  loginMap) throws Exception{
		MemberVO memberInfo = memberDAO.login(loginMap);
		Long mileageCheck = memberDAO.checkMemberMileage(memberInfo);
		if(mileageCheck== null || mileageCheck == 0) {
			memberInfo.setMember_mileage(0L);
		}else {
			memberInfo.setMember_mileage(mileageCheck);
		}
		return memberInfo;
	}
	
	@Override
	public boolean addMember(MemberVO memberVO) throws Exception{
		boolean checker = memberDAO.member_phone_check(memberVO);
		if(checker == true) {
			return checker;
		}
		memberDAO.insertNewMember(memberVO);
		return checker;
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	
	@Override
	public String Findid(Map<String, String> memberInfoMap) throws Exception{
		return memberDAO.Findid(memberInfoMap);
	}          
	
	@Override
	public String findPwd(Map<String, String> memberInfoMap) throws Exception{
		return memberDAO.findPwd(memberInfoMap);
	}
	
}
