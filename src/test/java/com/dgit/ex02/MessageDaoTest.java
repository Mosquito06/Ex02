package com.dgit.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MessageVO;
import com.dgit.persistence.MessageDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MessageDaoTest {

	@Autowired
	private MessageDao dao;
	
	@Test
	public void readMessageTest() throws Exception{
		MessageVO vo = dao.readMessage(1);
		System.out.println(vo.toString());
	}
	
}
