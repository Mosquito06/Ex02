package com.dgit.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.ReplyVO;
import com.dgit.persistence.ReplyDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDaoTest {
	
	@Autowired
	ReplyDao dao;

	// @Test
	public void insertTest() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setBno(378);
		vo.setReplytext("댓글 또 작성해봄");
		vo.setReplyer("배재진");
		
		dao.create(vo);
		
	}
	
	// @Test
	public void listTest() throws Exception{
		dao.list(378);
	}
	
	// @Test
	public void upDateTest() throws Exception{
		ReplyVO vo = new ReplyVO();
		vo.setRno(1);
		vo.setReplytext("댓글 수정해봄");
		dao.update(vo);
	}
		
	@Test
	public void deleteTest() throws Exception{
		dao.delete(2);
	}
}
