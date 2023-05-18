<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.contents {
    margin-left:250px;
    padding: 0;
    overflow: auto;
    background: #f7f7f7;
    height: 900px; 
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
    margin-right: 50px;
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
    width: 45px;
    height: 30px;
    background-color:#02068D ;
    border: 0px;
    color: #ffffff;
    border-radius: 5px;
    margin-left: 5px;
    margin-top: 0.5px;
}
.hak1_button:hover{
    background-color: rgb(30, 92, 224);
}
.hak1_button2 {
    width: 45px;
    height: 30px;
    background-color:#02068D ;
    border: 0px;
    color: #ffffff;
    border-radius: 5px;
    margin-left: 1px;
    margin-top: 0.5px;
}
.hak1_button2:hover{
    background-color: rgb(30, 92, 224);
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

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.whTable02 th{
    border: 1px solid rgb(191, 191, 191);
}
.whTable02 td {
        border: 1px solid rgb(191, 191, 191);
    }


table {
margin: 0 auto;
width: 800px;
    }

.btn01:hover,.btn02:hover,.btn03:hover{
    background-color: rgb(144, 233, 108);
    color: rgb(0, 0, 0);
    border-radius: 5px;
}
.btn01,.btn02,.btn03{
    border-radius: 5px;
    width: 60px;
    height: 25px;
    border: solid 1px rgb(194, 194, 194);
}
</style>
</head>
<jsp:include page="../instructor/common/header.jsp"></jsp:include>
<body marginwidth="0" marginheight="0" style="zoom: 1;">
  <div class="contents">
            <h2>학생출석체크</h2>
         

       <div class="infoStyle04">
        <form name="f" method="get" action="search.bo">
          <div class="studySearch">
            <div class="hak1_left">
              <div class="hak1">
                <div class="std_00">
                <input type="date" id="test" class="start" style="margin-left: 5px;">
                <button type="button" class="hak1_button" id="on">검색</button>
              </div>
              </div>
            </div>
            </div>
        </form>

            <div class="attendStatus">
              <div style="display:inline-block; margin-left: 720px;">
                <ul class="asResult" id="attendStatus">
                  <li class="fcBlue"><strong>출석</strong> : <span id="attCnt"></span>${list[0].y_count}명</li>
                  <li class="fcOrange"><strong>결석</strong> : <span id="rateCnt">${list[0].n_count}</span>명</li>
                </ul>
              </div>
          </div>
       </div> 
        
			<form action="uptime.me" method="post">
       		<table cellpadding="0" cellspacing="0" class="whTable02 stdcheck" align="center">
					<colgroup >
						<col width="22px">
						<col width="44px">
						<col width="165px">
						<col width="120px">
						<col width="120px">


					</colgroup>
					<tbody>
                        <tr align="center">
						<th style="width:20px;height:90px;">
							<div><input type="checkbox" id="allChk" title="" onclick="checkAll()"></div>
						</th>
						<th class="attendance">번호</th>
						<th class="attendance">학생(반)</th>
						<th class="attendance">출석시간
							
						</th>
						<th class="attendance">퇴실시간
						</th>
					</tr>
					
			<c:forEach var="b" items="${list}">
			<tr style="height: 70px;">
				<td align="center">
					<input type="checkbox" title="" name="parPushSendChk" value="1" checked="">
				</td>
				<td align="center" class="bno">${b.memberNo}</td>
				<td align="center">
					<a href="" style="color:#333333;text-decoration:none">${b.name} (${b.subject})</a>
				</td>
				<td align="center">
					<div class="btn_group_bg">
						<div class="btn_group_1" style="margin: 5px;">
							<button type="button" id="btn01_${b.memberNo}" class="btn01" onclick="displayDate('${b.memberNo}')">출석</button>
							<button type="button" id="btn02_${b.memberNo}" class="btn02" onclick="displayDate('${b.memberNo}')">지각</button>
							<button type="button" id="btn04_${b.memberNo}" class="btn03" onclick="displayDate3('${b.memberNo}')">결석</button>
						</div>
						<input type="text" name="inHour" id="inHour_${b.memberNo}" value="${b.INHOUR}" style="width: 120px; text-align: center;"> 
					</div>
				</td>
				<td align="center">
					<div class="btn_group_bg">
						<div class="btn_group_1" style="margin-top: 8px; margin-bottom: 5px;">
							<button type="button" id="btn11_${b.memberNo}" class="btn01" onclick="displayDate2('${b.memberNo}')">귀가</button>
							<button type="button" id="btn03_${b.memberNo}" class="btn02" onclick="displayDate2('${b.memberNo}')">조퇴</button>
							<button type="button" id="btn10_${b.memberNo}" class="btn03" onclick="displayDate3('${b.memberNo}')">도망</button>
						</div>
						<input type="text" name="outHour" id="outHour_${b.memberNo}" value="${b.OUTHOUR}" style="width: 120px; text-align: center;">
						</div>
					</td>
				</tr>
					</c:forEach>
                        <button type="submit" class="hak1_button2" style=" width: 100px; margin-left: 680px; margin-top: 10px; margin-bottom:20px;">저장</button>
                        <button type="" class="hak1_button2" style="width: 100px; margin-left: 10px; margin-top: 10px; margin-bottom:20px;">프린트</button>
                        </table>
      					</form>
     </div>
      	
				<script>
			function displayDate(memberNo) {
				var d = new Date();
				var time = d.getHours() + ":" + d.getMinutes();
				document.getElementById("inHour_" + memberNo).value = time;
			}
		
			function displayDate2(memberNo) {
				var d = new Date();
				var time = d.getHours() + ":" + d.getMinutes();
				document.getElementById("outHour_" + memberNo).value = time;
			}
		
			function displayDate3(memberNo) {
				document.getElementById("outHour_" + memberNo).value = "00:00";
				document.getElementById("inHour_" + memberNo).value = "00:00";
			}
			</script>
			
			<script>
				function checkAll() {
				  var checkboxes = document.getElementsByName('parPushSendChk');
				  var checkAllBox = document.getElementById('allChk');
				  
				  for (var i = 0; i < checkboxes.length; i++) {
				    checkboxes[i].checked = checkAllBox.checked;
				  }
				}
			</script>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>
			$(document).ready(function() {
				  let user = [];

				  $("#on").on("click", function() {
				    var selectedDate = $('#test').val();
				    console.log(selectedDate);
				    $.ajax({
				      url: "ylist.bo",
				      method: "GET",
				      data: { 
				        date: selectedDate 
				      },
				      success: function(response) {
				        console.log(response);
				        $("input[name='inHour']").val(response[0].INHOUR);
				        $("input[name='outHour']").val(response[0].OUTHOUR);
				      },
				      error: function() {
				        console.log("출결조회실패");
				      }
				    });
				  });
				});
			</script>
       	
    </body>

		

</html>