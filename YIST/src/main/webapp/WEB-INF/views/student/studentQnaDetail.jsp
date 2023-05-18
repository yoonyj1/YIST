<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	      <ul style="text-align: center; margin-top: 40px">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">Q & A</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	      </ul>
	    </div> 
	    <div align="right">
	      <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
	        <a class="btn btn-primary" onclick="goModifyForm()">수정하기</a> <!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
	        <a class="btn btn-danger" onclick="goDelete()">삭제하기</a>
	    </div>
	   </c:if>
	   <form>
	   	<input type="hidden" name="boardNo" value="${q.boardNo}">
	   </form>
	  
	    <div class="entry-content">
	      <table id="contentArea" align="center" class="table" style="margin-top: 10px;">
	        <tr>
	            <th style="text-align: center;">제목</th>
	            <td colspan="3" style="text-align: left;">자습실 이용시 주의사항</td>
	        </tr>
	        <tr>
	            <th width="10%" style="text-align: center;">작성자</th>
	            <td width="40%" style="text-align: left;">이유나</td>
	            <th width="10%" style="text-align: center;">작성일</th>
	            <td width="40%" style="text-align: left;">2023-03-27</td>
	        </tr>
	        <tr>
	            <td colspan="4">
	              <div style="padding: 50px; font-size: 18px; line-height: 2;">
	                <p style="height:auto">
	                  코로나19로 인한 정부지침으로 교육원 내 취식을 금지합니다. <br>
	                  ※ ​ 감염병예방법 제49조(감염병의 예방조치), 제83조(과태료) <br>
	                  최근 KH정보교육원1관 5층 자습실에서 일부 훈련생분들이 음식 취식을 하는 경우가 있습니다. <br>
	                  교육원에서 취식하는 경우 방역 수칙 위반에 해당되므로, 교육원에서 취식을 삼가해주시길 바랍니다. <br>
	                  코로나19로 인한 정부지침으로 교육원 내 취식을 금지합니다. <br>
	                  ※ ​ 감염병예방법 제49조(감염병의 예방조치), 제83조(과태료) <br>
	                  최근 KH정보교육원1관 5층 자습실에서 일부 훈련생분들이 음식 취식을 하는 경우가 있습니다. <br>
	                  교육원에서 취식하는 경우 방역 수칙 위반에 해당되므로, 교육원에서 취식을 삼가해주시길 바랍니다. <br>
	                  코로나19로 인한 정부지침으로 교육원 내 취식을 금지합니다. <br>
	                  ※ ​ 감염병예방법 제49조(감염병의 예방조치), 제83조(과태료) <br>
	                  최근 KH정보교육원1관 5층 자습실에서 일부 훈련생분들이 음식 취식을 하는 경우가 있습니다. <br>
	                  교육원에서 취식하는 경우 방역 수칙 위반에 해당되므로, 교육원에서 취식을 삼가해주시길 바랍니다. <br>
	                  * 단 물, 음료 섭취는 허용
	              </p>
	              </div>
	            </td>
	        </tr>
	    </table>
	    
	    <table id="replyArea" class="table" align="center" style="margin: 0; border-top: 1px solid #dae0e9;">
	      <thead>
	        <tr>
	          <th colspan="4" style="font-size: 10px; text-align: left; height: 10px;">
	            등록통신예절에 어긋나는 글이나 상업적인 글, 타 사이트에 관련된 글은 관리자에 의해 사전 통보없이 삭제될 수 있습니다.
	          </th>
	        </tr>
	        <tr>
	            <th colspan="3">
	                <textarea placeholder="댓글을 입력해주세요."  class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
	                <textarea placeholder="답댓글을 입력해주세요."  class="form-control" name="" id="content_reply" cols="55" rows="2" style="resize:none; width:100%; display:none"></textarea>
	            	<input type="hidden" id="hideRefRnoValue">
	            </th>
	            <th style="vertical-align: middle; text-align: center;">
	              <button type="button" class="btn btn-default" style="height: 100%; width: 100%; background-color: #e6f4fd;" id="reply_btn" onclick="addReply()">등록하기</button>
	             <button type="button" class="btn btn-default" style="height: 100%; width: 100%; background-color: #e6f4fd; display:none" id="re_reply_btn" onclick="addReReply()">답댓글 등록하기</button>
	            
	            </th>
	        </tr>
	      </thead>
	      <tbody>
	          <tr>
	              <th style="text-align: center;">user02</th>
	              <td style="text-align: left;">댓글입니다.너무웃기다앙</td>
	              <td>2023-03-03</td>
	          </tr>
	          <tr>
	              <th style="text-align: center;">user01</th>
	              <td style="text-align: left;">많이봐주세용</td>
	              <td>2023-01-08</td>
	          </tr>
	          <tr>
	              <th style="text-align: center;">admin</th>
	              <td style="text-align: left;">댓글입니다ㅋㅋㅋ</td>
	              <td>2022-12-02</td>
	          </tr>
	      </tbody>
	     </table>
	     <div style="text-align: center; margin: 50px;">
	      <a href="#" class="btn btn-gray btn-theme-colored btn-circled"><i class="fa fa-home"></i> 목록으로</a>
	    </div> 
    </div>  
  </div>
  
  
  	<!-- 댓글 -->
  	<script>
  	
	
    	$(function() {
			selectReplyList(); // 화면이 랜더링 되자마다 댓글 조회를 하겠다
		})
		
		var content = document.getElementById('content')
		var reContent = document.getElementById('content_reply')
		var replyBtn = document.getElementById('reply_btn')
		var reReplyBtn = document.getElementById('re_reply_btn')
		
		function addReply() { // 댓글작성용 ajax
    		console.log("댓글")
			if ($("#content").val().trim().length != 0) { // 유효한 댓글 작성시 => insert ajax 요청
				
				$.ajax({
					url: "rinsert.bo",
					data: {
						boardNo: ${ q.boardNo},
						replyContent: $("#content").val(),
						replyWriter: '${ loginUser.id }' // 문자열은 이렇게 묶어야함
					}, 
					success: function(status) {
						if (status == "success") {
							selectReplyList(); // 등록 버튼 클릭시 리스트 조회
							$("#content").val(""); // 댓글창에 작성한 댓글 초기화
						}
					},
					error: function() {
						console.log("댓글 작성용 ajax 통신 실패!");
					}
				})
			} else {
				alertify.alert("댓글 작성 후 등록 요청해주세요!");
			} 
		}
  	
	
		function addReReply() { // 대댓글작성용 ajax
			console.log("대댓글")
		if ($("#content_reply").val().trim().length != 0) { // 유효한 댓글 작성시 => insert ajax 요청
			
			$.ajax({
				url: "rereplyinsert.bo",
				data: {
					boardNo: ${ q.boardNo},
					refRno : $("#hideRefRnoValue").val(),
					replyContent: $("#content_reply").val(),
					replyWriter: '${ loginUser.id }' // 문자열은 이렇게 묶어야함
				}, 
				success: function(status) {
					if (status == "success") {
						selectReplyList(); // 등록 버튼 클릭시 리스트 조회
						$("#content_reply").val(""); // 댓글창에 작성한 댓글 초기화
					}
				},
				error: function() {
					console.log("댓글 작성용 ajax 통신 실패!");
				}
			})
		} else {
			alertify.alert("댓글 작성 후 등록 요청해주세요!");
		} 
	}
		
		function selectReplyList() { // 해당 게시글에 달린 댓글리스트 조회용 ajax
			$.ajax({
				url: "rlist.bo",
				data: {qno: ${ q.boardNo }},
				success: function(list) {
					//console.log(list);
					
					let value = "";
					
					for ( let i in list) {
						console.log(list[i].refRno>0)
						if(list[i].refRno > 0){
							value += "<tr>"
								 + "<th style='text-align: center;'> ㄴ " + list[i].replyWriter + "</th>"
								   + "<td style='text-align: center;'>" + list[i].replyContent + "</td>"
								   + "<td style='text-align: center;'>" + list[i].replyDate + "</td>"
								   + "<th style='text-align: center;'></th>"
								   + "</tr>";
						}else{
							value += "<tr>"
								   + "<th style='text-align: center; width: 15%'>" + list[i].replyWriter + "</th>"
								   + "<td style='width: 55%'>" + list[i].replyContent + "</td>"
								   + "<td style='width: 15%'>" + list[i].replyDate + "</td>"
								   + "<td><button style='height: 100%; width: 50%; background-color: #e6f4fd;' onclick='reReply("+ list[i].replyNo+")' >답댓글</button><button style='height: 100%; width: 50%; background-color: #e6f4fd;' onclick='reReplyCancel()' >취소</button></td>"
								   + "</tr>";	
							
						}
					
					}
					
					$("#replyArea tbody").html(value);
				},
				error: function() {
					console.log("댓글 리스트 조회용 ajax 통신 실패!");
				}
			});
		}
		
		function reReply(e){
			document.getElementById('hideRefRnoValue').value = e
			if(reContent.style.display = 'none'){
				content.style.display = 'none';
				reContent.style.display = 'block'
				replyBtn.style.display = 'none';
				reReplyBtn.style.display = 'block';
			}else{
				content.style.display = 'block';
				reContent.style.display = 'none'
				replyBtn.style.display = 'block';
				reReplyBtn.style.display = 'none';
			}
		}
		
		function reReplyCancel(){
				content.style.display = 'block';
				reContent.style.display = 'none'
				replyBtn.style.display = 'block';
				reReplyBtn.style.display = 'none';
			
		}
		
		function goModifyForm(){
			location.href = 'qnaModify.st?qno='+	${q.boardNo}
		}
		
		function goDelete(){
			var confirm =  window.confirm('QnA를 삭제하시겠습니까?')
			if(confirm){
				var form = document.querySelector('form')
				form.action = 'deleteQna.st'
				form.submit();
			}
		
		}

		
    </script>
  <jsp:include page="common/footer.jsp"/>
</body>
</html>