package com.myproject.yse;

import java.util.List;
import java.util.Map;

import com.myproject.dto.MemberDto;

public interface airportService {
	
	List<String> nation();
	List<Map<String, Object>> detail(String depart, String arrive);
	//int signup(Map<String, Object> map);
	int sign_up(MemberDto member);
	String login(String id, String pw);
	MemberDto loginInfor(String id);
}	
