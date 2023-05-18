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
    border: 1px solid #c4c4c4;
  }

  th {
    background-color: #eee;
    font-weight: bold;
    font-size: 18px;
  }
  
  td {
    font-size: 15px;
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
      <ul style="text-align: center; margin: 40px;">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">학습자료</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    <div class="entry-content">
      <table id="contentArea" align="center" class="table" style="margin-top: 10px;">
        <tr>
            <th style="text-align: center;">제목</th>
            <td colspan="3" style="text-align: left;">${ m.boardTitle }</td>
        </tr>
        <tr>
            <th width="10%" style="text-align: center;">작성자</th>
            <td width="40%" style="text-align: left;">${ m.boardWriter }</td>
            <th width="10%" style="text-align: center;">작성일</th>
            <td width="40%" style="text-align: left;">${ m.createDate }</td>
        </tr>
        <tr>
            <td colspan="4">
              <div style="padding: 50px; font-size: 18px; line-height: 2;">
                <p style="height:auto">${ m.boardContent }</p>
                <c:if test="${m.changeName != null}">  
                	<img src="resources/materialUploadFiles/${m.changeName}" alt="첨부이미지"/>
                	<a href="<c:url value="/fileDown.do?fileDir=resources/materialUploadFiles/${m.changeName}&fileName=${m.changeName}"/>">${m.changeName} 다운로드</a>
               
               </c:if> 
              </div>
            </td>
        </tr>
    </table>
    
     <div style="text-align: center; margin: 50px;">
      <a href="boardList.st" class="btn btn-gray btn-theme-colored btn-circled"><i class="fa fa-home"></i> 목록으로</a>
    </div> 
    </div>       
  </div>

	<jsp:include page="common/footer.jsp"/>
</body>
</html>