package com.bookshop01.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public boolean member_phone_check(MemberVO memberVO) throws DataAccessException;
	public String Findid(Map<String, String> memberInfoMap) throws DataAccessException;
	public String findPwd(Map<String, String> memberInfoMap) throws DataAccessException;
	//public String unregister(Map<String,String> memberInfoMap) throws DataAccessException;
}
