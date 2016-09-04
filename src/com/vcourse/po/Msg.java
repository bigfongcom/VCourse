package com.vcourse.po;

public class Msg {
	private String msg;
	private String jumpUrl;
	private Integer jumpTime=2;
	

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getJumpUrl() {
		return jumpUrl;
	}

	public void setJumpUrl(String jumpUrl) {
		this.jumpUrl = jumpUrl;
	}

	public Integer getJumpTime() {
		return jumpTime;
	}

	public void setJumpTime(Integer jumpTime) {
		this.jumpTime = jumpTime;
	}
	
	public Msg() {
	}
	public Msg(String msg) {
		this.msg = msg;
		this.jumpUrl = "javascript:history.go(-1);";
	}
	
	public Msg(String msg,String jumpUrl) {
		this.msg = msg;
		this.jumpUrl = jumpUrl;
	}
	
	public Msg(String msg,String jumpUrl, Integer jumpTime) {
		this.msg = msg;
		this.jumpUrl = jumpUrl;
		this.jumpTime = jumpTime;
	}

	

	@Override
	public String toString() {
		return "Err [msg=" + msg + ", jumpUrl=" + jumpUrl + ", jumpTime=" + jumpTime
				+ "]";
	}

	 
	
	
}
