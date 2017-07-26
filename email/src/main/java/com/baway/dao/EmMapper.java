package com.baway.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baway.pojo.Email;

public interface EmMapper {
	public List<Email> selectAll();
	public List<Email> selectAllup();
	public List<Email> selectAlldown();
	public List<Email> selectwd();
	public List<Email> selectyd();
	public void delSome(String eids);
	public void updStatus(Integer id);
}
