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
  
  tr td:nth-child(2):hover {
  background-color: #9cd3f4;
  }

#search-area {
  width: 100%;
  margin-bottom: 50px;
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

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
	    <div class="sub08_title">
	      <ul style="text-align: center; margin-top: 40px;">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">공지사항</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	      </ul>
	    </div> 
	    <div class="entry-content">
	      <table id="noticeList">
	        <thead>
	          <tr higth="20px">
	            <th width="10%">번호</th>
	            <th width="50%">제목</th>
	            <th width="15%">작성자</th>
	            <th width="15%">작성일</th>
	            <th width="10%">조회수</th>
	          </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="n" items="${ list }">
		          <tr>
		            <td class="nno">${ n.boardNo }</td>
		            <td style="text-align: left;">${ n.boardTitle }</td>
		            <td>${ n.boardWriter }</td>
		            <td>${ n.createDate }</td>
		            <td>${ n.count }</td>
		          </tr>
	        	</c:forEach>
	        </tbody>
	      </table>
	    </div>       
	  </div>
	
	<script>
		$(function() {
			$("#noticeList>tbody>tr").click(function() {
				location.href='noticeDetail.st?nno=' + $(this).children(".nno").text();
			})
		})
	</script>

	  <nav style="text-align: center;">
	    <ul class="pagination">
	      <c:choose>
	      	<c:when test="${ pi.currentPage eq 1 }">
	      		<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
       	  	</c:when>
	       	<c:otherwise>
	        	<li class="page-item"><a class="page-link" href="noticeList.st?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	        </c:otherwise>
	      </c:choose>			
           	
          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
          	<li class="page-item"><a class="page-link" href="noticeList.st?cpage=${ p }">${ p }</a></li>
          </c:forEach>
          
          <c:choose>
        	<c:when test="${ pi.currentPage eq pi.maxPage }">
            	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        	</c:when>
        	<c:otherwise>
            	<li class="page-item"><a class="page-link" href="search.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
        	</c:otherwise>
          </c:choose>   
	    </ul>
	  </nav>
	
	
	  <div id="search-area">
	    <form action="search.bo" method="get" align="center">
	    	<input type="hidden" name="cpage" value="1">
	      <select name="condition" id="search-type" style="width: 7%;">
	        <option value="writer">작성자</option>
	        <option value="title">제목</option>
	        <option value="content">내용</option>
	      </select>
	      <div style="width: 25%;">
	        <input type="text" id="search-keyword" name="keyword" style="width: 95%;" value="${ keyword }">
	      </div>
	      <button type="submit" style="width: 6%;">검색</button>
	    </form>
	  </div>
	  
	  <c:if test="${ not empty condition }">
	        <script>
	        	$(function() {
	        		$("#search-area option[value=${condition}]").attr("selected", true);
	        	})
	        </script>
        </c:if>
	  
	  <jsp:include page="common/footer.jsp"/>
  
</body>
</html>