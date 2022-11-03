package com.myproject.yse;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dto.MemberDto;

@Service
public class airportServiceImpl implements airportService {

	@Autowired
	airportDAO airportdao;

	@Override
	public List<String> nation() {
		return this.airportdao.nation();
	}
	
	@Override
	public List<Map<String, Object>> detail(String depart){
		return this.airportdao.detail(depart);
	}
	/*
	@Override
	public int signup(Map<String, Object> map){
		return this.airportdao.signup(map);
	}*/
	@Override
	public int sign_up(MemberDto member){
		return this.airportdao.sign_up(member);
	}

}
