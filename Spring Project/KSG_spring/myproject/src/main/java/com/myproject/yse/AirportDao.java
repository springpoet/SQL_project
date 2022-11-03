package com.myproject.yse;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class airportDAO {
	
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	
	public List<String> nation() {
		return this.sqlSessionTemplate.selectList("airport.main_select");
	}

	public List<airportDto> flight(String depart){
		
		return this.sqlSessionTemplate.selectList("airport.main_detail", depart);
	}
	
	public int sign_up(memberDto member){
		
	return this.sqlSessionTemplate.insert("airport.sign_up",member);
} 
}
