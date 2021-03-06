package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dgit.domain.MessageVO;
import com.dgit.service.MessageService;

@RestController
@RequestMapping("/message")
public class MessageController {

	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

	@Autowired
	private MessageService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageVO vo) {
		ResponseEntity<String> entity = null;
		logger.info("addMessage");
		logger.info(vo.toString());

		try {
			service.addMessage(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping(value="/{uid}/{mno}", method=RequestMethod.GET)
	public ResponseEntity<MessageVO> get(@PathVariable("uid") String uid, @PathVariable("mno") int mno) {
		ResponseEntity<MessageVO> entity = null;

		try {
			MessageVO message = service.readMessage(uid, mno);
			entity = new ResponseEntity<MessageVO>(message, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<MessageVO>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return entity;

	}

}
