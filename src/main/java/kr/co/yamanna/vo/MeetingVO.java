package kr.co.yamanna.vo;

import java.util.UUID;

public class MeetingVO {
	private String mname;
	private int mno;
	private String mid;
	private double xpos;
	private double ypos;
	private String mdate;
	
	
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public double getXpos() {
		return xpos;
	}
	public void setXpos(double xpos) {
		this.xpos = xpos;
	}
	public double getYpos() {
		return ypos;
	}
	public void setYpos(double ypos) {
		this.ypos = ypos;
	}
	
	@Override
	public String toString() {
		return "MeetingVO [mname=" + mname + ", mno=" + mno + ", mid=" + mid + ", xpos=" + xpos + ", ypos=" + ypos
				+ ", mdate=" + mdate + "]";
	}
	

	
	
}
