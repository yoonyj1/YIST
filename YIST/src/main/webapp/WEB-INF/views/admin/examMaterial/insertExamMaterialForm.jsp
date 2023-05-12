<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-시험자료등록</title>

<style>
	table#addTest-table{
            width: 75%;
            margin-left: auto;
			margin-right: auto;
	}
  
	table#addTest-table th{
            text-align: center;
            vertical-align: middle;
            color: black;
	}
  
  
	table#addTest-table td>input,
	table#addTest-table td>select{
            vertical-align: middle;
	}
  
	table#addTest-table td>label{
            margin-right: 5px;
	}

</style>

</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>



	

	


	
	<script>
	
	
		$(document).ready(function(){

	        $('.summernote').summernote({
				disableResize: true,
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
				<h2>시험 자료 등록</h2>
			</div>
  
			<div class="card-body">
				<form method="post" action="insert.em" enctype="multipart/form-data">
					<input type="hidden" name="boardWriter" value="${ loginUser.id }">
					<table class="table table-bordered" id="addTest-table">
						
	                      <tr>
	                        <th>제목</th>
	                        <td>
	                          <div class="input-group mb-3">
	                            <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력하세요" aria-label="Recipient's username"
	                              aria-describedby="basic-addon2">
	  
	                          </div>
	                        </td>
	                      </tr>
	  
	                      <tr>
	                        <th>과목</th>
	                        <td>
	                          <div class="form-group" style="width: 30%;">
	                            <select name="classNo" class="js-example-basic-multiple form-control" required>
	                              <option value="1">자바</option>
	                              <option value="2">파이썬</option>
	                              <option value="3">C</option>
	                            </select>
	                          </div>
	                        </td>
	                      </tr>
	  
	                      <tr>
	                        <th colspan="2" style="width: 100%;">
	                          <textarea name="boardContent" id="testSummer" class="summernote" style="width: 100%;"></textarea>
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
					
                    <div class="btn-center">
                      <button class="btn btn-primary btn-pill mr-2" type="submit">등록</button>
                      <button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
                    </div>
                    
                  </form>
              

  
                </div>
  
  
  
  
  
		</div>
		
		<c:if test="${not empty loginUser}">
			<script>

				
				$(".summernote").on('summernote.keydown',function(we,e){
					
					if(typeof(Storage) == "function"){


						let text = $('.summernote').summernote('code');
						let text_examMaterial = text.replace(/(<([^>]+)>)/ig,"");

						sessionStorage.setItem("text_examMaterial", text_examMaterial);	

					}

				})


				$(document).ready(() => {
					if (window.sessionStorage) {
						if (sessionStorage.getItem("temptExMa")!=null) {
							if (confirm("이전에 작성한 글을 불러오시겠습니까?")) {
								
								let temptExMa = JSON.parse(sessionStorage.getItem("temptExMa"));

								$("input[name='boardTitle']").val(temptExMa.title);
								
								$('.summernote').summernote('editor.insertText', temptExMa.content);
								
								let selectVal = temptExMa.select;
								
				                $("select[name='classNo']").val(selectVal);

							} else {

								sessionStorage.removeItem("temptExMa");

							}
						}
					} else {
						console.log("sessionStorage is not supported.");
					}
				});
			</script>
		</c:if>


		<script>
	

			function backToList() {

				if (window.sessionStorage) {
					if (sessionStorage.getItem("text_examMaterial")!=null){
						if(confirm("작성중인 내용이 있습니다.\n취소하시겠습니까?")){

							let text = $('.summernote').summernote('code');
							let text_examMaterial = text.replace(/(<([^>]+)>)/ig,"");
							
							let title = $("input[name='boardTitle']").val();
							
							let selectVal = $("select").val(); 
							
							let temptExMa = { title:title, content:text_examMaterial, select:selectVal };
							
							sessionStorage.removeItem("text_examMaterial");
							sessionStorage.setItem("temptExMa", JSON.stringify(temptExMa));
							
							location.href = 'examMaterialAdminList.ad';
						}
					}
				} else {
					location.href = 'examMaterialAdminList.ad';
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



</body>
</html>