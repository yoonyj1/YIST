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
    border-bottom: 1px solid #dae0e9;
  }

  th {
    background-color: #f2f5f9;
    font-weight: bold;
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
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 0px;
  background-color: white;
}

button {
  background-color: #828282;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  color: #eeeeee;
  padding: 6px 20px 8px;
}

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>

	<div class="container">
	    <div class="sub08_title">
	      <ul style="text-align: center; margin-top: 40px">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">내 정보</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	        <p class="join_necessary" style="clear:both; margin-bottom:12px; text-align: right; color: red;">*표시는 필수입력 항목입니다.</p>
	      </ul>
	    </div> 
	    <form action="update.st" method="post">
	    <div class="entry-content">
	      <table>
	          <tr style="border-top: 1px solid black;">
	            <th width="20%">아이디*</th>
	            <td width="60%" style="text-align: left;">
	              <input type="text" class="form-control" id="" name="id" value="${ loginUser.id }" readonly>
	            </td>
	            <th rowspan="4"><img src="${ loginUser.image }" name="image" alt="프로필 사진"></th>
	          </tr>
				<tr>
				  <th>비밀번호*</th>
				  <td style="text-align: left;">
				    <input type="password" class="form-control" id="pwd" name="pwd" value="" placeholder="8 ~ 15 자의 영문 대소문자, 숫자, 특수문자를 조합하여 설정해 주세요." oninput="validatePassword();">
				    <div class="invalid-feedback" id="password-error"></div>
				  </td>
				</tr>
				<tr>
				  <th>비밀번호 확인*</th>
				  <td style="text-align: left;">
				    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" value="" placeholder="입력한 비밀번호와 동일한 비밀번호를 입력하세요." oninput="validatePassword();">
				    <div class="invalid-feedback" id="confirm-password-error"></div>
				  </td>
				</tr>
	          <tr>
	            <th>이름*</th>
	            <td style="text-align: left;">
	              <input type="text" class="form-control" id="" name="name" value="${ loginUser.name }">
	            </td>
	          </tr>
			<tr>
			  <th>휴대폰</th>
			  <td style="text-align: left;" colspan="2">
			    <input type="text" class="form-control" id="phone" name="phone" value="${ loginUser.phone }" style="width: 61%;">
			  </td>
			</tr>
	          <tr>
	            <th>이메일 주소</th>
	            <td style="text-align: left;" colspan="2">
	              <input type="text" class="" name="email" id="userEmail1" value="${ loginUser.email }" style="width: 30%;" aria-describedby="mail-check-warn">
	              <input type="text" class="mail-check-input" id="mail-check-input" name="mail-check-input" style="width: 30%;" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
	              <button type="button" class="common_btn2" id="mail-Check-Btn" style="font-size: 14px; height: 35px; margin-left: 5px; color: #eeeeee;">인증하기</button>
	              <button type="button" class="common_btn2" id="mail-Check-Btn1" style="font-size: 14px; height: 35px; margin-left: 5px; color: #eeeeee;">확인</button><br>
	              <span id="mail-check-warn"></span>
	            </td>
	          </tr>
	          
	          <tr>
	            <th>생년월일</th>
	            <td style="text-align: left;" colspan="2">
	            	<input type="date" name="birth" class="form-control" style="width: 61%;" 
       				value="${loginUser.birth.substring(0,4)}-${loginUser.birth.substring(5,7)}-${loginUser.birth.substring(8,10)}">
	            </td>
	          </tr>
	          <tr>
	            <th>주소</th>
	            <td style="text-align: left;" colspan="2">
	              <input type="text" id="city" name="post" value="${ loginUser.post }" style="width: 61%;">
	              <button type="button" class="common_btn2" id="findAddress" style="font-size: 14px; height: 35px; margin-left: 5px; color: #eeeeee;" onclick="fnFindAddress();">주소검색</button><br>
	              <input type="text" id="city" name="address" value="${ loginUser.address }" style="width: 61%; margin-top:5px;"><br>
	              <input type="text" id="address_etc" name="detailAddress" value="${ loginUser.detailAddress }" style="width:61%; margin-top:5px;" >
	              </td>
	          </tr>
	        </tbody>
	      </table>
	      <ul style="text-align: center; margin: 40px;">
	        <li>
	          <button type="submit" class="btn btn-default btn-theme-colored btn-circled">정보수정</button>
	          <a href="#" class="btn btn-dark btn-theme-colored btn-circled">수강포기</a>
	        </li>
	      </ul>
	    </div>       
	    </form>
  </div>


	<!-- 비밀번호 유효성 검사 -->
	<script>
	
	const reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
	
	function validatePassword() {
	  const password = document.getElementById("pwd");
	  const confirmPassword = document.getElementById("confirmPassword");
	  const passwordError = document.getElementById("password-error");
	  const confirmPasswordError = document.getElementById("confirm-password-error");
	  
	  // 비밀번호 유효성 검사
	  if (!reg.test(password.value)) {
		passwordError.innerHTML = "<span style='color:red;'>8 ~ 15 자의 영문 대소문자, 숫자, 특수문자를 조합하여 설정해 주세요.</span>";
	    password.classList.add("is-invalid");
	  } else {
	    passwordError.innerHTML = "";
	    password.classList.remove("is-invalid");
	  }
	
	  // 비밀번호 확인 일치 여부 확인
	  if (confirmPassword.value !== "" && password.value !== confirmPassword.value) {
	    confirmPasswordError.innerHTML = "<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>";
	    confirmPassword.classList.add("is-invalid");
	  } else {
	    confirmPasswordError.innerHTML = "";
	    confirmPassword.classList.remove("is-invalid");
	  }
	}
	</script>

	<!-- 이메일 인증 -->
	<script>
	
	$(function() {
		
		let code;
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
		$("#mail-Check-Btn").on("click", function() {
			
			const email = $('#userEmail1').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			
			$("#mail-check-warn").css("color", "#ff8932").text("이메일이 전송되었습니다.");
			
			$.ajax({
				type : 'get',
				url : 'mailCheck',
				data: { email: email }, // 전송할 데이터 객체
				success : function (data) {
					console.log("data : " +  data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.');
				},
				error: function() {
                    console.log("이메일 전송 실패");
                  }
			});
		}); 
		
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$("#mail-Check-Btn1").on("click", function() {
			const inputCode = $('#mail-check-input').val();
			const $resultMsg = $("#mail-check-warn");
			console.log(inputCode);
			if(inputCode === code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#userEmail1').attr('readonly',true);
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
	});
	</script>
	
  <jsp:include page="common/footer.jsp"/>
</body>
</html>