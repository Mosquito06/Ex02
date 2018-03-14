package com.dgit.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MessageVO;
import com.dgit.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MessageServiceTest {
	
	@Autowired
	private MessageService service;
	
	//@Test
	public void addMessageTest() throws Exception{
		MessageVO vo = new MessageVO();
		vo.setSender("user03");
		vo.setTargetid("user02");
		vo.setMessage("토르 라그나로크!!!");
				
		service.addMessage(vo);
		
	}
	
	@Test
	public void readMessageTest() throws Exception{
		MessageVO vo = service.readMessage("user02", 7);
		System.out.println(vo.toString());
	}
	
}
