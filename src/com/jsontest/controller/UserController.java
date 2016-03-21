package com.jsontest.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.jsontest.entity.User;
import com.jsontest.service.UserService;

/**
 * 
 * @ClassName: UserController
 * @Description: User的控制器
 * @author linhaibin
 * @date 2015年8月26日 上午10:29:31
 *
 */
@Controller
// @RequestMapping("/user")
public class UserController {
	@Autowired
	@Qualifier("userService")
	UserService userService;

	@RequestMapping("/getUser.do")
	public String getUser(HttpServletRequest req) {
		User user = userService.getUserById(1);
		req.getSession().setAttribute("user", user);
		return "getuser";
	}

	@RequestMapping("/ajaxUser.do")
	@ResponseBody
	public String ajaxUser(HttpServletRequest req) {
		User user = userService.getUserById(1);
		return user.getName();
	}

	@RequestMapping("/ajaxUserEntity.do")
	@ResponseBody
	public User ajaxUserEntity(HttpServletRequest req) {
		User user = userService.getUserById(1);
		return user;
	}

	// 默认是POST吗？还是它会自动判断
	@RequestMapping(value = "/ajaxUserEntityWithParam.do", method = RequestMethod.POST)
	@ResponseBody
	public User ajaxUserEntityWithParam(HttpServletRequest req, User user1, String str, String id) {
		Object object = req.getParameter("user");
		System.out.println("#########id" + id);
		System.out.println("#########" + str);
		User user = userService.getUserById(user1.getId());
		return user;
	}

	@RequestMapping(value = "/ajaxUserEntityWithResponse.do", method = RequestMethod.POST)
	@ResponseBody
	public User ajaxUserEntityWithResponse(HttpServletRequest req, @RequestBody User user1, String name) {
		System.out.println("@@@@@@@" + name);// 这种情况name输出null
		User user = userService.getUserById(user1.getId());
		return user;
	}
	
	@RequestMapping(value = "/ajaxUserListWithResponseList.do", method = RequestMethod.POST)
	@ResponseBody
	public User ajaxUserListWithResponseList(HttpServletRequest req, @RequestBody List<User> users) {
		User user = null;
		if (users.size() != 0)
			user = users.get(0);
		return user;
	}
	@RequestMapping(value = "/ajaxUserEntityWithResponseList.do", method = RequestMethod.POST)
	@ResponseBody
	public User ajaxUserEntityWithResponseList(HttpServletRequest req, @RequestBody User[] userList) {
		User user = null;
		
		System.out.println(userList.length);
		System.out.println(userList.toString());
		System.out.println(userList[0].getName());
		
		List<User> l  = new ArrayList<User>();
		l = Arrays.asList(userList);
		System.out.println(l.get(0).getAge());
		if (l.size() != 0)
			user = userService.getUserById(l.get(0).getId());
		/*System.out.println(userList.size());
		System.out.println(userList.toString());
		System.out.println(userList.get(0));
		System.out.println(userList.get(0).toString());
		System.out.println(userList.get(0).getAge());
		*/
		return user;
	}

	@RequestMapping("/ajaxSaveUser.do")
	@ResponseBody
	public String ajaxSaveUser(HttpServletRequest req) {
		Random r = new Random();
		User user = new User();
		for (int i = 0; i < 10000; i++) {
			user.setAge(r.nextInt(100));
			user.setName("lhb00000" + i);
			userService.saveUser(user);
		}
		return "success";
	}

	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	@ResponseBody
	public User addUser(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {

		// System.out.println(user.get(0).getName());
		// System.out.println(user[0].getName());
		System.out.println(user.getName());
		// String jsonStr = request.getParameter("name");
		// System.out.println(jsonStr);
		// response.getWriter().print("success") ;
		return user;
	}

	@RequestMapping(value = "getJson6", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8", headers = "Accept=application/json")
	@ResponseBody
	public String getJson6(@RequestBody String str) {

		System.out.println("------getJSON6---start----");
		// String str = req.getParameter("str");
		// String age = req.getParameter("age");
		// System.out.println(str);
		// System.out.println(age);
		try {
			String str2 = java.net.URLDecoder.decode(str, "utf-8");
			// System.out.println(str2);
			// NodeInfo node= JSON.parseObject(str2,NodeInfo.class);
			// System.out.println(node.getNodeIP());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(map.get("username")+" "+map.get("password"));
		System.out.println("------getJSON6---end----");
		return "success6666";
	}

	// 接收前台传过来的字符串格式的json对象，在后台进行解析
	@RequestMapping("/resolveJsonObject")
	@ResponseBody
	public void resolveJsonObject(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("########");
		String jsonStr = request.getParameter("orderJson");
		System.out.println(jsonStr);
		// 解码
		String str = URLDecoder.decode(request.getParameter("orderJson"), "UTF-8");
		// 将json格式的字符串转换为json对象，并取得该对象的“userName”属性值
		String o = (String) (JSONObject.fromObject(str).get("userName"));
		System.out.println("jb.fromObject(str).get('userName') is" + o);
		// 这种是fastjson的
		User user = JSON.parseObject(jsonStr, User.class);
		System.out.println(user.getAge());
		System.out.println(user.getName());
	}

	// 传递json数组字符串
	@RequestMapping("/resolveJsonArray")
	public void resolveJsonArray(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String str = request.getParameter("orderJson");
		System.out.println(str);
		com.alibaba.fastjson.JSONObject jsonObject = JSON.parseObject(str);
		System.out.println("jsonObject.get('string') is " + jsonObject.get("string"));
		// 将json格式的字符串转换为json数组对象
		JSONArray array = (JSONArray) (JSONObject.fromObject(str).get("menu"));
		// 取得json数组中的第一个对象
		JSONObject o = (JSONObject) array.get(0);// 获得第一个array结果
		// 取出json数组中第一个对象的“userName”属性值
		String name = o.get("user").toString();// 获得属性值
		System.out.println(name);
		String JsonStr = request.getParameter("orderJson");
		System.out.println(JsonStr);
		// JsonStr的格式是一个map的格式，不List<User>的格式。所以不能直接用JSON.parseArray(JsonStr,User.class);
		/*
		 * List<User> user = JSON.parseArray(JsonStr,User.class); for(User u :
		 * user){ System.out.println(u.getAge()); }
		 */
	}

	// 通过该函数返回json格式的数据，在前台通过JQuery进行解析
	@RequestMapping("/resolveJson")
	public void resolveJson(HttpServletRequest request, HttpServletResponse response) throws IOException {

		List<User> m = new ArrayList<User>();
		net.sf.json.JSONArray jsons = new JSONArray();
		for (int i = 0; i < 3; i++) {
			User user = new User();
			user.setName("name_" + i);
			m.add(user);
		}

		for (int j = 0; j < m.size(); j++) {
			net.sf.json.JSONObject jsonObject = new JSONObject();
			jsonObject.put("user", m.get(j));
			jsons.add(jsonObject);
		}
		response.getWriter().print(jsons.toString());
		// response.getWriter().print(JSON.toJSONString(m)) ;
	}

	@RequestMapping("/objectResolveToFastjson")
	public void objectResolveToFastjson(HttpServletRequest request, HttpServletResponse response) {
		List<User> m = new ArrayList<User>();
		for (int i = 0; i < 3; i++) {
			User user = new User();
			user.setName("name_" + i);
			user.setAge(i);
			m.add(user);
			System.out.println(com.alibaba.fastjson.JSON.toJSONString(user));
		}
		System.out.println(com.alibaba.fastjson.JSON.toJSONString(m));
	}

}
