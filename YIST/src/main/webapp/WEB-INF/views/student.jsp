<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회</title>

<style> 
div {
    display: block;
}


.leftMenu {
    width: 25%;
    height: 100%;
    border-top: 1px solid #353944;
    background: #a4a2a9;
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
    background-color: #a373ba;
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
    width: 170px;
    height: 230px;
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
    <body marginwidth="0" marginheight="0" style="zoom: 1;">
    <jsp:include page="common/header.jsp"/>
       <div style="height: 1000px;; padding-left: 250px;"class="all">
        <div class="leftMenu">
            <div class="topBtnBox" style="background-color: #1d1e24; height: 75px;">   
                <div class="topBtnBox_left"><h1 style="font-size: 20px; color: white; margin-top: 27px;">학생관리</h1></div>
                <div class="topBtnBox_right">
                    <button type="button" class="bBtn03"onclick="locationGo('member','0','W','student_write.asp','left_student.asp');" title=""><strong style="font-size:13pt">+</strong> 학생등록</button>
                </div>
            </div>
            <div class="topBtnBox2Line" style="margin-top: 15px;">
                <form name="fSch" method="get">
                <div class="search">
                    <table cellpadding="0" cellspacing="0" width="100%" style="margin-left: 7px;">
                        <tbody >
                            <tr>
                            <td>
                                <select style="width:88px; border-radius: 3px;" name="nowState" id="nowState">
                                    <option value="9">수강전체</option>
                                    <option value="3">수강+대기생</option>
                                    <option value="2" selected="">수강생</option>
                                    <option value="1">대기생</option>
                                    <option value="8">휴강생</option>
                                    <option value="0">퇴원생</option>
                                </select>
                                <select style="width:226px; border-radius: 3px;" name="classNo" id="classNo">
                                    <option value="" selected="">---- 학급 선택 ----</option>
                                    
                                        <option value="8655">자바프로그래밍</option>
                                    
                                        <option value="8663">JAVA</option>
                                    
                                </select>
                            </td>
                            <td rowspan="2" valign="top" align="right"><button type="button" class="bBtn08" style="width:70px; height:65px;background-color: #34353f; border-radius: 5px; color: white; margin-right: 14px;" 
                                onclick="document.fSch.nowState.disabled=false;document.fSch.classNo.disabled=false;document.fSch.keytype.disabled=false;document.fSch.submit();">검색</button></td>
                        </tr>
                        <tr>
                            <td>
                                <select style="width:88px; border-radius: 3px;" name="keytype" id="keytype">
                                    <option value="name">학생이름</option>
                                    <option value="id">학생아이디</option>
                                    <option value="rfcardNo">학생학원번호</option>
                                </select>
                                <input type="text" name="keyword" id="keyword" style="width:226px;" onfocus="javascript:SetCaretAtEnd(document.getElementById('keyword'));" value="">
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>

                    <table cellpadding="0" cellspacing="0" width="100%" class="leftMemList" style="margin-top: 10px;">
                        <tbody style="background-color: #34353f; height: 40px;">
                            <tr>
                            <th width="30"><input type="checkbox" name="check" onclick="revcheck(this.form);" title="문자발송" style="margin-left: 10px;"></th>
                            <th width="40" style="color: rgb(255, 255, 255); font-size: 17px;">No</th>
                            <th width="70" style="color: rgb(255, 255, 255); font-size: 15px;">이름 <span class="up_btn"><a href="javascript:;" onclick="document.fMemPcsList.orderby.value='name asc';document.fMemPcsList.submit();" style="color:#000000;">▲</a></span><span class="up_btn"><a href="javascript:;" onclick="document.fMemPcsList.orderby.value='name desc';document.fMemPcsList.submit();">▼</a></span></th>
                            <th width="88" style="color: rgb(255, 255, 255); font-size: 15px;">학생휴대폰</th>
                        </tr>
                    </tbody>
                </table>
                 
                    <table cellpadding="0" cellspacing="0" width="100%" class="leftMemList">
                                <tbody style="height: 40px; color: black;">
                                    <tr id="listItem_user03" class="on" onkeydown="onItemKeyDown('user03', event);" onclick="showContents('user03');">
                                    <td width="30" align="center"><input type="checkbox" name="mobileNo" id="listItemMobileNo_user03" value="user03|김누구|"></td>
                                    <td width="88" style="font-size: 17px;" align="center" id="listItemPcs_user03">1</td>
                                    <td width="70" style="padding-left:5px; font-size: 15px;"  id="listItemSex_user03"><div class="sex_man" id="listItemName_user03">김누구</div></td>
                                    <td align="right" style="padding-right:70px; font-size: 15px;"  id="listItemMinab_user03" class="leftStdListMoreOpen">010-5285-0376</td>
                                </tr>
                                </tbody>
                                
                </table>
                <div style="border: solid 1px #34353f"></div> 
                </form>
            </div> <!--topBtnBox2Line-->

            </div> <!--leftMenu-->
            <div class="contents"> 
                <div class="infoStyle03">   
                    <div id="memberInfo" style="background-color: #444959;">
                        <br>
                        <div class="tableGroup" style="height: 1000px;">
                            <div id="photoArea">
                                <div class="photoGroup">
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
                                    <th style="color: white;">이름 </th>
                                    <td><input type="text" name="memName" value="김누구" maxlength="20" style="width:100%; height: 35px;" disabled=""></td>
                                    
                                </tr>
                                <tr>
                                    <th style="color: white;">성별 </th>
                                    <td>
                                        <input type="radio" name="sex" value="남" checked="">남 
                                        <input type="radio" name="sex" value="여">여
                                        &nbsp;(26세)
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color: white;">아이디 </th>
                                    <td><input type="text" style="width:100%; height: 35px;" name="memId" value="user03" class="readon" disabled=""></td>
                                </tr>
                                <tr>
                                    <th style="color: white;">비밀번호 </th>
                                    <td><input type="text" style="width:100%; height: 35px;" name="pw" value="pass03" maxlength="16" disabled=""></td>
                                </tr>
                                <tr>
                                    <th style="color: white;">생년월일</th>
                                    <td>
                                        <input type="text" style="width:80px; height: 35px;" class="datepicker hasDatepicker" readonly="" name="birthday" value="1998-12-24" id="dp1680462505816" disabled=""> 
                                    </td>
                                </tr>   
                                <tr>
                                <th style="color: white;">이메일</th>
                                <td><input type="text" name="email" value="jane9512@naver.com" maxlength="50" style="width:100%; height: 35px;" disabled=""></td>
                                </tr>                          
                                <tr>
                                    <th style="color: white;">반</th>
                                    <td><input type="text" name="class" value="361" maxlength="30" style="width:30px; height: 35px;" disabled="">반</td>
                                </tr>
                                <tr>
                                    <th style="color: white;">휴대전화</th>
                                    <td>
                                        <input type="text" name="pcs" value="010-5285-0376" maxlength="15" style="width:200px; height: 35px;" disabled=""> 
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color: white;">주소 </th>
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




       
    </body>
</head>

<script>

</script>


