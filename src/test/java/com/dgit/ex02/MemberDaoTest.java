package com.dgit.ex02;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.MemberVO;
import com.dgit.domain.ReplyVO;
import com.dgit.persistence.MemberDao;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDaoTest {
	
	@Autowired
	MemberDao dao;

	//@Test
	public void insertTest() throws Exception{
		MemberVO member = new MemberVO();
		member.setUserid("skykim10908");
		member.setUsername("김동환");
		member.setUserpw("1234");
		member.setEmail("김동환 닷 컴");
		
		dao.insert(member);
		
	}
	
	//@Test
	public void listTest() throws Exception{
		dao.list();
	}
	
	//@Test
	public void upDateTest() throws Exception{
		MemberVO member = new MemberVO();
		member.setUserid("skykim10908");
		member.setUsername("최일영");
		member.setUserpw("1234");
		member.setEmail("최일영 닷 컴");
		
		dao.update(member);
	}
		
	@Test
	public void deleteTest() throws Exception{
		MemberVO member = new MemberVO();
		member.setUserid("skykim10908");
		
		dao.delete(member);
	}
}
