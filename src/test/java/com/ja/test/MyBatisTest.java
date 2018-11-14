package com.ja.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MyBatisTest {
	@Inject 
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory(){
		System.out.print("testFactory() >> ");
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSession()throws Exception{
		try(SqlSession session = sqlFactory.openSession()){
			System.out.print("testSession() >> ");
			System.out.println(session);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
