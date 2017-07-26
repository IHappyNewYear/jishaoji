package com.baway.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baway.dao.EmMapper;
import com.baway.pojo.Email;
import com.baway.service.EmService;
@Service
@Transactional
public class EmServiceImpl implements EmService{
	@Autowired
	private EmMapper em;
	
	@Override
	public List<Email> selectAll() {
		List<Email> selectAll = em.selectAll();
		return selectAll;
	}

	@Override
	public List<Email> selectAllup() {
		List<Email> selectAllup = em.selectAllup();
		return selectAllup;
	}

	@Override
	public List<Email> selectAlldown() {
		List<Email> selectAlldown = em.selectAlldown();
		return selectAlldown;
	}

	@Override
	public List<Email> selectwd() {
		List<Email> selectwd = em.selectwd();
		return selectwd;
	}

	@Override
	public List<Email> selectyd() {
		List<Email> selectyd = em.selectyd();
		return selectyd;
	}

	@Override
	public void delSome(String eids) {
		em.delSome(eids);
	}

	@Override
	public void updStatus(Integer id) {
		em.updStatus(id);
	}

}
