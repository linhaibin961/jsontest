<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>天云星集群管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>
<link rel="stylesheet" href="${ctx }/resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/resource/css/bootstrap-responsive.min.css" />

<script src="${ctx }/resource/js/jquery.min.js"></script>
<script src="${ctx }/resource/js/bootstrap.min.js"></script>
<script src="${ctx }/resource/js/unicorn.js"></script>
<script src="${ctx }/resource/js/jquery.dataTables.min.js"></script>
<script src="${ctx }/resource/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		$("#ajaxUserEntity").click(function(){
			var user = {
					name:'lhb',
					age:12
			};
			var jsonStringRef = JSON.stringify(user);
				$.ajax({
					url:'${ctx }/ajaxUserEntity.do',
					type:"POST",
					data:jsonStringRef,
					contentType: "application/json",
					success:function(data){
						layer.msg(data.age);
					}
				});
			});
		
		$("#ajaxUserListWithResponseList").click(function(){
			var users = [];
			var user1 = {id:1,name:'林海彬',age:12};
			var user2 = {id:2,name:'lhb2',age:13};
			users.push(user1);
			users.push(user2);
			var jsonStringRef = JSON.stringify(users);
				$.ajax({
					url:'${ctx }/ajaxUserListWithResponseList.do',
					type:"POST",//默认是GET，如果是GET就会报错（400），必须是POST
					dataType:"json",
					data:jsonStringRef,
					//contentType是配合@RequestBody使用的，controller层的参数没有@RequestBody就不要使用这个参数
					contentType: "application/json",
					success:function(data){
						console.info(data);
						layer.msg(data.age);
					}
				});
			});
		
		
		$("#ajaxUserEntityWithParam").click(function(){
			var user1 = {
					id:1,
					name:'lhb',
					age:12
			};
			var jsonStringRef = JSON.stringify(user1);
				$.ajax({
					url:'${ctx }/ajaxUserEntityWithParam.do',
					type:"POST",//默认是GET，如果是GET就会报错（400），必须是POST
					data:{
						id:1,
						name:'lhb',
						age:12,
						str:"this is Str",
					},
					//contentType是配合@RequestBody使用的，controller层的参数没有@RequestBody就不要使用这个参数
					//contentType: "application/json",
					success:function(data){
						layer.msg(data.age);
					}
				});
			});
		$("#ajaxUserEntityWithResponse").click(function(){
			var user = {
					id:1,
					name:'lhb',
					age:12
			};
			var jsonStringRef = JSON.stringify(user);
			layer.alert(jsonStringRef);
				$.ajax({
					url:'${ctx }/ajaxUserEntityWithResponse.do',
					type:"POST",//默认是GET，如果是GET就会报错（400），必须是POST
					data:jsonStringRef,
					//没有这个会报Failed to load resource: the server responded with a status of 415 (Unsupported Media Type)
					contentType: "application/json",
					success:function(data){
						layer.msg(data.age);
					}
				});
			});
		
		$("#ajaxUserEntityWithResponseList").click(function(){
			var user1 = {
					id:1,
					name:'lhb',
					age:24
			};
			var user2 = {
					id:2,
					name:'lhp',
					age:31
			}
			var userList = new Array();
			userList.push(user1);
			userList.push(user2);
			var jsonStringRef = JSON.stringify(user1);
			var userListJsonStr = JSON.stringify(userList);
				$.ajax({
					url:'${ctx }/ajaxUserEntityWithResponseList.do',
					type:"POST",//默认是GET，如果是GET就会报错（400），必须是POST
					data:userListJsonStr,
					//没有这个会报Failed to load resource: the server responded with a status of 415 (Unsupported Media Type)
					contentType: "application/json",
					success:function(data){
						layer.msg(data.age);
					}
				});
			});
		
		var obj = {
	            1: "value1",
	            "2": "value2",
	            count: 3,
	            person: [ //数组结构JSON对象，可以嵌套使用
	                        {
	                            id: 1,
	                            name: "张三"
	                        },
	                        {
	                            id: 2,
	                            name: "李四"
	                        }
	                   ],
	            object: { //对象结构JSON对象
	                id: 1,
	                msg: "对象里的对象"    
	            }
	        };
		function ReadJSON() {
			// layer.msg(obj.1); //会报语法错误，可以用alert(obj["1"]);说明数字最好不要做关键字
			// alert(obj.2); //同上

            layer.msg(obj.person[0].name); //或者alert(obj.person[0]["name"])
            alert(obj.object.msg); //或者alert(obj.object["msg"])
        }
		$("#bt4").click(function(){
			ReadJSON();
		});
		
		$("#addUser").click(function (){
        	var userName = $("#userName").attr("value"); 
            var age = $("#age").attr("value"); 
            var jsonStr=[{"name":"lin","age":17},{"name":"lhb","age":23}];
            var jsonobj = {"name":"lin","age":17};
            var userStr =[{"name":"lin","age":"17"}];
            var user = {"name":userName,"age":age}; 
            var aMenu  =JSON.stringify(user);
        	$.ajax({ 
                //解析从后台返回的json数据 
                url:"${ctx }/addUser.do" , 
                type:"post",
                //ContentType:"application/json",
                dataType:"json",
                /* data:{
                	"name":userName,
                	"age":age,
                }, */
                /* data:JSON.stringify(jsonStr), */
                /* data:$.parseJSON(jsonStr), */
                data: jsonobj,
                success:function(data){ 
                	alert(data);
                } 
            });
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      //传递字符串格式json对象到后台（一个json对象） 
    	$("#resolveJsonObject").click(function(){ 
    	    var userName =$("#userName").attr("value"); 
    	    var age = $("#age").attr("value"); 
    	       
    	    var user = {user:userName,age:age}; 
    	  //encodeURI解决中文乱码，但是只要把type设置为POST就不用再转换了
    	  //var aMenu  = encodeURI(JSON.stringify(user)); 
    	    var aMenu  = JSON.stringify(user); 

    	    $.ajax({ 
    	         url:"${ctx }/resolveJsonObject.do" , 
    	         type:"POST",
    	         data:"orderJson=" + aMenu,  
    	         success:function(data){ 
    	               
    	        } 
    	    }); 
    	}); 
    	   
    	//传递json数组到后台 
    	$("#resolveJsonArray").click(function(){ 
    	    var userName =$("#userName").attr("value"); 
    	    var age = $("#age").attr("value"); 
    	       
    	    //数组开始 
    	    var user1 = {user:userName,age:age};
    	    var user2 = {user:"lhp",age:30}; 
    	    var allMenu={ 
    	        "menu":[ ],
    	        "string":"this is String",
    	        }; 
    	    allMenu.menu.push(user1); 
    	    allMenu.menu.push(user1);
    	    var allMenu_json = JSON.stringify(allMenu); 
    	       
    	    $.ajax({ 
    	        //json数组 
    	        type:"POST",
    	        url:"${ctx }/resolveJsonArray.do" , 
    	        data:"orderJson=" + allMenu_json,  
    	        success:function(data){ 
    	               
    	        } 
    	    }); 
    	}); 
    	   
    	//接收后台的json在前台解析 
    	$("#resolveJson").click(function(){ 
    	       
    	    $.ajax({ 
    	        //解析从后台返回的json数据 
    	        url:"${ctx }/resolveJson.do" , 
    	        type:"post",         
    	        success:function(data){ 
    	        	alert(data);
    	            var arr=eval(data); 
    	            alert(arr.length); 
    	            alert(arr);
    	            for(var m = 0;m<arr.length;m++){ 
    	                alert(arr[m].user.name); 
    	                //下面是使用JSON.toJsonString()方法之后使用的
    	                //alert(arr[m].name);
    	            } 
    	        } 
    	    }); 
    	});
	});
</script>
<script type="text/javascript">
$(function(){
	
	
});
</script>
</head>
<body>
	<div>
		<button id="ajaxUserEntity">ajaxUserEntity</button>
		<button id="ajaxUserEntityWithParam">ajaxUserEntityWithParam</button>
		<button id="ajaxUserListWithResponseList">ajaxUserListWithResponseList</button>
		<button id="ajaxUserEntityWithResponse">ajaxUserEntityWithResponse</button>
		<button id="ajaxUserEntityWithResponseList">ajaxUserEntityWithResponseList</button>
		<button id="bt4">bt4</button>
	</div>
	<div>
		姓名：<input id="userName" type="text" name="userName"> 
    年龄:<input id="age" type="text" name="age"><br> 
    <input type="button" id="addUser" value="add对象"> 
    <input type="button" id="resolveJsonObject" value="resolveJsonObject"> 
    <input type="button" id="resolveJsonArray" value="resolveJsonArray"> 
    <input type="button" id="resolveJson" value="resolveJson前端解析json字符串"> 
	</div>

</body>
</html>
