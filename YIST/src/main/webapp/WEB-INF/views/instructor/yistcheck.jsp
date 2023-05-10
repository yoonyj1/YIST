<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    background: #fff;
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
    margin-left: 1px;
    margin-top: 0.5px;
}
.hak1_button:hover{
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
.whTable02 tr:last-child td {
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
                <div class="std_00">학생
                <input type="text" id="keyword" name="keyword" class="hak1_input" value="" placeholder="학생 이름을 입력해주세요">
                <button type="submit" class="hak1_button" onclick="getSearchList()">검색</button>
                <!-- <span class="theDate_sp">2023-04-11 (화)</span> -->
                <input type="date" class="start" style="margin-left: 5px;">
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
							<div><img src="" style="vertical-align: baseline;"><br><input type="checkbox" id="allChk" title=""></div>
						</th>
						<th class="attendance">번호</th>
						<th class="attendance">학생(반)</th>
						<th class="attendance">출석시간
							
						</th>
						<th class="attendance">퇴실시간
						</th>
					</tr>
								<tr style="height: 70px;">
									<td align="center">
										<input type="checkbox" title="" name="parPushSendChk" value="1" checked="">
									</td>
									<td align="center">1</td>
									<td align="center">
										<a href=""style="color:#333333;text-decoration:none">박누구 ()</a>
										
									</td>
									<td align="center">
										<div class="btn_group_bg">
											<div class="btn_group_1" style="margin: 5px;">
												<button type="button" id="btn01_0"  class="btn01 " onclick="displayDate()">출석</button>
												<button type="button" id="btn02_0"  class="btn02 " onclick="displayDate()">지각</button>
												<button type="button" id="btn04_0"  class="btn03 " onclick="displayDate3()">결석</button>
											</div>
											<input type="text" name="inHour" id="inHour_0" value="" style="width: 60px; text-align: center;">시 
											: 
											<input type="text" name="inMin" id="inMin_0" value="" style="width: 60px; text-align: center;">분
										</div>
									</td>
									<td align="center">
										<div class="btn_group_bg">
											<div class="btn_group_1" style="margin-top: 8px; margin-bottom: 5px;">
												<button type="button" id="btn11_0"  class="btn01" onclick="displayDate2()">귀가</button>
												<button type="button" id="btn03_0"  class="btn02 " onclick="displayDate2()">조퇴</button>
												<button type="button" id="btn10_0"  class="btn03 " onclick="displayDate3()">도망</button>
											</div>
											<input type="text" name="outHour" id="outHour_0" value="" style="width: 60px;  text-align: center;" >시 
											: 
											<input type="text" name="outMin" id="outMin_0" value="" style="width: 60px; text-align: center;">분
										</div>
									</td>
								</tr>
                                
                            </tbody>
                        </table>
                        
                        <button type="button" class="hak1_button" style="margin-left: 800px; margin-top: 10px;">저장</button>
                        <button type="button" class="hak1_button" style="margin-left: 780px; margin-top: 10px; width: 80px;" onclick="return printPage();">프린트</button>
      					<a href="#pop_info_1" class="btn_open">프린트하기</a>
      </div>
      	
       	
    </body>

		<script>
			function displayDate() {
			  var d = new Date();
			  var hour = d.getHours();
			  var min = d.getMinutes();
			  document.getElementById("inHour_0").value = hour;
			  document.getElementById("inMin_0").value = min;
			}
			
			function displayDate2() {
				  var d = new Date();
				  var hour = d.getHours();
				  var min = d.getMinutes();
				  document.getElementById("outHour_0").value = hour;
				  document.getElementById("outMin_0").value = min;
				}
            
             function displayDate3() {
                  document.getElementById("outHour_0").value = "00";
				  document.getElementById("outMin_0").value = "00";
				  document.getElementById("inHour_0").value = "00";
				  document.getElementById("inMin_0").value = "00";
				}
             
             var initBodyHtml;
             function printPage(){
            	 window.print();
             }
             function beforePrint(){
            	 initBodyHtml = document.body.innerHTML;
            	 document.body.innerHTML = document.getElementById('pirint').innerHTML;
             }
             function afterPrint(){
            	 document.body.innerHTML = initBodyHtml;
             }
             window.onbeforeprint = beforePrint;
             window.onafterprint =afterPrint;
             
             var target = document.querySelectorAll('.btn_open');
             var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
             var targetID;

             
		</script>
		

</html>