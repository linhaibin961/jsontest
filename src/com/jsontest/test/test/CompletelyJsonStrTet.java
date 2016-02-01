package com.jsontest.test.test;

import java.util.List;
import com.alibaba.fastjson.JSON;
import com.jsontest.entity.User;

public class CompletelyJsonStrTet {

	public static void main(String[] args) {
		String str = "{stringKey:'this is a String',singleUser:{name:'lhb',age:'23'},"
				+ "userList:[{name:'lhb',age:'23'},{name:'lhp',age:30}] }";
		com.alibaba.fastjson.JSONObject jsonObject = JSON.parseObject(str);
		// 通过key拿到String
		System.out.println("jsonObject.get('stringKey') is " + jsonObject.get("stringKey"));
		System.out.println(jsonObject.get("singleUser"));// 输出{"age":"23","name":"lhb"}
		// 通过key拿到User对象
		User user = jsonObject.getObject("singleUser", User.class);
		System.out.println(user.getName());// 输出 lhb
		// 下面两种都可以拿到json字符串中里面的List<User>
		// List<User> userList = JSON.parseArray(jsonObject.getJSONArray("userList").toString(),User.class);
		List<User> userList = JSON.parseArray(jsonObject.getString("userList"), User.class);
		for (User o : userList) {
			System.out.println(o.getAge());
		}
	}

}
