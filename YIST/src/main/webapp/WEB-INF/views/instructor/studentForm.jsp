<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생게시판</title>

<style> 
div {
    display: block;
}


.leftMenu {
    height: 100%;
    background: #f0f0f1;
    box-sizing: border-box;
    float: left;
}

.contents{
    width: 75%;
    margin-left: 413px;
    height: 100%;
}



.leftMenu .topBtnBox {
    width: 100%;
    height: 48px;
    padding: 7px 9px 7px 7px;
    box-sizing: border-box;
}
.leftMenu .topBtnBox .topBtnBox_left {
    float: left;
    width: 60%;
}
<!--학생등록버튼-->
.leftMenu .topBtnBox .topBtnBox_right {
    float: right;
    padding-left: 4px;
    width: 40%;
}
button.bBtn03 {
    height: 33px;
    padding: 0 8px;
    padding-bottom: 3px;
    border: none;
    color: #fff;
    font-size: 12px;
    text-shadow: 0 0 2px #000;
    letter-spacing: -0.5px;
    box-sizing: border-box;
    background-color: #02068D;
    border-radius: 5px;
    width: 120px;
    margin-top: 20px;
    margin-left: 35px;
}
<!--상단 카테고리-->
.leftMenu .topBtnBox2Line {
    height: 30px;
    padding: 5px;
    vertical-align: top;
    box-sizing: border-box;
}
select:not(:-internal-list-box) {
    overflow: visible !important;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
}

.leftMenu .topBtnBox2Line .search select, .leftMenu .topBtnBox2Line .search input[type=text] {
    height: 32px;
    padding: 5px;
    border: 1px solid #444959;
    vertical-align: top;
    box-sizing: border-box;
    margin-top: 3px;
}
<!--학생조회-->
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
<!--컨텐츠-->



#memberInfo {
    position: relative;
    box-sizing: border-box;
    border: solid 2px black;
    
    
}
<!--프로필사진-->
#photoArea {
    position: absolute;
    top: 0;
    left: 0;
    width: 180px;
    
}

#photoArea .photoGroup {
    position: relative;
    width: 190px;
    height: 250px;
    background: #ccc;
    float: left;
    margin-right: 10px;
    margin-left: 30px;
    margin-top: 10px;
}
#photoArea .photoGroup img {
    display: block;
    width: 100%;
    height: 100%;
}


</style>


</head>


<body marginwidth="0" marginheight="0" style="zoom: 1;">
<div class="page-wrapper">
	<div class="wrapper">
    <jsp:include page="../instructor/common/header.jsp"></jsp:include>
       <div style="height: 1000px; class="all">
        <div class="leftMenu">
            <div class="topBtnBox" style="background-color: #979cc4; height: 75px;">   
                <div class="topBtnBox_left"><h1 style="font-size: 20px; color: white; margin-top: 27px;">학생관리</h1></div>
            </div>
            <div class="topBtnBox2Line" style="margin-top: 15px;">
                
                <form name="search.bo" method="get">
                <div class="search">
                    <table cellpadding="0" cellspacing="0" width="100%" style="margin-left: 7px;">
                        <tbody >
                             <tr>
                            <td>
                                <select style="width:95px; border-radius: 3px;" name="searchType">
                                    <option value="studentname">학생이름</option>
                                    <option value="stuphone">핸드폰번호</option>
                                </select>
                                <input type="text" name="searchValue" id="searchName" style="width:226px; border-radius: 3px;" value="${ keyword }">
                            </td>
                            <td rowspan="2" valign="top" align="right"><button type="submit" class="bBtn08" style="width:70px; height:35px;background-color: #02068D; border-radius: 5px; color: white; margin-right: 14px;" 
                                onclick="getSearchList()">검색</button></td>
                        </tr>
                       
                    </tbody>
                    </table>
                </div>
                	
               

                    <table cellpadding="0" cellspacing="0" width="100%" class="leftMemList" style="margin-top: 10px;">
                        <tbody style="background-color: #979cc4; height: 40px;">
                            <tr>
                            <th width="30"><input type="checkbox" name="check" onclick="revcheck(this.form);" title="문자발송" style="margin-left: 10px;"></th>
                            <th width="40" style="color: rgb(255, 255, 255); font-size: 17px;" name="idx">No</th>
                            <th width="70" style="color: rgb(255, 255, 255); font-size: 15px;" name="name">이름 <span class="up_btn"><a href="" style="color:#000000;">▲</a></span><span class="up_btn"><a href="javascript:;" onclick="">▼</a></span></th>
                            <th width="88" style="color: rgb(255, 255, 255); font-size: 15px;" name="ph">학생휴대폰</th>
                        </tr>
                    </tbody>
                </table>
                 
                    <table cellpadding="0" cellspacing="0" width="100%" class="leftMemList">
                                <tbody style="height: 40px; color: black;">
                                	<c:forEach var="b" items="${list}">
                                    <tr id="listItem_user03" class="on" id="btn1">
                                    <td width="30" align="center"><input type="checkbox" name="mobileNo" id="listItemMobileNo_user03" value=""></td>
                                    <td width="88" style="font-size: 17px;" align="center" id="listItemPcs_user03" class="bno">1</td>
                                    <td width="70" style="padding-left:5px; font-size: 15px;"  id="listItemSex_user03"><div class="sex_man" id="listItemName_user03">${b.name}</div></td>
                                    <td align="right" style="padding-right:70px; font-size: 15px;"  id="listItemMinab_user03" class="leftStdListMoreOpen">${b.phone}</td>
                                </tr>
                               		</c:forEach>
                                </tbody>
                                
                </table>
                <div style="border: solid 1px #02068D"></div> 
                </form>
            </div> <!--topBtnBox2Line-->

            </div> <!--leftMenu-->
            <div class="contents"> 
                <div class="infoStyle03">   
                    <div id="memberInfo" style="background-color: #f8f8f8;">
                        <br>
                        <div class="tableGroup" style="height: 1000px; margin-top: 30px; margin-left: 50px;">
                            <div id="photoArea">
                                <div class="photoGroup" style="margin: 20px;">
                                    <img id="memBerPhoto" src="" alt="">
                                </div>
                            </div>
                            <table cellpadding="0" cellspacing="0" style="width:1000px; height: 500px;">
                                <colgroup >
                                    <col width="60">
                                    <col width="100">
                                    <col width="120">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">이름 </th>
                                    <td><input type="text" name="memName" value="김누구" maxlength="20" style="width:100%; height: 35px;" disabled=""></td>
                                    
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">성별 </th>
                                    <td>
                                        <input type="radio" name="sex" value="남" checked="">남 
                                        <input type="radio" name="sex" value="여">여
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">아이디 </th>
                                    <td><input type="text" style="width:100%; height: 35px;" name="memId" value="user03" class="readon" disabled=""></td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">비밀번호 </th>
                                    <td><input type="text" style="width:100%; height: 35px;" name="pw" value="pass03" maxlength="16" disabled=""></td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">생년월일</th>
                                    <td>
                                        <input type="text" style="width:80px; height: 35px;" class="datepicker hasDatepicker" readonly="" name="birthday" value="1998-12-24" id="dp1680462505816" disabled=""> 
                                    </td>
                                </tr>   
                                <tr>
                                <th style="color: rgb(87, 87, 87);">이메일</th>
                                <td><input type="text" name="email" value="jane9512@naver.com" maxlength="50" style="width:100%; height: 35px;" disabled=""></td>
                                </tr>                          
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">반</th>
                                    <td><input type="text" name="class" value="361" maxlength="30" style="width:30px; height: 35px;" disabled="">반</td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">휴대전화</th>
                                    <td>
                                        <input type="text" name="pcs" value="010-5285-0376" maxlength="15" style="width:200px; height: 35px;" disabled=""> 
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">주소 </th>
                                    <td colspan="3">
                                        <div style="padding-bottom:5px;">
                                            <input type="text" style="width:100px; height: 35px;" name="zipcode" id="zipcode" title="우편번호" value="07362" maxlength="5" onkeyup="chkNumeric(this);" disabled=""> 
                                            </div>
                                        <div>
                                            <input type="text" style="width:41%; height: 35px;" name="address1" id="address1" value="서울시 영등포구 신길동" maxlength="150" title="주소" disabled="">
                                            <input type="text" style="width:41%; height: 35px;" name="address2" id="address2" value="래미안아파트101동303호" maxlength="50" title="상세주소" disabled="">
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> 
                    </form>
                </div> 
                

                </div>
            </div><!--전체-->

		</div>
		</div>
       	
    </body>
    
    	<script>
    		$(function(){
    			$("#leftMemList>tbody>tr").click(function(){
    				location.href='detail.bo?bno'+$(this).children(".bno").text();
    			})
    		})
		</script>
    	<!-- 학생정보클릭함수 -->
    	<script>
    	
    	</script>
</html>