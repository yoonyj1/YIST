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
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">평가현황</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    
    <div class="tableArea">
      <table class="list mt10">
        <colgroup>
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:20%">
        </colgroup>
        <tbody>
          <tr>
            <th scope="row">훈련과정명</th>
            <td colspan="4">(디지털컨버전스)자바(JAVA)기반 공공데이터 융합 개발자 양성과정A12</td>
          </tr>
          <tr>
            <th scope="row">훈련 기관명</th>
            <td colspan="4">KH정보교육원 강남지원 </td>
          </tr>
          <tr>
            <th scope="row">훈련기간</th>
            <td colspan="4">2022.10.18  ~ 2023.05.19  </td>
          </tr>
          <tr>
            <th scope="row">훈련생명</th>
            <td colspan="4">이윤화  </td>
          </tr>
          <tr>
            <th scope="row">총 훈련일수</th>
            <th>실시일수</th>
            <th>출석일</th>
            <th scope="row">결석일</th>
            <th>출석률 (일수)</th>
          </tr>
          <tr>
            <td> <span class="flr">148일</span></td>
            <td> <span class="flr">124일</span></td>
            <td> <span class="flr">124일</span></td>
            <td> <span class="flr">0일</span></td>
            <td> <span class="flr">83.8%</span></td>
          </tr>
        </tbody>
      </table>
    </div>
       
    <div class="tableArea">
      <table class="list mt10" style="margin-bottom: 40px;">
        <thead>
          <tr>
            <th scope="col" class="w17p">일자</th>
            <th scope="col" class="w17p">출결상태</th>
          </tr>
        </thead>
        <tbody>
                <tr class="tac">
                  <td>2022-10-18</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-19</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-20</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-21</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-24</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-25</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-26</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-27</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-28</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-10-31</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-11-01</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-11-02</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-11-03</td>
                  <td>출석</td>
                </tr>
                <tr class="tac">
                  <td>2022-11-04</td>
                  <td>출석</td>
                </tr>
              
        </tbody>
      </table>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>