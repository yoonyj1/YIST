<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님게시판</title>

<style> 
div {
    display: block;
}


.leftMenu {
    width: 25%;
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
 						<form action="update.me" method="post">
 						<input type="hidden" id="id" name="id" value="${loginUser.id}">
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
                                    <td><input type="text" name="name" value="${loginUser.name }" maxlength="20" style="width:100%; height: 35px;" ></td>
                                    
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">아이디 </th>
                                    <td><input type="text" style="width:100%; height: 35px;" name="id" value="${loginUser.id}" class="readon" disabled=""></td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">생년월일</th>
                                    <td>
                                        <input type="text" style="width:80px; height: 35px;" class="datepicker hasDatepicker" name="birth" value="${loginUser.birth}" id="dp1680462505816" > 
                                    </td>
                                </tr>   
                                <tr>
                                <th style="color: rgb(87, 87, 87);">이메일</th>
                                <td><input type="text" name="email" value="${loginUser.email}" maxlength="50" style="width:100%; height: 35px;"></td>
                                </tr>                          
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">반</th>
                                    <td><input type="text" name="subject" value="361" maxlength="30" style="width:30px; height: 35px;" disabled="" >반</td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">휴대전화</th>
                                    <td>
                                        <input type="text" name="phone" value="${loginUser.phone}" maxlength="15" style="width:200px; height: 35px;" > 
                                    </td>
                                </tr>
                                <tr>
                                    <th style="color: rgb(87, 87, 87);">주소 </th>
                                    <td colspan="3">
                                        <div style="padding-bottom:5px;">
                                            <input type="text" style="width:100px; height: 35px;" name="post" id="zipcode" value="${loginUser.post}" maxlength="5" onkeyup="chkNumeric(this);"> 
                                            </div>
                                        <div>
                                            <input type="text" style="width:41%; height: 35px;" name="address" id="address1" value="${loginUser.address}" maxlength="150" title="주소" >
                                            <input type="text" style="width:41%; height: 35px;" name="detailAddress" id="address2" value="${loginUser.detailAddress}" maxlength="50" title="상세주소" >
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
			                	<div class="btns" align="center">
			                    <button type="submit" class="btn btn-primary">수정하기</button>
			                    </div>
                        </div>
                    </form>
                    </div> 
                </div> 
                

                </div>
            </div><!--전체-->




	</div>
	</div>
       
    </body>
    
</html>