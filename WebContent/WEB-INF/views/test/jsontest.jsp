<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${ctx }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsontest</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/resource/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx }/resource/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx }/resource/css/uniform.css" />
<link rel="stylesheet" href="${ctx }/resource/css/select2.css" />
<link rel="stylesheet" href="${ctx }/resource/css/fullcalendar.css" />
<link rel="stylesheet" href="${ctx }/resource/css/unicorn.main.css" />
<link rel="stylesheet" href="${ctx }/resource/css/unicorn.grey.css" class="skin-color" />
<script src="${ctx }/resource/js/jquery.min.js"></script>
<script src="${ctx }/resource/js/excanvas.min.js"></script> 
<script src="${ctx }/resource/js/jquery.ui.custom.js"></script>
<script src="${ctx }/resource/js/bootstrap.min.js"></script>
<script src="${ctx }/resource/js/unicorn.tables.js"></script> 
<script src="${ctx }/resource/js/jquery.uniform.js"></script>
<script src="${ctx }/resource/js/unicorn.js"></script>
<script src="${ctx }/resource/js/select2.min.js"></script> 
<script src="${ctx }/resource/js/jquery.dataTables.min.js"></script>
<script src="${ctx }/resource/js/jquery.flot.min.js"></script>
<script src="${ctx }/resource/js/jquery.flot.resize.min.js"></script>
<script src="${ctx }/resource/js/jquery.peity.min.js"></script> 
<script src="${ctx }/resource/js/fullcalendar.min.js"></script> 
<script src="${ctx }/resource/js/json2.js"></script> 
<script type="text/javascript">
$(function(){
	var data;
	var json='[{"CityId":18,"CityName":"西安","ProvinceId":27,"CityOrder":1},{"CityId":14,"CityName":"西1安","ProvinceId":27,"CityOrder":2},{"CityId":53,"CityName":"广州","ProvinceId":27,"CityOrder":1}]';
	eval("data="+json); 
	alert(data);

  	$("#startservice").click(function() {
		var nodejson='[{"nodeInfoId":"1","nodeIP":"192.168.0.141","nodePort":"2001","nodeRole":"scsdbdn","statement":"1"}]';
  		var nodeInfo1={"nodeInfoId":"1","nodeIP":"192.168.0.141","nodePort":"2001","nodeRole":"scsdbdn","statement":"1"};
  		var nodeInfo2={"node号InfoId":"2","nodeIP":"192.168.0.142","nodePort":"2002","nodeRole":"scsdbdn","statement":"1"};
  		var nodeInfo3='[{"nodeInfoId":"3","nodeIP":"192.168.0.143","nodePort":"2003","nodeRole":"scsdbdn","statement":"1"},{"nodeInfoId":"4","nodeIP":"192.168.0.144","nodePort":"2004","nodeRole":"scsdbdn","statement":"1"}]';
  		var nodeInfo4=[{"nodeInfoId":"2","nodeIP":"192.168.0.142","nodePort":"2002","nodeRole":"scsdbdn","statement":"1"}];
  		var nodelist=[];
  		/* nodelist[0]=nodeInfo1;
  		nodelist[1]= nodeInfo2; */
  		nodelist.push(nodeInfo1);
  		nodelist.push(nodeInfo2);
  		alert(nodelist[0].nodeInfoId);
  		 $.ajax({  
             type: "POST",  
             dataType:"json", 
             ContentType:"application/json",
             data:{nodeInfoList:JSON.stringify(nodelist)},
             /* {
 				"str":"lhb",
 				"age":"23",
 				"" */
 				/* "list":JSON.stringify(arr) */
             url: "${ctx }/getJson6.do",
             success:function(data){
           	  var strHTML= "###";
           	  alert(strHTML+data);
             }
         }); 
  		 
  		 $.ajax({  
             type: "POST",  
             /* dataType:"json", */
             /* ContentType:"application/json",   */
             data:{"str":JSON.stringify(nodelist)},
            	 /* $.parseJSON(nodeInfo3), *//* {
 				"str":"lhb",
 				"age":"23",
 				"" */
 				/* "list":JSON.stringify(arr) */
             url: "${ctx }/getJson5.do",
             success:function(data){
           	  var strHTML= "###";
           	  alert(strHTML+data);
             }
         });
  	});
  	})
</script>
</head>
<body>
<button id="startservice">sf</button>
<form action="${ctx }/getJson5.do" method="post">
nodeInfoId:<input type="text" name="nodeInfoId"><br>
nodeIP:<input type="text" name="nodeIP"><br>
nodePort:<input type="text" name="nodePort"><br>
nodeRole:<input type="text" name="nodeRole"><br>
statement:<input type="text" name="statement"><br>
<input type="submit" value="tijiao">
</form>
</body>
</html>