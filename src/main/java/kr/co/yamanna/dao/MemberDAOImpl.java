package kr.co.yamanna.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamanna.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void signUpUser(MemberVO vo) {
		session.insert("kr.co.yamanna.dao.MemberDAO.insertUserInfo",vo);
	}

	@Override
	public boolean loginCheck(MemberVO vo) {
		String name = session.selectOne("kr.co.yamanna.dao.MemberDAO.loginCheck",vo);
		return (name==null) ? false : true;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		return session.selectOne("kr.co.yamanna.dao.MemberDAO.viewMember",vo);
	}

	@Override
	public void logout(HttpSession session) {
				
	}

	@Override
	public List<MemberVO> viewMemberList(int uno) {
		List<MemberVO> friendList = session.selectList("kr.co.yamanna.dao.MemberDAO.viewMemberList", uno);
		System.out.println(uno +": " + friendList);
		return friendList;
	}

	@Override
	public MemberVO selectMemberId(String id) {
		MemberVO vo = session.selectOne("kr.co.yamanna.dao.MemberDAO.selectMemberId",id);
		return vo;
	}

	@Override
	public MemberVO searchFriendById(Map<String, String> map) {
		MemberVO vo = session.selectOne("kr.co.yamanna.dao.MemberDAO.searchFriendId", map);
		return vo;
	}

	@Override
	public int selectRelation(Map<String, Integer> map) {
		int flag = session.selectOne("kr.co.yamanna.dao.MemberDAO.selectRelation",map);
		return flag;
	}

	@Override
	public void insertFriendRelation(Map<String, Integer> map) {
		session.insert("kr.co.yamanna.dao.MemberDAO.insertRelation", map);
	}

	@Override
	public int selectUno(String id) {
		int no = session.selectOne("kr.co.yamanna.dao.MemberDAO.selectUno", id);
		return no;
	}

	@Override
	public int vaildUserInfo(String id) {
		int no = session.selectOne("kr.co.yamanna.dao.MemberDAO.vaildUserInfo", id);
		return no;
	}
	
	

	
}
