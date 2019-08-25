package kr.co.yamanna.vo;

public class MemberVO {
	private int uno;
	private String id;
	private String pw;
	private String email;
	private String nickname;
	private Double xpos;
	private Double ypos;
	private String addr;
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Double getXpos() {
		return xpos;
	}
	public void setXpos(Double xpos) {
		this.xpos = xpos;
	}
	public Double getYpos() {
		return ypos;
	}
	public void setYpos(Double ypos) {
		this.ypos = ypos;
	}
	
	@Override
	public String toString() {
		return "MemberVO [uno=" + uno + ", id=" + id + ", pw=" + pw + ", email=" + email + ", nickname=" + nickname
				+ ", xpos=" + xpos + ", ypos=" + ypos + ", addr=" + addr + "]";
	}
	

	
}
