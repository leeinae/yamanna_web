package kr.co.yamanna.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yamanna.dao.MeetingDAO;
import kr.co.yamanna.vo.MeetingVO;
import kr.co.yamanna.vo.MemberVO;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	private MeetingDAO meetingDao;
	
	@Override
	public void insertMeeting(MeetingVO vo) {
		meetingDao.insertMeeting(vo);
	}

	@Override
	public int selectMeetingNum(String mid) {
		int num = meetingDao.selectMeetingNum(mid);
		return num;
	}

	@Override
	public void insertMeetingRelation(Map<String, Object> map) {
		meetingDao.insertMeetingRelation(map);
	}

	@Override
	public List<List<Object>> selectMeetingList(int uno) {
		List<List<Object>> list = meetingDao.selectMeetingList(uno);
		return list;
	}

	@Override
	public MeetingVO selectMeetingDetailInfo(int mno) {
		MeetingVO vo = meetingDao.selectMeetingDetailInfo(mno);
		return vo;
	}

	@Override
	public List<MemberVO> selectMeetingMember(int mno) {
		List<MemberVO> list = meetingDao.selectMeetingMember(mno);
		return list;
	}
	

}
