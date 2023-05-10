<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
    border-collapse: collapse;
    width: 100%;
    margin: 13px 0 37px 0;
    text-align: center;
  }
  
  caption {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
  }
  
  th,
  td {
    height: 50px;
    padding: 10px;
    text-align: center;
    border: 1px solid #dae0e9;
  }

  th {
    background-color: #eee;
    font-weight: bold;
  }
  
  tr td:nth-child(3):hover {
  background-color: #9cd3f4;
  }

#search-area {
  width: 100%;
  margin-bottom: 30px;
}

form {
  display: flex;
  justify-content: center;
}

select, input{
  text-align: center;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  background-color: #9cd3f4;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.active {
	background-color: red;
}

</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">우리반 게시판</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
      <div data-example-id="simple-button-group" class="bs-example" style="text-align: center; padding: 15px;">
        <div aria-label="Basic example" role="group" class="btn-group">
		  <button class="btn btn-default" type="button" id="materials" onclick="showMaterials()" style="background-color: #c1e5fb">학습자료</button>
		  <button class="btn btn-default" type="button" id="task" onclick="showTask()">과제</button>
		  <button class="btn btn-default" type="button" id="qna" onclick="showQnA()">Q & A</button>
		</div>
      </div>
    </div> 
    <div class="entry-content">
      <table id="result">
        <thead>
          <tr higth="20px">
            <th width="5%">번호</th>
            <th width="15%">카테고리</th>
            <th width="50%">제목</th>
            <th width="10%">작성자</th>
            <th width="10%">작성일</th>
            <th width="10%">조회수</th>
          </tr>
        </thead>
        <tbody>
        	<c:forEach var="m" items="${ list }">
        	  <tr>
	            <td>${ m.boardNo }</td>
	            <td>학습자료</td>
	            <td style="text-align: left;">${ m.boardTitle }</td>
	            <td>${ m.boardWriter }</td>
	            <td>${ m.createDate }</td>
	            <td>${ m.count }</td>
	          </tr>
        	</c:forEach>
        </tbody>
      </table>
      <div style="text-align: right;">
        <a href="#" class="btn btn-gray btn-theme-colored btn-circled">글쓰기</a>
      </div> 
    </div>       
  </div>

	<script>
	// 학습자료
	 function showMaterials() {
	  
	  $.ajax({
		  url: "MaterialList.st",
		  type: "POST",
		  success: function(list) {
			  $("#materials").css("background", "#c1e5fb");
			  $("#task").css("background", "white");
			  $("#qna").css("background", "white");
			  
			  var html = "";
			  var value = "";
			  
			  value += "<tr higth='20px'>";
			  value += "<th width='5%'>번호</th>";
			  value += "<th width='15%'>카테고리</th>";
			  value += "<th width='45%'>제목</th>";
			  value += "<th width='15%'>작성자</th>";
			  value += "<th width='10%'>작성일</th>";
			  value += "<th width='10%'>조회수</th>";
			  value += "</tr>";
			  
			  $("#result thead").html(value);
			  
			  if (list.length == 0) {
				html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
			} else {
				for ( var i in list) {
					html += "<tr>";
					html += "<td>" + list[i].boardNo + "</td>";
					html += "<td>학습자료</td>";
					html += "<td>" + list[i].boardTitle + "</td>";
					html += "<td>" + list[i].boardWriter + "</td>";
					html += "<td>" + list[i].createDate + "</td>";
					html += "<td>" + list[i].count + "</td>";
					html += "</tr>";
				}
				$("#result tbody").html(html);
			}
		  },
		  error : function(jqXHR, textStatus, errorThrown) {
              	  console.log("Error: " + textStatus + " " + errorThrown);
		  }
	  });
	 }
	 
	// 과제
	 function showTask() {
		
		$.ajax({
		  url: "taskList.st",
		  type: "POST",
		  success: function(list) {
			  $("#task").css("background", "#c1e5fb");
			  $("#materials").css("background", "white");
			  $("#qna").css("background", "white");
			  
			  var html = "";
			  var value = "";
			  
			  value += "<tr higth='20px'>";
			  value += "<th width='5%'>번호</th>";
			  value += "<th width='15%'>카테고리</th>";
			  value += "<th width='30%'>제목</th>";
			  value += "<th width='15%'>작성자</th>";
			  value += "<th width='25%'>기간</th>";
			  value += "<th width='10%'>상태</th>";
			  value += "</tr>";
			  
			  $("#result thead").html(value);

			  if (list.length == 0) {
				html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
				
			} else {
				
				// 마감 계산
				let today = new Date();
				
				for (var i in list) {
				    
					let endDate = new Date(list[i].endDate);
				  
				    html += "<tr>";
				    html += "<td>" + list[i].taskNo + "</td>";
				    html += "<td>과제</td>";
				    html += "<td><a href='taskDetail.st?taskNo=" + list[i].taskNo + "&studentId=" + list[i].studentId + "'>" + list[i].taskTitle + "</a></td>";
				    html += "<td>" + list[i].id + "</td>";
				    html += "<td>" + list[i].startDate + "~" + list[i].endDate + "</td>";
				    
				    if (today.getTime() > endDate.getTime()){
		            	html += "<td style='color: red;'>마감</td>";	
		            } else {
		            	html += "<td style='color: blue;'>진행중</td>";
		            }
				    html += "</tr>";
					
				    
				    if (list[i].submitContent != null) {
				        if (list[i].studentId == "${loginUser.id}") {
				            html += "<tr>";
				            html += "<td></td>";
				            html += "<td></td>";
				            html += "<td><a href='taskReplyDetail.st?taskNo=" + list[i].taskNo + "&studentId=" + list[i].studentId + "'>re: " + list[i].taskTitle + "</a></td>";                        
				            html += "<td>" + list[i].studentId + "</td>";
				            html += "<td>" + list[i].submitDate + "</td>";
				            
				            if (today.getTime() > endDate.getTime()){
				            	html += "<td style='color: red;'>마감</td>";	
				            } else {
				            	html += "<td>제출완료</td>";
				            }
				            
				            html += "</tr>";
				        }
				    }
				}



				$("#result tbody").html(html);
				
			}
		  },
		  error : function(jqXHR, textStatus, errorThrown) {
              	  console.log("Error: " + textStatus + " " + errorThrown);
		  }
	  });
	 }	
	 
	// Q&A
	 function showQnA() {
		
		 $.ajax({
			  url: "qnaList.st",
			  type: "POST",
			  success: function(list) {
				  
				  $("#qna").css("background", "#c1e5fb");
				  $("#materials").css("background", "white");
				  $("#task").css("background", "white");
					
				  var html = "";
				  var value = "";
				  
				  value += "<tr higth='20px'>";
				  value += "<th width='5%'>번호</th>";
				  value += "<th width='15%'>카테고리</th>";
				  value += "<th width='45%'>제목</th>";
				  value += "<th width='15%'>작성자</th>";
				  value += "<th width='10%'>작성일</th>";
				  value += "<th width='10%'>조회수</th>";
				  value += "</tr>";
				  
				  $("#result thead").html(value);
				  
				  if (list.length == 0) {
					html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
				} else {
					for ( var i in list) {
						html += "<tr>";
						html += "<td>" + list[i].boardNo + "</td>";
						html += "<td>Q&A</td>";
						html += "<td>" + list[i].boardTitle + "</td>";
						html += "<td>" + list[i].boardWriter + "</td>";
						html += "<td>" + list[i].createDate + "</td>";
						html += "<td>" + list[i].count + "</td>";
						html += "</tr>";
					}
					$("#result tbody").html(html);
				}
			  },
			  error : function(jqXHR, textStatus, errorThrown) {
	              	  console.log("Error: " + textStatus + " " + errorThrown);
			  }
		  });
	 }
	</script>
	
  <nav style="text-align: center;">
	    <ul class="pagination">
	      <c:choose>
	      	<c:when test="${ pi.currentPage eq 1 }">
	      		<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
       	  	</c:when>
	       	<c:otherwise>
	        	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	        </c:otherwise>
	      </c:choose>			
           	
          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
          	<li class="page-item"><a class="page-link" href="boardList.st?cpage=${ p }">${ p }</a></li>
          </c:forEach>
          
          <c:choose>
        	<c:when test="${ pi.currentPage eq pi.maxPage }">
            	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        	</c:when>
        	<c:otherwise>
            	<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
        	</c:otherwise>
          </c:choose>   
	    </ul>
	  </nav>
	
	
	  <div id="search-area">
	    <form action="" method="get" align="center">
	      <select name="search-type" id="search-type" style="width: 7%;">
	        <option value="writer">작성자</option>
	        <option value="title">제목</option>
	      </select>
	      <div style="width: 25%;">
	        <input type="text" id="search-keyword" name="keyword" style="width: 95%;">
	      </div>
	      <button type="submit" style="width: 6%;">검색</button>
	    </form>
	  </div>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>