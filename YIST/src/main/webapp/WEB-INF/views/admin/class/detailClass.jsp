<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-강의조회</title>
<style>
	div.card-body table#classinfo-table,
	div.card-body table#classStudent-table{
		width: 75%;
		margin-left: auto;
		margin-right: auto;
    }

	table td, 
  table th{
        text-align: center;
        vertical-align: middle;
        color: black;
	}

	table#classinfo-table td>input{
        vertical-align: middle;
	}

	table#classinfo-table td>label{
		margin-right: 5px;
		padding-top: 10px;
	}
</style>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="../common/header.jsp"/>

	<div class="card card-default">
		<div class="card-header">
			<h2>강의 정보</h2>
		</div>

		<div class="card-body">

			<table class="table table-bordered" id="classInfo-table">
                    
				<tr>
					<th colspan="2"> 강의명</th>
					<td colspan="2">자바의정석</td>
				</tr>

				<tr>
                      <th>담당강사</th>
                      <td>
                          강사이름
                      </td>
                      <th> 강의과목</th>
                      <td>
                          자바
                      </td>
				</tr>

				<tr>
                      <th>수강정원</th>
                      <td>
                          10
                      </td>
                      <th>수강료</th>
                      <td>
                          300,000 원
                      </td>
				</tr>

				<tr>
                      <th>개강일</th>
                      <td>
                        2023.03.17
                      </td>
                      <th>종강일</th>
                      <td>
                        2023.06.15
                      </td>
				</tr>

				<tr>
                      <th colspan="2">수업요일</th>
                      <td colspan="2">
                          <input type="checkbox" name="day" value="mon" id="mon">
                          <label for="mon">월</label>
                          <input type="checkbox" name="day" value="mon" id="tue">
                          <label for="tue">화</label>
                          <input type="checkbox" name="day" value="mon" id="wed">
                          <label for="wed">수</label>
                          <input type="checkbox" name="day" value="mon" id="thu">
                          <label for="thu">목</label>
                          <input type="checkbox" name="day" value="mon" id="fri">
                          <label for="fri">금</label>
                          <input type="checkbox" name="day" value="mon" id="sat">
                          <label for="sat">토</label>
                          <input type="checkbox" name="day" value="mon"id="sun">
                          <label for="sun">일</label>

                      </td>
				</tr>


			</table>






                  
                  
                  
                  
		</div>
 
		<div class="card-header">
			<h2>수강생 정보</h2>
		</div>
              
		<div class="card-body">
			<table class="table" id="classStudent-table">
				<thead class="thead-light">
                    <tr>
                      <th scope="col"></th>
                      <th scope="col">학생명</th>
                      <th scope="col">아이디</th>
                      <th scope="col">출석률</th>
                    </tr>
				</thead>
				<tbody>
                    <tr>
                      <td scope="row">1</td>
                      <td>Lucia</td>
                      <td>@Lucia</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">2</td>
                      <td>Catrin</td>
                      <td>@catrin</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">3</td>
                      <td>Lilli</td>
                      <td>@lilli</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">4</td>
                      <td>Else</td>
                      <td>@voigt</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">5</td>
                      <td>Ursel</td>
                      <td>@ursel</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">6</td>
                      <td>Anke</td>
                      <td>@Anke</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">7</td>
                      <td>Anke</td>
                      <td>@Anke</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">8</td>
                      <td>Anke</td>
                      <td>@Anke</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">9</td>
                      <td>Anke</td>
                      <td>@Anke</td>
                      <td>70%</td>
                    </tr>
                    <tr>
                      <td scope="row">10</td>
                      <td>Anke</td>
                      <td>@Anke</td>
                      <td>70%</td>
                    </tr>
                  </tbody>
			</table>                
		</div>

                
                
		<div class="btn-center">
			<button class="btn btn-light btn-pill" type="submit">뒤로가기</button>
		</div>

	</div>
</body>
</html>