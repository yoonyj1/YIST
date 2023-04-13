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

</style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	  <div class="container">
	    <div class="sub08_title">
	      <ul style="text-align: center; margin-top: 40px;">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">내 과제</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	      </ul>
	    </div> 
	    <div style="text-align: right;">
	      <button type="button" class="btn btn-gray btn-theme-colored btn-circled">삭제하기</button>
	    </div> 
	    <div class="entry-content">
	      <table>
	        <thead>
	          <tr higth="20px">
	            <th width="5%"></th>
	            <th width="50%">제목</th>
	            <th width="10%">작성일</th>
	            <th width="10%">조회수</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	          <tr>
	            <td><input type="checkbox"></td>
	            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
	            <td>2023-03-27</td>
	            <td>8</td>
	          </tr>
	        </tbody>
	      </table>
	    </div>       
	  </div>
	
	  <nav style="text-align: center; margin: 40px;">
	    <ul class="pagination">
	      <li>
	        <a href="#" aria-label="Previous">
	          <span aria-hidden="true">&laquo;</span>
	        </a>
	      </li>
	      <li><a href="#">1</a></li>
	      <li><a href="#">2</a></li>
	      <li><a href="#">3</a></li>
	      <li><a href="#">4</a></li>
	      <li><a href="#">5</a></li>
	      <li>
	        <a href="#" aria-label="Next">
	          <span aria-hidden="true">&raquo;</span>
	        </a>
	      </li>
	    </ul>
	  </nav>
	  
	<jsp:include page="../common/footer.jsp"/>	  

</body>
</html>