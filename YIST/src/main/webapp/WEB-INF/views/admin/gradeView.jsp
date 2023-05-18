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
	   	<div class='updateGradeForm' style='display:none;'>
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
   					let thead = "<tr> + <th scope='col' width='100px'>석차</th> + <th scope='col' width='300px'>아이디</th> + <th scope='col' width='200px'>점수</th> + <th width='200px'></th> + </tr>"
   					
   					$("table thead").html(thead)
   					
					let j = 1;
   					for(let i in result) {
   						value += "<tr>"
   								+ "<td>" + j + "</td>"
   								+ "<td>" + result[i].id + "</td>"
   								+ "<td>" + result[i].score + "</td>"
   								+ "<td>" + "<button type='button' class='btn btn-sm btn-danger' onclick='updateGrade();'>성적수정</button>"
   								+ "</tr>";
   								
   						form += "<table class='table' border=1>"
   								+ "<thead>"
   								+ "<tr><th colspan='2'>" + result[i].id + "학생 점수</th></tr></thead>"
   								+ "<tr><td> <p>현 점수:</p></td><td>" + result[i].score + "</td></tr>"
   								+ "<tr><td> <p>수정 점수:</p></td><td> <input type='text'> </td></tr>"
								+ "<tr align='center'><td><button type='submit' class='btn btn-sm btn-success'>수정하기</button></td>	<td><button type='button' class='btn btn-sm btn-danger'>닫기</button></td></tr>"
								+ "</table></div>";
   						   		
   							j++;	
						$("#gradeTableWrapper tbody").html(value);
						$(".updateGradeForm").html(form);
						
						
   					}
   				},
   				error:function(){
   					console.log("성적조회 ajax 통신 실패");
   				}
   			})
   		})
   		
   		function updateGrade(e){
   			$(".updateGradeForm").removeAttr("style", "display").attr("style","width:30%; height:35%; padding:10px;");
   			
   			
   		}
   </script>  
               

</body>
</html>