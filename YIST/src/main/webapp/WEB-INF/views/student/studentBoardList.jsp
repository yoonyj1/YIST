<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <ul style="text-align: center; margin-top: 40px">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">우리반 게시판</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
      <div data-example-id="simple-button-group" class="bs-example" style="text-align: center; padding: 15px;">
        <div aria-label="Basic example" role="group" class="btn-group">
          <button class="btn btn-default" type="button">전체</button>
          <button class="btn btn-default" type="button">학습자료</button>
          <button class="btn btn-default" type="button">과제</button>
          <button class="btn btn-default" type="button">Q & A</button>
        </div>
      </div>
    </div> 
    <div class="entry-content">
      <table>
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
          <tr>
            <td>1</td>
            <td>과제</td>
            <td style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
            <td>관리자</td>
            <td>2023-03-27</td>
            <td>8</td>
          </tr>
          <tr>
            <td>2</td>
            <td>학습자료</td>
            <td style="text-align: left;">2023.01.01 ~ 2023.12.31 훈련장려금 인상 안내</td>
            <td>관리자</td>
            <td>2023-03-25</td>
            <td>6</td>
          </tr>
          <tr>
            <td>3</td>
            <td>과제</td>
            <td style="text-align: left;">HRD-Net모바일 어플 OS업그레이드 작업 안내</td>
            <td>관리자</td>
            <td>2023-03-21</td>
            <td>16</td>
          </tr>
          <tr>
            <td>4</td>
            <td>Q & A</td>
            <td style="text-align: left;">폭우로 인한 금일 지각자 출석인정 방법 및 원격훈련 전환 공지</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>4</td>
          </tr>
          <tr>
            <td>5</td>
            <td>Q & A</td>
            <td style="text-align: left;">자습실 이용시 주의사항</td>
            <td>관리자</td>
            <td>2023-03-21</td>
            <td>5</td>
          </tr>
          <tr>
            <td>6</td>
            <td>Q & A</td>
            <td style="text-align: left;">KH수강생을 위한 식권 판매 변경된 제도 안내 입니다.</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>3</td>
          </tr>
          <tr>
            <td>7</td>
            <td>과제</td>
            <td style="text-align: left;"> 코로나19 진단검사 체계 전환에 따른 출결 인정 방법</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>4</td>
          </tr>
          <tr>
            <td>8</td>
            <td>학습자료</td>
            <td style="text-align: left;"> 코로나19 진단검사 체계 전환에 따른 출결 인정 방법</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>6</td>
          </tr>
          <tr>
            <td>9</td>
            <td>학습자료</td>
            <td style="text-align: left;"> 코로나19 진단검사 체계 전환에 따른 출결 인정 방법</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>10</td>
          </tr>
          <tr>
            <td>10</td>
            <td>학습자료</td>
            <td style="text-align: left;"> 코로나19 진단검사 체계 전환에 따른 출결 인정 방법</td>
            <td>관리자</td>
            <td>2023-03-19</td>
            <td>8</td>
          </tr>
        </tbody>
      </table>
      <div style="text-align: right;">
        <a href="#" class="btn btn-gray btn-theme-colored btn-circled">글쓰기</a>
      </div> 
    </div>       
  </div>

  <nav style="text-align: center;">
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
  
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>