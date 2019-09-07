package kr.co.yamanna.vo;

import java.util.UUID;

public class MeetingVO {
	private String mname;
	private int mno;
	private String mid;
	private double xpos;
	private double ypos;
	private String mdate;
	private String pname;
	private String url;
	private String pphone;
	private String praddr; 
	private String paddr;
	
	
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
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPphone() {
		return pphone;
	}
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	public String getPraddr() {
		return praddr;
	}
	public void setPraddr(String praddr) {
		this.praddr = praddr;
	}
	public String getPaddr() {
		return paddr;
	}
	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}
	@Override
	public String toString() {
		return "MeetingVO [mname=" + mname + ", mno=" + mno + ", mid=" + mid + ", xpos=" + xpos + ", ypos=" + ypos
				+ ", mdate=" + mdate + ", pname=" + pname + ", url=" + url + ", pphone=" + pphone + ", praddr=" + praddr
				+ ", paddr=" + paddr + "]";
	}

	

	
	
}
