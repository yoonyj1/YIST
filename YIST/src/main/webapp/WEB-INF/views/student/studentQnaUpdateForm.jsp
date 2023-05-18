<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
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
    text-align: center;
    border: 1px solid #dae0e9;
  }
  th {
    background-color: #eee;
    font-weight: bold;
  }
  
  tr td:nth-child(3):hover {
  background-color: #9cd3f4;
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
#summernote {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>

	<div class="container" >

		<div class="sub08_title">
	      <ul style="text-align: center; margin-top: 40px">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">우리반 게시판</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	      </ul>
	    </div> 

    <div>
	    <form id="tx_editor_form" name="tx_editor_form" action="updateQna.st" method="post" enctype="multipart/form-data">
			<table id="write_frm">
			
					<tr>
						<th width="25%">제목</th>
						<td>
							<input type="text" id="title" name="boardTitle" style="width: 100%; height: 40px; text-align: left;" value="${q.boardTitle}">
							<input type="hidden" name="boardNo" value="${q.boardNo}"/>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td style="text-align: left;"><input type="text" id="writer" name="boardWriter" value="${ loginUser.id }" readonly></td>
					</tr>
					<tr>
						<th style="height: 70px;">카테고리</th>
						<td style="text-align: left;">
							<select id="category_select" name="category" class="select_view" value="" style="width: 158px; height:40px;">
								<option value="A">QnA</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						  <textarea id="summernote" name="boardContent" style="align: center;">${ q.boardContent }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-gray btn-theme-colored btn-circled">수정하기</button>
							<button type="reset" class="btn btn-gray btn-theme-colored btn-circled" onclick="javascript:history.back();">취소하기</button>
						</td>
					</tr>
			</table>
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
	    	$('#summernote').summernote({
	        	height: 500,                 // 에디터 높이
	            width: 1200,
	  		    minHeight: null,             // 최소 높이
	  		    maxHeight: null,             // 최대 높이
	  		    focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  		    lang: "ko-KR",					// 한글 설정
			});
		});
	</script>

	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>