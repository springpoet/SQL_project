package com.myproject.yse;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class airportServiceImpl implements airportService {
	@Autowired
	airportDAO airportdao;
	
	@Override
	public List<String> nation() {
		return this.airportdao.nation();
	}

	@Override
	public List<airportDto> flight(String depart) {
		// TODO Auto-generated method stub
		return this.airportdao.flight(depart);
	}
	
	@Override
	public int sign_up(memberDto member){
		return this.airportdao.sign_up(member);
	}


}
