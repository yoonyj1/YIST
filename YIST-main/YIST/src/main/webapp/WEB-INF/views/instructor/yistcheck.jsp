<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contents {
    width: 100%;
    margin-left:250px;
    padding: 0;
    overflow: auto;
    background: #fff;
}

.contents h2 {
    display: block;
    margin: 0;
    padding: 14.8px 20px;
    border: 1px solid #dfdddd;
    background: #dfdddd;
    color: #000;
    font-size: 14px;
    font-weight: bold;
    font-family: "맑은 고딕";
    box-sizing: border-box;
}
<!--학생 검색 상단바-->
form {
    display: block;
    margin-top: 0em;
}
.studySearch {
    padding-bottom: 10px;
    text-align: center;
}
.studySearch .hak1_left {
    float: left;
    padding: 10px 10px 3px 10px;
    border: 1px solid #ffffff;
    background: #fbfbfb;
    width: 100%;
    box-sizing: border-box;
}
.studySearch .hak1 {
    position: relative;
    line-height: 24px;
    margin-right: 15px;
    
}
.std_00 {
    margin-right: 5px;
}

.studySearch input[type=text] {
    margin-left: 20px;
    border: 1px solid #fff;
    background: #fff;
    box-sizing: border-box;
    padding: 4px;
    font-size: 12px;
    font-family: "돋움";
    vertical-align: top;
}
.hak1_input {
    width: 173px !important;
    border: 1px solid #ccc !important;
    margin-left: 0px !important;
}

.hak1_button {
    width: 39px;
    height: 24px;
    background-color:#02068D ;
    border: 0px;
    color: #ffffff;
}
<!-- 몇명인지 나오는 칸-->
.attendStatus {
    width: 100%;
    height: 48px;
    padding-top: 14px;
    clear: left;
}
.attendStatus .asResult {
    margin-top: 10px;
}
.attendStatus .asResult li {
    float: left;
    margin-right: 20px;
    font-size: 14px;
}
strong {
    font-weight: bold;
}

</style>
</head>
<jsp:include page="../instructor/common/header.jsp"></jsp:include>
<body marginwidth="0" marginheight="0" style="zoom: 1;">
       <div class="contents">
        <h2>학생출석체크</h5>
         
       <div class="infoStyle04">
        <form name="f" method="get" action="">
          <div class="studySearch">
            <div class="hak1_left">
              <div class="hak1">
                <div class="std_00">학생
                <input type="text" id="keyword" name="keyword" class="hak1_input" value="" placeholder="학생 이름을 입력해주세요">
                <button type="button" class="hak1_button">검색</button>
                <span class="theDate_sp">2023-04-11 (화)</span>
                <input type="date" class="start">
              </div>
              </div>
            </div>

            <div class="attendStatus">
              <div style="display:inline-block;">
                <ul class="asResult" id="attendStatus">
                  <li><strong>전체</strong> : <span id="allCnt">2</span>명</li>
                  <li class="fcBlue"><strong>출석</strong> : <span id="attCnt">0</span>명</li>
                  <li class="fcOrange"><strong>지각</strong> : <span id="rateCnt">0</span>명</li>
                  <li class="fcRed"><strong>결석</strong> : <span id="absCnt">0</span>명</li>
                </ul>
              </div>
            </div>
          </div>
        </form>


       </div>   
          






      </div>

      

    </body>

</html>