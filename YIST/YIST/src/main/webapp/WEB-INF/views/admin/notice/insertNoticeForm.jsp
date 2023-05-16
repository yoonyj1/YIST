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
            height: 750,
            lang: "ko-KR",
            focus : true,
            toolbar: [
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                ['color', ['forecolor','color']],
                ['table', ['table']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert',['link']],
                ['view', ['codeview','fullscreen', 'help']]
              ],
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          });
        })
        
	</script>

	<div class="card card-default">
		<div class="card-header">
			<h2>공지사항 등록</h2>
		</div>

		<div class="card-body">
			<form method="post" action="insert.no" enctype="multipart/form-data">
				<input type="hidden" name="boardWriter" value="${ loginUser.id }">
        		<table class="table table-bordered" id="addNotice-table">
                    
                    <tr>
                      <th>제목</th>
                      <td>
                        <div class="input-group mb-3">
                          <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력하세요">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <th>읽기권한</th>
                      <td>
                        <div class="form-group" style="width: 30%;">
                          <select name="views" class="js-example-basic-multiple form-control" required>
                            <option value="3">전체</option>
                            <option value="2">강사</option>
                            <option value="1">운영자</option>
                          </select>
                        </div>
                      </td>

                    </tr>

                    <tr>
                      <th colspan="2" style="width: 100%;">
                        <textarea name="boardContent" id="materialSummer" class="summernote" style="width: 100%;"></textarea>
                      </th>
                    </tr>

                    <tr>
                      <th>첨부파일</th>
                      <td>
                        <input type="file" name="upfile" onchange="loadFile(this);">
                        <img id="preview" src="#" width=200 height=150 style="align-content: flex-end; display:none;">
                      </td>
                    </tr>

				</table>

        <c:if test="${not empty loginUser}">
          <script>
    
            
            $(".summernote").on('summernote.keydown',function(we,e){
              
              if(typeof(Storage) == "function"){
    
    
                let text = $('.summernote').summernote('code');
                let text_notice = text.replace(/(<([^>]+)>)/ig,"");
    
                sessionStorage.setItem("text_notice", text_notice);	
    
              }
    
            })
    
    
            $(document).ready(() => {
              if (window.sessionStorage) {
                if (sessionStorage.getItem("temptNoti")!=null) {
                  if (confirm("이전에 작성한 글을 불러오시겠습니까?")) {
                    
                    let temptNoti = JSON.parse(sessionStorage.getItem("temptNoti"));
    
                    $("input[name='boardTitle']").val(temptNoti.title);
                    
                    $('.summernote').summernote('editor.insertText', temptNoti.content);
                    
                    let selectVal = temptNoti.select;
                    
                            $("select[name='views']").val(selectVal);
    
                  } else {
    
                    sessionStorage.removeItem("temptNoti");
    
                  }
                }
              } else {
                console.log("sessionStorage is not supported.");
              }
            });
          </script>
        </c:if>



				
				<script>
          function backToList(){
            if (window.sessionStorage) {
              if (sessionStorage.getItem("text_notice")!=null){
                if(confirm("작성중인 내용이 있습니다.\n취소하시겠습니까?")){

                  let text = $('.summernote').summernote('code');

                  let text_notice = text.replace(/(<([^>]+)>)/ig,"");

                  let title = $("input[name='boardTitle']").val();

                  let selectVal = $("select").val(); 
                  
                  let temptNoti = { title:title, content:text_notice, select:selectVal };
                  
                  sessionStorage.removeItem("text_notice");
                  sessionStorage.setItem("temptNoti", JSON.stringify(temptNoti));
                  
                  location.href='noticeAdminList.ad';
                }
              }
            } else {
              location.href='noticeAdminList.ad';
            }

          }

					function loadFile(input) {
					    let file = input.files[0];	
	
					    let $newImage = $("#preview");
	
					    if (file != '') {
					         let reader = new FileReader();
					         reader.readAsDataURL(file);
					         reader.onload = function (e) { 
					        	 $newImage.attr('src', e.target.result);
					        	 $newImage.css('display', 'block');
					         }
					    }else{
					    	
					        	 $newImage.css('display', 'none');
					    }
					    
					}
					
				</script>
				
				
				
				<div class="btn-center">
                    <button class="btn btn-primary btn-pill mr-2" type="submit">등록</button>
                    <button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
				</div>
				
			</form>
            


		</div>





	</div>
</body>
</html>