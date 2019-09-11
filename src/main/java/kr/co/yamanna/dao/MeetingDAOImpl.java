package kr.co.yamanna.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamanna.vo.MeetingVO;
import kr.co.yamanna.vo.MemberVO;

@Repository
public class MeetingDAOImpl implements MeetingDAO {
	

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertMeeting(MeetingVO vo) {
		session.insert("kr.co.yamanna.dao.MeetingDAO.insertMeetingInfo",vo);
	}

	@Override
	public int selectMeetingNum(String mid) {
		int num = session.selectOne("kr.co.yamanna.dao.MeetingDAO.selectMeetingNo",mid);
		return num;
	}

	@Override
	public void insertMeetingRelation(Map<String, Object> map) {
		session.insert("kr.co.yamanna.dao.MeetingDAO.insertMeetingMember", map);
	}

	@Override
	public List<List<Object>> selectMeetingList(int uno) {
		//전체 리스트
		List<List<Object>> list = new ArrayList<List<Object>>();
		
		List<MeetingVO> meetingList = session.selectList("kr.co.yamanna.dao.MeetingDAO.selectMeetingList",uno);
		
		for(MeetingVO vo : meetingList) {
			List<Object> item = new ArrayList<Object>();
			
			int mno = vo.getMno();
			List<MemberVO> memberList = session.selectList("kr.co.yamanna.dao.MeetingDAO.selectMeetingMemberList", mno);
			
			item.add(vo);
			item.add(memberList);
			
			list.add(item);			
		}
		
		return list;
	}

	@Override
	public MeetingVO selectMeetingDetailInfo(int mno) {
		MeetingVO vo = session.selectOne("kr.co.yamanna.dao.MeetingDAO.selectMeetingDetailInfo", mno);
		return vo;
	}

	@Override
	public List<MemberVO> selectMeetingMember(int mno) {
		List<MemberVO> list = session.selectList("kr.co.yamanna.dao.MeetingDAO.selectMeetingMember",mno);
		return list;
	}
	
	
}
