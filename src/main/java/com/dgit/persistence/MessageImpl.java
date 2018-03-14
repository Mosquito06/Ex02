package com.dgit.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.MessageVO;

@Repository
public class MessageImpl implements MessageDao {
	private static final String NAMESPACE = "com.dgit.persistence.MessageDao";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void create(MessageVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", vo);

	}

	@Override
	public MessageVO readMessage(int mno) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".readMessage", mno);
	}

	@Override
	public void updateState(int mno) throws Exception {
		sqlSession.update(NAMESPACE + ".updateState", mno);

	}

}
