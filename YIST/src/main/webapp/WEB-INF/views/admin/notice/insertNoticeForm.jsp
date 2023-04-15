<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-공지사항등록</title>


<style>
	div.card-body #addNotice-table{
          width: 75%;
          margin-left: auto; margin-right: auto;
	}

	div.card-body #addNotice-table th{
          text-align: center;
          vertical-align: middle;
          color: black;
	}


	div.card-body #addNotice-table td>input,
	div.card-body #addNotice-table td>select{
          vertical-align: middle;
	}

	div.card-body #addNotice-table td>label{
          margin-right: 5px;
	}

</style>



</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="../common/header.jsp"/>


	<script>

        $(document).ready(function(){
          $('.summernote').summernote({
            // 에디터 높이
            height: 750,
            // 에디터 한글 설정
            lang: "ko-KR",
            // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
            focus : true,
            toolbar: [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor','color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert',['picture','link','video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview','fullscreen', 'help']]
              ],
              // 추가한 글꼴
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            // 추가한 폰트사이즈
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          });
        })
        
	</script>

	<div class="card card-default">
		<div class="card-header">
			<h2>공지사항 등록</h2>
		</div>

		<div class="card-body">
			<form method="post" action="">
				<table class="table table-bordered" id="addNotice-table">
                    
                    <tr>
                      <th>제목</th>
                      <td>
                        <div class="input-group mb-3">
                          <input type="text" name="noticeTitle" class="form-control" placeholder="제목을 입력하세요">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <th>읽기권한</th>
                      <td>
                        <div class="form-group" style="width: 30%;">
                          <select name="view" class="js-example-basic-multiple form-control" required>
                            <option value="3">전체</option>
                            <option value="2">강사</option>
                            <option value="1">운영자</option>
                          </select>
                        </div>
                      </td>

                    </tr>

                    <tr>
                      <th colspan="2" style="width: 100%;">
                        <textarea name="noticeContent" id="materialSummer" class="summernote" style="width: 100%;"></textarea>
                      </th>
                    </tr>

                    <tr>
                      <th>첨부파일</th>
                      <td><input type="file" name="" id=""></td>
                    </tr>

				</table>
				
				<div class="btn-center">
                    <button class="btn btn-primary btn-pill mr-2" type="submit">등록</button>
                    <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
				</div>
				
			</form>
            


		</div>





	</div>
</body>
</html>