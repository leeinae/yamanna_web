package kr.co.yamanna.vo;

public class PointVO {
	private double xpos;
	private double ypos;
	
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
	
	public PointVO(double xpos, double ypos) {
		super();
		this.xpos = xpos;
		this.ypos = ypos;
	}
	
	
}
