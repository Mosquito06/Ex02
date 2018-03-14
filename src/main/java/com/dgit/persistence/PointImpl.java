package com.dgit.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PointImpl implements PointDao {
	private static final String NAMESPACE = "com.dgit.persistence.PointDao";
	
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void updatePoint(String uid, int point) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("uid", uid);
		map.put("point", point);
				
		sqlSession.update(NAMESPACE + ".updatePoint", map);

	}

}
