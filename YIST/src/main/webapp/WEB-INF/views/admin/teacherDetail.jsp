<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="navbar-fixed sidebar-fixed" id="body">
<script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
</script>

<jsp:include page="common/header.jsp"/>
<div class="card card-default">
		<div class="card-header">
			<h2>강사 정보 및 수정</h2>
		</div>
		
		<div class="card-body" align="center">
	    	<div class="card card-profile" style='border:none;'>
	    		<div align='center'>
		    		<div class="card-header-bg" style="background-image:url(assets/img/user/user-bg-01.jpg)"></div>
		    			<div class="card-body card-profile-body">
		    				<div class="profile-avata">
					          <img class="rounded-circle" src="${ td.image }" width=30% height=30%>
					          <span class="h5 d-block mt-3 mb-2">${ td.name }</span>
					        </div>
	    			</div>
    			</div>
   			</div>
   			
   			<div class="card-footer card-profile-footer">
		        <ul class="nav nav-border-top justify-content-center">
		          <li class="nav-item">
		            <a class="nav-link active" href="teacherDetail.do?id=${ td.id }">프로필</a>
		          </li>
<%-- 		          <li class="nav-item">
		            <a class="nav-link" href="teacherDetail-lecture.do?id=${ td.id }&subject=${td.subject}">강의</a>
		          </li>
 --%>		        </ul>
      		</div>
      		
      		<br>
      		
      		<div>
      			<form action="" method="post">
      				<div class="profile-container">
      					<div class="row">
      						<div class="input-group mb-3 col-6">
      							<div class="input-group-prepend">
                            		<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                           		 </div>
                           		 <input type="text" class="form-control" placeholder="UserId" name="id" aria-describedby="basic-addon1" value="${ td.id }" readonly>
      						</div>
      					</div>
      				</div>
      				
      					<div class="row">
                        	<div class="input-group mb-3 col">
                            	<div class="input-group-prepend">
                            		<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            	</div>
                            <input type="text" class="form-control" placeholder="Username" name="name" aria-describedby="basic-addon1" value="${ td.name }" required>
                        </div>

                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            	<span class="input-group-text" id="basic-addon1">전화번호</span>
                        	</div>
                            <input type="text" class="form-control" placeholder="phone" name="phone" aria-describedby="basic-addon1" value="${ td.phone }" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">입사일자</span>
                            </div>
                            <input type="date" class="form-control" aria-label="Username" aria-describedby="basic-addon1" value="${ td.employeeDate }" required>
                        </div>

                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;이메일&nbsp;&nbsp;</span>
                            </div>
                            <input type="email" class="form-control" name="email" aria-describedby="basic-addon1" value="${ td.email }" required>
                        </div>
                    </div>

                  <%--   <div class="row">
                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            	<span class="input-group-text" id="basic-addon1">담당과목</span>
                            </div>
                           	<input type="text" class="form-control" name="subject" value="${ td.subject }" readonly style="border:none;">
                        </div>
                    </div> --%>

                    <div class="row">
                      <div class="input-group mb-3 col-10">
                          <div class="input-group-prepend">
                          	<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</span>
                          </div>
                          <input type="text" class="form-control" name="address" value="${ td.address }" aria-describedby="basic-addon1">
                      </div>
                  </div>

                    <div class="row">
                        <div class="col-12" align="right">
                            <button type="submit" class="btn btn-sm btn-primary" id="changeInfo" style="margin-right: 15px;">수정</button>
                        </div>
                    </div>
      			</form>
      		</div>
   			
		</div>
</div>

<script>
	$(function(){
		$("#changeInfo").click(function(){
			$.ajax({
				url:"changeTeacherInfo.do",
				data:{
					  id: $("input[name='id']").val(),
					  name: $("input[name='name']").val(),
					  phone: $("input[name='phone']").val(),
					  email:$("input[name='email']").val(),
					  address:$("input[name='address']").val()
					},
				success:function(result){
					alert("정보수정 완료!");
				},
				error:function(){
					console.log("정보수정 ajax 통신 실패!");
				}	
				
			})	
		})
		
	})
		
	
	
</script>

</body>
</html>