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
			<h2>학생 정보 및 수정</h2>
		</div>
		
		<div class="card-body" align="center">
	    	<div class="card card-profile" style='border:none;'>
	    		<div align='center'>
		    		<div class="card-header-bg" style="background-image:url(assets/img/user/user-bg-01.jpg); height:80px"></div>
		    			<div class="card-body card-profile-body">
		    				<div class="profile-avata">
					          <img class="rounded-circle" src="${ sd.image }" width=30% height=30%>
					          <span class="h5 d-block mt-3 mb-2">${ sd.name }</span>
					        </div>
	    			</div>
    			</div>
   			</div>
   			
   			<div class="card-footer card-profile-footer">
              <a class="nav-link active" disabled>프로필</a>
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
	                            <input type="text" class="form-control" placeholder="UserId" aria-label="Username" aria-describedby="basic-addon1" value="${ sd.id }" readonly>
	                        </div>
	                    </div>
      				
   					 	<div class="row">
	                        <div class="input-group mb-3 col">
	                            <div class="input-group-prepend">
	                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp; 이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
	                            </div>
	                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" value="${ sd.name }" required>
	                        </div>
	
	                        <div class="input-group mb-3 col">
	                            <div class="input-group-prepend">
	                            <span class="input-group-text" id="basic-addon1">전화번호</span>
	                            </div>
	                            <input type="text" class="form-control" placeholder="phone" aria-label="Username" aria-describedby="basic-addon1" value="${ sd.phone }" required>
	                        </div>
                    	</div>
                    
                    <div class="row">
                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">수강과목</span>
                            </div>
                            <input type="text" style="width: 500px; border:none;" value="&nbsp;&nbsp;${ sd.subject }" readonly disabled>
                        </div>
                    </div>

                     <div class="row">
                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">수강일자</span>
                            </div>
                            <input type="date" class="form-control" aria-label="Username" aria-describedby="basic-addon1" value="${ sd.startDate }" disabled>
                        </div>

                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;이메일&nbsp;&nbsp;</span>
                            </div>
                            <input type="email" class="form-control" aria-label="email" aria-describedby="basic-addon1" value="${ sd.email }" required>
                        </div>
                    </div>


                    <div class="row">
                      <div class="input-group mb-3 col-10">
                          <div class="input-group-prepend">
                          	<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</span>
                          </div>
                          <input type="text" class="form-control" aria-label="address" aria-describedby="basic-addon1" value="${ sd.address }">
                      </div>
                  </div>

                    <div class="row">
                        <div class="col-12" align="right">
                            <button type="submit" class="btn btn-sm btn-primary" style="margin-right: 15px;">수정</button>
                        </div>
                    </div>
      			</form>
      		</div>
   			
		</div>
</div>

</body>
</html>