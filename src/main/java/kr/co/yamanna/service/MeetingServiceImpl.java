package kr.co.yamanna.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yamanna.dao.MeetingDAO;
import kr.co.yamanna.vo.MeetingVO;

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
	

}
