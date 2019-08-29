package kr.co.yamanna.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.yamanna.vo.MemberVO;

public interface MemberDAO {
	public void signUpUser(MemberVO vo);
	//로그인 체크
	public boolean loginCheck(MemberVO vo);
	//로그인 정보
	public MemberVO viewMember(MemberVO vo);
	//로그아웃
	public void logout(HttpSession session);
	
	//친구 목록
	public List<MemberVO> viewMemberList(int uno);
	
	//id로 멤버 검색
	public MemberVO selectMemberId(String id);
	
	//id로 친구 검색
	public MemberVO searchFriendById(String id);
}
