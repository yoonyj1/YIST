<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-수업자료수정</title>

<style>
	table#addMaterialClass-table{
          width: 75%;
          margin-left: auto;
		  margin-right: auto;
	}

	table#addMaterialClass-table th{
          text-align: center;
          vertical-align: middle;
          color: black;
	}


	table#addMaterialClass-table td>input,
	table#addMaterialClass-table td>select{
          vertical-align: middle;
	}

	table#addMaterialClass-table td>label{
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
                <h2>수업 자료 수정</h2>
              </div>

              <div class="card-body">
                <form id="materialForm" method="post" action="" enctype="multipart/form-data">
	                  <table class="table table-bordered" id="addMaterialClass-table">
	                    <input type="hidden" name="boardWriter" value="${ loginUser. id}">
						<input type="hidden" name="boardNo" value="${ m.boardNo }">

		                    <tr>
		                      <th>제목</th>
		                      <td>
		                        <div class="input-group mb-3">
		                          <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력하세요" required value="">
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


							<script>

								$(function() {
									let option = $("option");
									option.each(function(op){
										let value = op.val();
										let classNo = '${ m.classNo }';
										if(value === classNo){
											op.attr('selected',true);
										}
									})
								})
							
							</script>



		
		                    <tr>
		                      <th colspan="2" style="width: 100%;">
		                        <textarea name="boardContent" id="materialSummer" class="summernote" style="width: 100%;">
									${ m.boardContent }
								</textarea>
		                      </th>
		                    </tr>
		
		                    <tr>
		                      <th>첨부파일</th>
							  <td>
								<input type="file" name="reupfile" id="upfile" onchange="loadFile(this);">
                        		<img id="preview" src="#" width=200 height=150 style="align-content: flex-end; display:none;">

		                      	<c:choose>
		                      		<c:when test="${ empty m.originName }">
		                      			첨부파일이 없습니다
		                      		</c:when>
		                      		
		                      		<c:otherwise>
		                      			<br>
										현재 첨부파일 | <a href="${ m.changeName } " download="${ m.originName }">${ m.originName }</a>
										<input type="hidden" name="originName" value="${ m.originName }">
										<input type="hidden" name="changeName" value="${ m.changeName }">
		                      		</c:otherwise>
				                      		
		                      	</c:choose>
		                      </td>		                    
							</tr>
	
	                  </table>
	                  <div class="btn-center">
	                    	<button class="btn btn-primary btn-pill mr-2" type="submit" onclick="materialForm(1);">수정</button>
	                    	<button class="btn btn-pill mr-2 btn-danger" type="submit" onclick="if(confirm('삭제된 자료는 복구할 수 없습니다. \n정말 삭제하시겠습니까?')){materialForm(2)};">삭제</button>
	                    	<button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
	                  </div>
                </form>
            


 		</div>





	</div>

	<script>

		function materialForm(num){
			if(num==1){
						
				$("#materialForm").attr("action","update.cm").submit();
						
			}else{
						
				$("#materialForm").attr("action","delete.cm").submit();
						
			}

		}


		function backToList(){
			location.href='classMaterialAdminList.ad';
		}

	</script>
	
</body>
</html>