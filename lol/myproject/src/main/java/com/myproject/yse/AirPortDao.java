package com.myproject.yse;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.xdevapi.Session;

@Repository
public class AirPortDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	SqlSession sqlsession;
	public List<String> countryDetail() {
		
		return this.sqlSessionTemplate.selectList("airport.main_select");
	}
}
