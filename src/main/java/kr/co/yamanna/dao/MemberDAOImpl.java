package kr.co.yamanna.dao;

import java.util.List;

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

}
