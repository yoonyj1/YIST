<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-수업자료등록</title>
<style>
	div.card-header table#addMaterialClass-table{
		width: 75%;
		margin-left: auto;
		margin-right: auto;
	}

	div.card-header table#addMaterialClass-table th{
		text-align: center;
		vertical-align: middle;
		color: black;
	}


	div.card-header table#addMaterialClass-table td>input,
	div.card-header table#addMaterialClass-table td>select{
		vertical-align: middle;
	}

	div.card-header table#addMaterialClass-table td>label{
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
			<h2>수업 자료 등록</h2>
		</div>

		<div class="card-body">
			<form method="post" action="insert.cm" enctype="multipart/form-data">
				<table class="table table-bordered" id="addMaterialClass-table">
                    <input type="hidden" name="boardWriter" value="${ loginUser.id }">
					<tr>
						<th>제목</th>
						<td>
							<div class="input-group mb-3">
								<input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력하세요">
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
                  
				<div class="btn-center">
                    <button class="btn btn-primary btn-pill mr-2" type="submit">등록</button>
                    <button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
				</div>
			</form>

			<script>
				function backToList(){
					location.href='classMaterialAdminList.ad';
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


		</div>





	</div>      
      
      
      

</body>
</html>