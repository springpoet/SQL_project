package com.myproject.yse;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myproject.dto.MemberDto;

@Repository
public class airportDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<String> nation() {
		return this.sqlSessionTemplate.selectList("airport.main_select");
	}

		public List<Map<String, Object>> detail(String depart){
			System.out.println(depart);
			return this.sqlSessionTemplate.selectList("airport.detail_view",depart);
		}
		/*
		public int signup(Map<String, Object> map){
		
			
			return this.sqlSessionTemplate.insert("airport.sing_up",map);
		} 
		*/
		
			public int sign_up(MemberDto member){
				
			return this.sqlSessionTemplate.insert("airport.sing_up",member);
		} 
}
