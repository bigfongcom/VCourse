package com.vcourse.po;

import java.util.List;

public class AjaxReturn {
	private int status = 0;
	private String msg ="";
	private List<Object> result;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<Object> getResult() {
		return result;
	}
	public void setResult(List<Object> result) {
		this.result = result;
	}
	public AjaxReturn(int status, String msg, List<Object> result) {
		super();
		this.status = status;
		this.msg = msg;
		this.result = result;
	}
	public AjaxReturn() {
	}
	
	
	
}
