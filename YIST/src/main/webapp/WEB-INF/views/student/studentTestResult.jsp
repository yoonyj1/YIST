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
  
  textarea {
    margin: 10px;
  }
</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <form action="">
    <table style="margin-top: 40px;">
        <caption>수강생 평가</caption>
        <thead >
            <tr>
                <th style="text-align: left; border: none;">프로그래밍 언어 활용</th>
                <th style="text-align: right; border: none; color: #2a4d93;">총점 : ${ea.score}.00</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td width="15%">문제1</td>
                <td width="85%" style="text-align: left;"><img src="${q.q1}"></td>
            </tr>
            <tr>
                <td>학생 답</td>
                <td style="text-align: left;">${ea.a1}</td>
            </tr>
            <tr>
                <td>모법 답안</td>
                <td style="text-align: left; color:blue">${q.a1}</td>
            </tr>
            
            <tr>
                <td width="15%">문제2</td>
                <td width="85%" style="text-align: left;"><img src="${q.q2}"></td>
            </tr>
            <tr>
                <td>학생 답</td>
                <td style="text-align: left;">${ea.a2}</td>
            </tr>
            <tr>
                <td>모법 답안</td>
                <td style="text-align: left; color:blue">${q.a2}</td>
            </tr>
            
            <tr>
                <td width="15%">문제3</td>
                <td width="85%" style="text-align: left;"><img src="${q.q3}"></td>
            </tr>
            <tr>
                <td>학생 답</td>
                <td style="text-align: left;">${ea.a3}</td>
            </tr>
            <tr>
                <td>모법 답안</td>
                <td style="text-align: left; color:blue">${q.a3}</td>
            </tr>
            
            <tr>
                <td width="15%">문제4</td>
                <td width="85%" style="text-align: left;"><img src="${q.q4}"></td>
            </tr>
            <tr>
                <td>학생 답</td>
                <td style="text-align: left;">${ea.a4}</td>
            </tr>
            <tr>
                <td>모법 답안</td>
                <td style="text-align: left; color:blue">${q.a4}</td>
            </tr>
            
            <tr>
                <td width="15%">문제5</td>
                <td width="85%" style="text-align: left;"><img src="${q.q5}"></td>
            </tr>
            <tr>
                <td>학생 답</td>
                <td style="text-align: left;">${ea.a5}</td>
            </tr>
            <tr>
                <td>모법 답안</td>
                <td style="text-align: left; color:blue">${q.a5}</td>
            </tr>
        </tbody>
    </table>
    <ul style="text-align: center; margin-bottom: 40px;">
        <li>
            <button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="javascript:history.back();">확인</button>
        </li>
    </ul>
    </form>
  </div>
  
  	<jsp:include page="common/footer.jsp"/>
</body>
</html>