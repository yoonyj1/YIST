<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>





    <!-- script  
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/simplebar/simplebar.min.js"></script>
	<script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/mono.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>    

    <link href="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.js"></script

	<script src="${pageContext.request.contextPath}/resources/admin/js/chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/map.js"></script>
>

	<link href="${pageContext.request.contextPath}/resources/admin/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" />
	-->
    
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/plugins/material/css/materialdesignicons.min.css">
	
	
    
    <!-- MONO CSS -->
    <link id="main-css-href" rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />

    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/9824677df6.js" crossorigin="anonymous"></script>
    
    <!-- FAVICON -->
    <link href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" rel="shortcut icon" />

    <style>
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        @font-face {
            font-family: 'LINESeedKR-Rg';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'LINESeedKR-Th';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Th.woff2') format('woff2');
            font-weight: 100;
            font-style: normal;
        }

        * {
            font-family: 'LINESeedKR-Rg';
        }
        
        body{
            background: white;
        }
        
        .enroll-area button {
            font-family: 'LINESeedKR-Bd';
            font-weight: 700;
        }

        button.btn-outline-primary:hover{
          background-color: #93cf82;
          border-color: #99da87;
          color:white;
        }

        button.btn-outline-primary{
          border-color: #99da87;
          color: #99da87;
        }


        table#memberInsert-table{
          line-height: 2em;
          width: 100%;
          margin-top: 50px;

        }

        table#memberInsert-table>th{
            vertical-align: middle;
            text-align: center;
            color: black;
        }

        .redMark{
            color: red;
            font-size: 1em;
            font-weight: 700;
            display: inline-block;
            margin-right: 5px;
        }

        .align-center{
            text-align: center;
        }

        .enroll-area{
            width: 1600px;
            height: auto;
            margin: 50px auto;
        }

        .enroll-area button.btn[aria-expanded="true"]{
            background-color: #99da87;
        }

        .btn-center{
          width: 100%;
          margin: 40px auto;
          text-align: center;
        }

        div.btn-center>button:first-child{
          background-color: #99da87;
          border-color: #99da87;
        }

        div.btn-center>button:first-child:hover{
          background-color: #8eca7d;
          border-color: #8eca7d;
        }

        button{
          font-family: 'LINESeedKR-Bd';
          font-weight: 700;
        }
        
        div.membership-area div.accordion div.card{
          float:none;
          text-align: left;
          min-height: auto;
          padding-bottom: 0;
        }

        div.membership-area div.accordion button.btn-link.collapsed{
            background-color: rgba(0, 0, 0, 0.03);
        }

        div.card-header{
            background-color: transparent;
        }
    </style>

</head>
<body>

	<jsp:include page="header.jsp"/>

    <div class="enroll-area">

        <div class="membership-area" style="width:80%; margin:50px auto;">
            <div class="accordion" id="accordionOne">
                <div class="card border-0">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                YIST 회원가입 약관
                            </button>
                        </h2>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                            wolf moon
                            officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                            Brunch 3 wolf
                            moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            Nihil anim
                            keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
                            excepteur
                            butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt
                            you probably
                            haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div style="text-align: right; margin-top: 10px; padding-right: 20px;">
                    <input type="radio" name="" id="member-agree-essential">
                    <label for="member-agree-essential" style="font-family: 'LINESeedKR-Bd';">회원가입 약관에 동의합니다(필수)</label>
                </div>
        
        
                <div class="card border-0">
                    <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                개인정보취급방침
                            </button>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionOne">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                            wolf moon
                            officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                            Brunch 3 wolf
                            moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            Nihil anim
                            keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
                            excepteur
                            butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt
                            you probably
                            haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div style="text-align: right; margin-top: 10px;  padding-right: 20px;">
                    <input type="radio" name="" id="member-agree-essential">
                    <label for="member-agree-essential" style="font-family: 'LINESeedKR-Bd';">개인정보취급방침에 동의합니다(필수)</label>
                </div>


                <form action="" method="post">
                    <table class="table-bordered" id="memberInsert-table">
                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    아이디
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:50%; padding:5px 10px; display: flex; flex-wrap: nowrap;">
                                    <input id="userId" type="text" class="form-control" name="" placeholder="사용할 아이디를 입력하세요" style="width:40%; float:left;">                        
                                    <button id="idCheck-btn" type="button" class="mb-1 btn btn-outline-primary" style="margin: 5px;">ID 중복확인</button>
                                </div>
                                <div id="id-resultBox" class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left;">
                                    아이디는 필수 입력 사항입니다.
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    비밀번호
                                </div>
                            </th>
                            <td id="pwd-td">
                                <div class="input-group"  style="width:40%; padding: 10px 10px 0px 10px ;">
                                    <input type="password" class="form-control" name="" placeholder="사용할 비밀번호를 입력하세요" id="userPWd" style="width:100%; ">                                                           
                                </div>
                                <div id="pwd-resultBox-en" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 12%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    알파벳 대, 소문자
                                </div>
                                <div id="pwd-resultBox-num" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 5%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    숫자
                                </div>
                                <div id="pwd-resultBox-spe" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 7%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    특수문자
                                </div>
                                <div id="pwd-resultBox-len" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 15%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    8글자 이상 15글자 이하
                                </div>
                                <div id="pwd-resultBox-etc" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 15%; float:left;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    비밀번호 확인
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:40%; padding: 10px;">
                                    <input type="password" class="form-control" placeholder="사용할 비밀번호와 동일한 비밀번호를 입력하세요" id="pwdCheck" style="width:100%;">                        
                                    <div id="pwdCheck-resultBox" class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left">
                                        입력한 비밀번호와 동일한 비밀번호를 입력하세요.
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <script>

                            let idFlag = false;
                            let pwdFlag = false;
                            let agreeFlag = false;
                            let verifiedFlag = false;

                            const reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
                            const num = /[0-9]/g;
                            const engSmall = /[a-z]/g;
                            const engLarge = /[A-Z]/g;
                            const spe = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
                            const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
                            const idResult = $("#id-resultBox");
        

                            function idCheck(){
                                let id = $("#userId").val();

                                
                                if(id.length <= 1){
                                    idResult.css("color","red");
                                    idResult.text("아이디를 한글자 이상 입력해주세요");
                                }else{
                                    idResult.text("아이디는 필수 입력 사항입니다.");
                                }

                                if(hangulcheck.test(id)){
                                    idResult.css("color","red");
                                    idResult.text("아이디에 한글을 사용할 수 없습니다.")
                                }
                                


                            }


                            function chkPW(){
        
                                let pw = $("#userPWd").val();
                                let pwCheck = $("#pwdCheck").val();
        

                                
                                if(!reg.test(pw)){
                                    $("#pwd-td text-daborder-danger span").removeClass("mdi-check-all");
                                    $("#pwd-td text-daborder-danger span").addClass("mdi-check").css("color","lightgreen");

                                    $("#pwd-td text-daborder-danger").css("color","#8a909d");

                                    if(pw.length<8 || pw.length>15){

                                        $("#pwd-resultBox-len span").css("color","red");
                                        $("#pwd-resultBox-len").css("color","red");

                                        

                                    }else{
                                        $("#pwd-resultBox-len span").css("color","#8a909d");
                                        $("#pwd-resultBox-len").css("color","#8a909d");
                                    }
                                    
                                    if(!num.test(pw)){

                                        $("#pwd-resultBox-num").css("color","red");
                                        $("#pwd-resultBox-num span").css("color","red");

                                    }else{
                                        
                                        $("#pwd-resultBox-num").css("color","#8a909d");
                                        $("#pwd-resultBox-num span").css("color","#8a909d");
                                    }
                                    
                                    if(!engSmall.test(pw) || !engLarge.test(pw)){

                                        $("#pwd-resultBox-en").css("color","red");
                                        $("#pwd-resultBox-en span").css("color","red");

                                    }else{

                                        $("#pwd-resultBox-en").css("color","#8a909d");
                                        $("#pwd-resultBox-en span").css("color","#8a909d");
                                    }
                                    
                                    if(!spe.test(pw)){

                                        $("#pwd-resultBox-spe").css("color","red");
                                        $("#pwd-resultBox-spe span").css("color","red");

                                    }else{

                                        $("#pwd-resultBox-spe").css("color","#8a909d");
                                        $("#pwd-resultBox-spe span").css("color","#8a909d");
                                    }
                                   
        
                                }else{

                                    $("#pwd-td .text-daborder-danger span").removeClass("mdi-check");
                                    $("#pwd-td .text-daborder-danger span").addClass("mdi-check-all").css("color","lightgreen");

                                    $("#pwd-td .text-daborder-danger").css("color","lightgreen");

                                    

                                }

        
                            }
        
                            function pwdEqualCheck(){
 

                                var pw = $("#userPWd").val();
                                var pwCheck = $("#pwdCheck").val();
                                
                                if(pwCheck.length >= 8 && reg.test(pw)){
                                        if(pw===pwCheck){
                                            $("#pwdCheck-resultBox").css("color","lightgreen");
                                            $("#pwdCheck-resultBox").text("비밀번호가 일치합니다");
                                            pwdFlag = true;                                            
                                        }else{
                                            $("#pwdCheck-resultBox").css("color","red");
                                            $("#pwdCheck-resultBox").text("비밀번호가 일치하지않습니다");
                                            // $("#pwdCheck").select();
                                        }
                                }else{
                                    $("#pwdCheck-resultBox").css("color","#8a909d");
                                    $("#pwdCheck-resultBox").text("입력한 비밀번호와 동일한 비밀번호를 입력하세요.")
                                }
        
                            }
        
                            $(function(){
                                $("#userPWd").keyup(function(){

                                    if($("#userPWd").val().length > 5){
                                        chkPW();
                                    }else{
                                        $("#pwd-td .text-daborder-danger span").removeClass("mdi-check-all");
                                        $("#pwd-td .text-daborder-danger span").addClass("mdi-check")
                                        $("#pwd-td .text-daborder-danger span").css("color","#8a909d");
                                        $("#pwd-td .text-daborder-danger").css("color","#8a909d");
                                    }
                                })

                                $("#pwdCheck").keyup(function(){
                                    pwdEqualCheck();
                                })

                                $("#userId").keyup(function(){
                                    
                                    if($("#userId").val().length > 3){
                                        idCheck();
                                    }else{
                                        idResult.css("color","#8a909d");
                                        idResult.text("아이디는 필수 입력 사항입니다.");
                                    }
                                })       

                            })


        
                        </script>


                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    이름
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding: 10px;">
                                    <input type="text" name="" class="form-control" placeholder="이름을 입력하세요"  style="width:100%;" >                        
                                </div>
                            </td>
                        </tr> 
            
            
                        <tr>
                            <th>
                                <div class="align-center" >
                                    <span class="redMark">*</span>
                                    이메일
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:50%; padding:5px 10px; display: flex; flex-wrap: nowrap;">
                                    <input type="email" class="form-control" name="" placeholder="이메일을 입력하세요"  style="width:40%;" >                        
                                    <button type="button" id="verificationBtn" class="mb-1 btn btn-outline-primary" data-toggle="modal" data-target="#verificationModal" style="margin: 5px;">본인인증</button>
        
                                    <!-- 모달 -->
                                    <div class="modal fade" id="verificationModal" tabindex="-1" role="dialog" aria-labelledby="verificationModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="verificationModalLabel">본인 인증</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">×</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" style="text-align: center; color: black;">
                                                <form action="" method="">
                                                    <div style="width: 80%; padding: 10px; margin: 0 auto;">
                                                        <input type="text" name="" value="입력한이메일" readonly class="form-control" style="width:60%; float:left;">
                                                        <button type="button" class="btn btn-outline-primary">인증코드 발송</button> 
                                                        <div id="identity-resultBox" style="margin-left: 10px; width: 100%; height: 50px; padding: 10px 0px;">
                                                            <span style="display: block; float: left;">입력한 이메일로 인증코드를 발송하였습니다.</span>
                                                        </div>
                                                        <p style="float:right;">유효시간 5:00</p>
                                                        <input type="text" name="" class="form-control" placeholder="인증코드를 입력하세요" style="width:100%; float:left;">
                                                    </div>
                                                </form>
                                            <br>
                                            </div>
                                            <div class="modal-footer">
                                            <button type="button" class="btn btn-danger btn-pill btn-block" data-dismiss="modal" disabled>확인</button>
                                            </div>
                                        </div>
                                    </div>
                                        <!--모달 끝-->                   
        
                                    <div class="text-daborder-danger small mt-1" style="margin-left: 10px; width: 100%;">
                                        인증할 수 있는 이메일을 입력하세요
                                    </div>
                                </div>
                            </td>
                        </tr>
        
                        <tr>
                            <th>
                                <div class="align-center">
                                    생년월일
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding: 10px;">
                                    <input type="date" name="" class="form-control">
                                </div> 
                            </td>
                        </tr>
        
        
                        <tr>
                            <th>
                                <div class="align-center">
                                    연락처
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:40%; padding: 10px;">
                                    <input type="phone" name="" class="form-control" placeholder="연락처를 입력하세요"  style="width:100%;" >                        
                                </div>                        
                                <div class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left">
                                        - 없이 숫자만 입력하세요
                                </div>
                            </td>
                        </tr>
                        <script  src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
        
                            function selectZipcode() {
        
        
                                new daum.Postcode({

                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var addr = ''; // 주소 변수
                                    var extraAddr = ''; // 참고항목 변수

                                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                        addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                        addr = data.jibunAddress;
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('zipcode').value = data.zonecode;
                                    document.getElementById("address").value = addr;
                                    // 커서를 상세주소 필드로 이동한다.
                                    document.getElementById("detailAddress").focus();
                                }
                            }).open({
                                popupTitle: '우편번호 검색'
                                // ,theme: themeObj
                                });
                            }
                        </script>        
                        <tr>
                            <th>
                                <div class="align-center">
                                    주소
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding-left: 10px; padding-top: 10px; padding-bottom: 5px; display:flex; flex-wrap: nowrap; ">
                                    <input type="text" id="zipcode" placeholder="우편번호" style="width: 20%;" class="form-control">
                                    <button id="zipcodeBtn" type="button" class="btn btn-outline-primary" onclick="selectZipcode();" style="width: 35%;">우편번호 검색</button><br>
                                </div>
                                <div class="input-group" style="width:80%; padding-left: 10px; padding-bottom: 10px;">
                                    <input type="text" id="address" placeholder="주소" style="width: 40%;" class="form-control">
                                    <input type="text" id="detailAddress" placeholder="상세주소" style="width: 40%;" class="form-control">
                                </div>                        
                            </td>
                        </tr>
                        


        
                        
						<c:if test="${ m.sort eq 3 }">
	                        <tr>
	                            <th colspan="2">
	                                <div class="align-center">
	                                    <span class="redMark">*</span>
	                                    수강과목
	                                </div>
	                            </th>
	                        </tr>
	                        <tr>
	                            <td colspan="2">
	                                <table id="subjectList" width="100%" style="text-align: center;">
	                                    <tr>
	                                        <td>과목명</td>
	                                        <td>정원</td>
	                                        <td>신청인원</td>
	                                        <td>수강일자</td>
	                                        <td>선택</td>
	                                    </tr>
	                                    <tr>
	                                        <td>자바의정석</td>
	                                        <td>10</td>
	                                        <td>8</td>
	                                        <td>20XX.XX.XX ~ 20XX.XX.XX</td>
	                                        <td>
	                                            <input type="radio" name="subject-choice">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>자바의정석</td>
	                                        <td>10</td>
	                                        <td>8</td>
	                                        <td>20XX.XX.XX ~ 20XX.XX.XX</td>
	                                        <td>
	                                            <input type="radio" name="subject-choice">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>자바의정석</td>
	                                        <td>10</td>
	                                        <td>8</td>
	                                        <td>20XX.XX.XX ~ 20XX.XX.XX</td>
	                                        <td>
	                                            <input type="radio" name="subject-choice">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>자바의정석</td>
	                                        <td>10</td>
	                                        <td>8</td>
	                                        <td>20XX.XX.XX ~ 20XX.XX.XX</td>
	                                        <td>
	                                            <input type="radio" name="subject-choice">
	                                        </td>
	                                    </tr>
	                                </table>
	                            </td>
	                        </tr>
						</c:if>
                    </table>
                    <div class="btn-center">
                        <button class="btn btn-primary btn-pill mr-2" type="submit" onsubmit="submitForm();">가입</button>
                        <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
                    </div> 
                </form>

                <script>
                    function submitForm(){
                        if(idFlag && pwdFlag && agreeFlag && verifiedFlag){

                            return true;
                            
                        }else{

                            return false;
                        }
                    }
                </script>

            </div>
            
        
        </div>


    </div>



	 <jsp:include page="../common/footer.jsp"/>




</body>
</html>