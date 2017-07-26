package com.baway.pojo;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	private Integer code;
	private String result;
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public static Msg success(){
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setResult("处理成功");
		return msg;
	}
	
	public static Msg fail(){
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setResult("处理失败");
		return msg;
	}
	
	public Msg add(String key,Object value){
		this.getExtend().put(key,value);
		return this;
	}

	public Msg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Msg(Integer code, String result, Map<String, Object> extend) {
		super();
		this.code = code;
		this.result = result;
		this.extend = extend;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	
}
