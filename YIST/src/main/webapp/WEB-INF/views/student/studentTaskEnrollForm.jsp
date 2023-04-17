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

</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
	<div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">우리반 게시판</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    
	  <form method="post">
		  <textarea id="summernote" name="editordata"></textarea>
	</form>
	  <script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
	          height: 500,                 // 에디터 높이
	          width: 1000,
	  		  minHeight: null,             // 최소 높이
	  		  maxHeight: null,             // 최대 높이
	  		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  		  lang: "ko-KR",					// 한글 설정
	  		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	    });
	    });
	  </script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>