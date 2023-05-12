<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
    border: 1px solid #c4c4c4;
  }

  th {
    background-color: #eee;
    font-weight: bold;
    font-size: 18px;
  }
  
  td {
    font-size: 15px;
  }

form {
  display: flex;
  justify-content: center;
}

select, input{
  text-align: center;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  background-color: #9cd3f4;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px;">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">과제</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    <div style="text-align: right;">
      <a href="#" class="btn btn-dark btn-circled" style="width: 90px;">답글</a>
    </div>
    <div class="entry-content">
      <table id="contentArea" align="center" class="table" style="margin-top: 10px;">
        <tr>
            <th style="text-align: center;">제목</th>
            <td colspan="3" style="text-align: left;">${ t.taskTitle }</td>
        </tr>
        <tr>
            <th width="10%" style="text-align: center;">작성자</th>
            <td width="40%" style="text-align: left;">${ t.id }</td>
            <th width="10%" style="text-align: center;">작성일</th>
            <td width="40%" style="text-align: left;">${ t.startDate }</td>
        </tr>
        <tr>
            <td colspan="4">
              <div style="padding: 50px; font-size: 18px; line-height: 2;">
              	<img alt="" src="">
                <p style="height:auto">${ t.taskContent }</p>
              </div>
            </td>
        </tr>
    </table>
    
		    <!-- 답글 없을때만 -->
		    	<%-- <div style="text-align: right;">
		    		<c:choose>
		    			<c:when test="${t.submit_Status eq 'N'}">
			      			<a href="enrollForm.st?taskNo=${t.taskNo}&studentId=${loginUser.id}" id="reply-btn" class="btn btn-dark btn-circled" style="width: 90px;">답글</a>
		    			</c:when>
						<c:otherwise>
							<button class="btn btn-dark btn-circled" style="width: 90px;" disabled>답글</button>
						</c:otherwise>    			
		    		</c:choose>
		    	</div> --%>
		    <div class="entry-content">
		    <form id="tx_editor_form" name="tx_editor_form" action="" method="post" enctype="multipart/form-data">
		    	 <input type="hidden" name="taskNo" value="${t.taskNo}">
		    	 <input type="hidden" name="studentId" value="${t.studentId}">
			      <table id="contentArea" align="center" class="table" style="margin-top: 10px;">
			        <tr>
			            <th style="text-align: center;">제목</th>
			            <td colspan="3" style="text-align: left;">${ t.taskContent }</td>
			        </tr>
			        <tr>
			            <th width="10%" style="text-align: center;">작성자</th>
			            <td width="40%" style="text-align: left;">${ t.id }</td>
			            <th width="10%" style="text-align: center;">작성일</th>
			            <td width="40%" style="text-align: left;">${ t.startDate }</td>
			        </tr>
			        <tr>
			            <td colspan="4">
			              <div style="padding: 50px; font-size: 18px; line-height: 2;">
			              	<c:choose>
			              		<c:when test="${t.changeName ne 'none'}">
					              	<img alt="" src="${t.changeName}">
			              		</c:when>
			              		<c:otherwise>
					                <p style="height:auto">${ t.taskContent }</p>
			              		</c:otherwise>
			              	</c:choose>
			              </div>
			            </td>
			        </tr>
			        <tr>
						<td colspan="4">
							<textarea id="summernote" name="submitContent" style="align: center;">${t.submitContent}</textarea>
						</td>
					</tr>
					<tr>
						<td id="btn-panel" colspan="4">
						<c:choose>
							<c:when test="${empty t.submitContent}">
								<button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="accessForm('insert');">등록하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="accessForm('update');">수정하기</button>
								<button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="accessForm('delete');">삭제하기</button>
							</c:otherwise>	
						</c:choose>
					</tr>
			    </table>
		    </form>
     <div style="text-align: center; margin: 50px;">
      <a href="boardList.st" class="btn btn-gray btn-theme-colored btn-circled"><i class="fa fa-home"></i> 목록으로</a>
    </div> 
    </div>       
  </div>
  
  <script>
  	function accessForm(param){
  		let url = "";
  		
  		if (param == "insert"){
  			url = "taskInsert.st";	
  		} else if(param == "update"){
  			url = "updateTask.st";
  		} else {
  			url = "deleteTask.st";
  		}
  		
  		$("#tx_editor_form").attr("action", url).submit();
  	}
  
  	$(function(){
  		let today = new Date();
  		let endDate = new Date('${t.endDate}');
  		
  		console.log($(".reply-btn").html());
  		
  		console.log("오늘 : " + today.getTime());
  		console.log("마감 : " + endDate.getTime());
  		
  		if (today.getTime() > endDate.getTime()){
  			console.log("비활성화");
  			//$("#reply-btn").attr("disabled", true);
  			$('#summernote').summernote('disable');
  			$('#btn-panel').hide();
  		}
  		
  		
  	});
  	
  	$(document).ready(function(){
  		$('#summernote').summernote({
        	height: 500,                 // 에디터 높이
  		    minHeight: null,             // 최소 높이
  		    maxHeight: null,             // 최대 높이
  		    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
  		    lang: "ko-KR"					// 한글 설정
		});
  	})
  </script>

  
  <jsp:include page="common/footer.jsp"/>

</body>
</html>