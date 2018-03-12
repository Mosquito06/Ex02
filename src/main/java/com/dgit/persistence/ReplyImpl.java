package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.ReplyVO;

@Repository
public class ReplyImpl implements ReplyDao {
	private static final String NAMESPACE = "com.dgit.persistence.ReplyDao";
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);

	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);

	}

	@Override
	public void delete(int rno) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", rno);

	}

}
