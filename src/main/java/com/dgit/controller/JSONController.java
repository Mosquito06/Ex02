package com.dgit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.SampleVO;

@RestController // 
@RequestMapping("/json/*")
public class JSONController {
	private static final Logger logger = LoggerFactory.getLogger(JSONController.class);
	
	@RequestMapping("hello")
	public @ResponseBody String sayHello(){
		return "hello";
	}
	
	@RequestMapping("map")
	public @ResponseBody HashMap<String, String> testMap(){
		HashMap<String, String> map = new HashMap<>();
		map.put("key1", "값1");
		map.put("key2", "값2");
		map.put("key3", "값3");
		
		return map;
	}
	
	@RequestMapping("sendVO")
	public @ResponseBody SampleVO sendVO(){
		SampleVO sample = new SampleVO();
		sample.setMno(1);
		sample.setFirstName("DongHwan");
		sample.setLastName("KIM");
		
		return sample;
	}
	
	@RequestMapping("sendList")
	public @ResponseBody List<SampleVO> sendList(){
		List<SampleVO> list = new ArrayList<>();
		
		for(int i = 0; i < 10; i++){
			SampleVO sample = new SampleVO();
			sample.setMno(1);
			sample.setFirstName("DongHwan");
			sample.setLastName("KIM");
			list.add(sample);
		}		
		
		return list;
	}
	
	
}
