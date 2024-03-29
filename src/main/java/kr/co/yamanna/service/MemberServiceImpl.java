package kr.co.yamanna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yamanna.dao.MemberDAO;
import kr.co.yamanna.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public void signUp(MemberVO vo) {
		memberDao.signUpUser(vo);
	}

	@Override
	public boolean loginCheck(MemberVO mvo, HttpSession session) {
		boolean result = memberDao.loginCheck(mvo);
		if(result) {
			MemberVO vo = viewMember(mvo);
			session.setAttribute("userId", vo.getId());			
			session.setAttribute("userName", vo.getNickname());
			session.setAttribute("xpos", vo.getXpos());
			session.setAttribute("ypos", vo.getYpos());
			session.setAttribute("userNo", vo.getUno());
		}
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		return memberDao.viewMember(vo);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public List<MemberVO> viewMemberList(HttpSession session) {
		int uno = (int) session.getAttribute("userNo");
		List<MemberVO> friendList = memberDao.viewMemberList(uno);
		return friendList;
	}

	@Override
	public MemberVO selectMemberId(String id) {
		MemberVO vo = memberDao.selectMemberId(id);
		return vo;
	}


	@Override
	public MemberVO searchFriendById(Map<String, String> map) {
		MemberVO vo = memberDao.searchFriendById(map);
		return vo;
	}

	@Override
	public int selectRelation(Map<String, Integer> map) {
		int flag = memberDao.selectRelation(map);
		return flag;
	}

	@Override
	public void insertFriendRelation(Map<String, Integer> map) {
		memberDao.insertFriendRelation(map);
	}

	@Override
	public int selectUno(String id) {
		int no = memberDao.selectUno(id);
		return no;
	}

	@Override
	public int vaildUserInfo(String id) {
		int no = memberDao.vaildUserInfo(id);
		return no;
	}
	
	

}
