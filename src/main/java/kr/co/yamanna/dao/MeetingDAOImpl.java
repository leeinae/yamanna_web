package kr.co.yamanna.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamanna.vo.MeetingVO;

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
	public List<MeetingVO> selectMeetingList(int uno) {
		List<MeetingVO> list = session.selectList("kr.co.yamanna.dao.MeetingDAO.selectMeetingList",uno);
		return list;
	}
}
