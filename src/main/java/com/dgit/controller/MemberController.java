package com.dgit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MemberVO;
import com.dgit.service.MemberService;

@RestController
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<MemberVO>> list() {
		ResponseEntity<List<MemberVO>> entity = null;

		try {
			List<MemberVO> list = service.list();
			entity = new ResponseEntity<List<MemberVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MemberVO>>(HttpStatus.OK);
		}

		return entity;
	}

	@RequestMapping(value = "{userid}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("userid") String userid) {
		ResponseEntity<String> entity = null;

		try {
			MemberVO member = new MemberVO();
			member.setUserid(userid);
			service.delete(member);
			
			entity = new ResponseEntity<String>("success delete", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail delete", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody MemberVO member) {
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO member1 = new MemberVO();
			member1.setUserid(member.getUserid());
			member1.setEmail(member.getEmail());
			member1.setUserpw(member.getUserpw());
			member1.setUsername(member.getUsername());
			
			
			service.insert(member1);
			
			entity = new ResponseEntity<String>("success insert", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail insert", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="{userid}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("userid") String userid, @RequestBody MemberVO member) {
		ResponseEntity<String> entity = null;
		
		try {
			member.setUserid(userid);
			service.update(member);
			
			entity = new ResponseEntity<String>("success update", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail update", HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}

}
