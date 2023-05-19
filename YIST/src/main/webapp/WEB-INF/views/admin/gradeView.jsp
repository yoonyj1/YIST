<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
   <jsp:include page="common/header.jsp" />

   <div class="card card-default page" style="height:100%">
      <div class="card-header">
         <h2>성적관리</h2>
      </div>
    

      <div align="center">
    	<ul>
			<li style="display:inline">
				<select id="selectSubject" class="form-select" style="width:50%; height:30%; text-align:center">
			   		<option value="null" selected disabled>== 학급선택 ==</option>
			   		<c:forEach var="s" items="${ sList }">
			   			<option value="${ s.subjectNo }">${ s.subjectName }</option>
			   		</c:forEach>
			   	</select>
			</li>
			<br>
			<li style="display:inline; margin-left:5px;">
				<button type="button" id="showGrade" class="btn btn-sm btn-success">조회</button>
			</li>    	
    	</ul>
	   	<div id="gradeTableWrapper">
	   	<br>
	   		<table id="gradeTable" class='table' style='display:none;'>
	   			<thead>
		   			
				</thead>
				<tbody></tbody>
	   		</table>
	   		<br>
	   	</div>
   	</div>
   </div>
   
    <script>
   
   		$("#showGrade").click(function(){
   			$(".updateGradeForm").attr("style", "display:none");
   			$.ajax({
   				url:"gradeShow.do",
   				data:{
   					subjectName:$("select").val(),
   				},
   				success:function(result){
   					console.log(result);
   					$("#gradeTable").removeAttr("style", "display").attr("style","text-align:center").attr("style", "width:50%");
   					
   					let value = "";
   					let form = "";
   					let thead = "<tr> + <th scope='col' width='100px'>석차</th> + <th scope='col' width='300px'>아이디</th> + <th scope='col' width='200px'>점수</th> + </tr>"
   					
   					$("table thead").html(thead)
   					
					let j = 1;
   					for(let i in result) {
   						value += "<tr>"
   								+ "<td>" + j + "</td>"
   								+ "<td>" + result[i].id + "</td>"
   								+ "<td class='score'>" + result[i].score + "</td>"
   								+ "</tr>";
   								
   						   		
   							j++;	
						$("#gradeTableWrapper tbody").html(value);
						
				   		
						
   					}
   				},
   				error:function(){
   					console.log("성적조회 ajax 통신 실패");
   				}
   			})
   		})
   		
   		
   </script>  
               

</body>
</html>