package com.myproject.yse;

import java.util.List;

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

}
