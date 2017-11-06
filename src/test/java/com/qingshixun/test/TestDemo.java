package com.qingshixun.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qingshixun.dao.UserDao;
import com.qingshixun.model.ChartData;
import com.qingshixun.model.User;
import com.qingshixun.service.PageService;
import com.qingshixun.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)//spring 整合 junit4
@ContextConfiguration(locations = "classpath:applicationContext.xml")//知道spring配置文件地址
public class TestDemo {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDao userDao;
	

	
	@Autowired
	private User user;
	

	
	@Test
	public void test1(){
		user.setUserName("张三");
		user.setPassword("1234");
		user.setGender("男");
		user.setEmail("123@sfs.com");
		userService.addUser(user);
	}
	
	@Test
	public void test2(){
		List<User> list=userDao.getUserListByPage(1, 10);
		System.out.println(list);
	}
	
	@Test
	public void test3(){
		System.out.println(userDao.getNumberOfMale());
	}
	
	
	public void test5(int b){
		b=5;
	}
}
