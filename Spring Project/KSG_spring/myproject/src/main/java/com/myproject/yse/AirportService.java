package com.myproject.yse;

import java.util.List;


public interface airportService {
	
	List<String> nation();

	List<airportDto> flight(String depart);

	int sign_up(memberDto member);
}
