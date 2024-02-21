package com.bookshop01.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop01.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public boolean addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public String Findid(Map<String, String> memberInfoMap) throws Exception;
	public String findPwd(Map<String, String> memberInfoMap) throws Exception;
}
