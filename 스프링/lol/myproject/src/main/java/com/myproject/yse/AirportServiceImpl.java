package com.myproject.yse;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service

public class AirportServiceImpl implements AirportService{
	
	@Autowired
	AirPortDao airportdao;

	@Override
	public List<String> country() {
		return this.airportdao.countryDetail();
	}
}
