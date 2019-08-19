package kr.co.yamanna.dao;

import java.util.List;
import java.util.Map;

import kr.co.yamanna.vo.MeetingVO;

public interface MeetingDAO {
	//최종 미팅 결정 장소
	public void insertMeeting(MeetingVO vo);
	//방금 넣은 미팅 id로 검색해서 no 받아오기 
	public int selectMeetingNum(String mid);
	//참여하는 user들을 relation table에 넣어주기
	public void insertMeetingRelation(Map<String, Object> map);
	//내가 속한 meeting List 받아오기
	public List<MeetingVO> selectMeetingList(int uno);
}
