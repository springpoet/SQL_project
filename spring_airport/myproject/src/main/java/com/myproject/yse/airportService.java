package com.myproject.yse;

import java.util.List;
import java.util.Map;

import com.myproject.dto.MemberDto;

public interface airportService {
	
	List<String> nation();
	List<Map<String, Object>> detail(String depart);
	//int signup(Map<String, Object> map);
	int sign_up(MemberDto member);
}	
