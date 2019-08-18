package kr.co.yamanna.service;

import java.util.Map;

import kr.co.yamanna.vo.MeetingVO;


public interface MeetingService {
	public void insertMeeting(MeetingVO vo);
	public int selectMeetingNum(String mid);
	public void insertMeetingRelation(Map<String, Object> map);
}
