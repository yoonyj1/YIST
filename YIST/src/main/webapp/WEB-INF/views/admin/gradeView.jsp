<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
   <jsp:include page="common/header.jsp" />

   <div class="card card-default page">
      <div class="card-header">
         <h2>성적관리</h2>
      </div>
    
    <div align="center">
    	<ul>
			<li style="display:inline">
				<select id="selectSubject" style="width:50%; height:30%; text-align:center">
			   		<option value="null" selected disabled>== 학급선택 ==</option>
			   		<option value="1">자바프로그래밍1반</option>
			   		<option value="2">자바프로그래밍2반</option>
			   		<option value="3">파이썬1반</option>
			   		<option value="4">파이썬2반</option>
			   		<option value="5">C언어1반</option>
			   		<option value="6">C언어2반</option>
			   	</select>
			</li>
			<li style="display:inline; margin-left:5px;">
				<button type="button" class="btn btn-sm btn-success">조회</button>
			</li>    	
    	</ul>
	   	<div id="gradeTableWrapper">
	   	
	   	</div>
   	</div>
   </div>
   <script>
   		$(function(){
   			$.ajax({
   				url:"gradeView.do",
   				data:{
   					
   				},
   			})
   		})
   </script>      

</body>
</html>