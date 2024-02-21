package com.bookshop01.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.bookshop01.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	@Override
	public boolean member_phone_check(MemberVO memberVO) throws DataAccessException{
		int checkParam = sqlSession.selectOne("mapper.member.member_phone_check", memberVO);
		System.out.println(memberVO.getMember_name());
		System.out.println(memberVO.getTel1());
		System.out.println(memberVO.getTel2());
		System.out.println(memberVO.getTel3());
		System.out.println(memberVO.getHp1());
		System.out.println(memberVO.getHp2());
		System.out.println(memberVO.getHp3());
		System.out.println("dao checkParam value" + checkParam);
		return checkParam > 0;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		int addParam = sqlSession.insert("mapper.member.insertNewMember",memberVO);
		System.out.println("addParam 값" + addParam);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public String Findid(Map<String, String> memberInfoMap)throws DataAccessException{
		Map<String, String> params = new HashMap();
		System.out.println("member:"+memberInfoMap);
		params.put("member_name", memberInfoMap.get("member_name"));
		System.out.println("name:" + memberInfoMap.get("member_name"));
		params.put("HP1", memberInfoMap.get("HP1"));
		params.put("HP2", memberInfoMap.get("HP2"));
		params.put("HP3", memberInfoMap.get("HP3"));
		
		
		String result = sqlSession.selectOne("mapper.member.Findid",params);
		System.out.println("DAO 반환 결과: "+ result);
		return result;
	}
	
	@Override
	public String findPwd(Map<String, String> memberInfoMap) throws DataAccessException{
		Map<String,String> params =new HashMap<>();
		params.put("member_id", memberInfoMap.get("member_id"));
		params.put("member_name", memberInfoMap.get("member_name"));
		
		String result =sqlSession.selectOne("mapper.member.findPwd", params);
		
		return result;
		
	} 
	/*@Override
	public String unregister(Map<String,String> memberInfoMap) throws DataAccessException{
		Map<String, String> params = new
		
	}*/
	
	
	
}
