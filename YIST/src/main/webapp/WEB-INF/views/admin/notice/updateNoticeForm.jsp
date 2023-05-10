<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-공지사항수정</title>



<style>

	div.card-body table#updateNotice-table{
          width: 75%;
          margin-left: auto; margin-right: auto;
	}

	div.card-body table#updateNotice-table th{
          text-align: center;
          vertical-align: middle;
          color: black;
    }


    div.card-body table#updateNotice-table td>input,
    div.card-body table#updateNotice-table td>select{
          vertical-align: middle;
    }

    div.card-body table#updateNotice-table td>label{
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
			<h2>공지사항 수정</h2>
		</div>


		<c:if test="${ not empty alertMsg }">
			<script>
				alert('${alertMsg}');
			</script>
			<c:remove var="alertMsg" scope="session" />
		</c:if>




		<div class="card-body">
			<form id="noticeForm" method="post" action="" enctype="multipart/form-data">
				<input type="hidden" name="boardNo" value="${ n.boardNo }">

				<table class="table table-bordered" id="updateNotice-table">
	
						<tr>
		                      <th>제목</th>
		                      <td>
		                        <div class="input-group mb-3">
		                          <input type="text" name="boardTitle" class="form-control" value="${ n.boardTitle }">
		
		                        </div>
		                      </td>
						</tr>
		
		                <tr>
		                      <th>읽기권한</th>
		                      <td>
		                        <div class="form-group" style="width: 30%;">
		                          <select name="views" class="js-example-basic-multiple form-control" required>
		                            <option value="3">전체공개</option>
		                            <option value="2">강사</option>
		                            <option value="1">운영자</option>
		                          </select>
		                        </div>
		                      </td>
		                      
		                </tr>
						
						<script>
							$(function() {
								let option = $("option");
								option.each(function(op){
									let value = op.val();
									let views = '${ n.views }';
									if(value === views){
										op.attr('selected',true)
									}
								})
							})
						
						</script>
						
						
		                <tr>
		                      <th colspan="2" style="width: 100%;">
		                        <textarea name="boardContent" id="materialSummer" class="summernote" style="width: 100%; resize: none;">
		                        	${ n.boardContent }
		                        </textarea>
		                      </th>
		                    </tr>
		
		                    <tr>
		                      <th>첨부파일</th>
		                      <td>
								<input type="file" name="reupfile" id="upfile" onchange="loadFile(this);">
                        		<img id="preview" src="#" width=200 height=150 style="align-content: flex-end; display:none;">

		                      	<c:choose>
		                      		<c:when test="${ empty n.originName }">
		                      			첨부파일이 없습니다
		                      		</c:when>
		                      		
		                      		<c:otherwise>
		                      			<br>
										현재 첨부파일 | <a href="${ n.changeName } " download="${ n.originName }">${ n.originName }</a>
										<input type="hidden" name="originName" value="${ n.originName }">
										<input type="hidden" name="changeName" value="${ n.changeName }">
		                      		</c:otherwise>
				                      		
		                      	</c:choose>
		                      </td>
		                </tr>
	
					</table>
				
					<div class="btn-center">
						<button class="btn btn-primary btn-pill mr-2" type="submit" onclick="formNotice(1)">수정</button>
						<button class="btn btn-pill mr-2 btn-danger" type="submit" onclick="if(confirm('삭제된 게시글은 복구할 수 없습니다. \n정말 삭제하시겠습니까?')){ formNotice(2); }">삭제</button>
						<button class="btn btn-light btn-pill" type="button" onclick="backList();">취소</button>
					</div>
			
			</form>
            
			<script>
			
				function formNotice(num) {
					if(num==1){
						
						$("#noticeForm").attr("action","update.no").submit();
						
					}else{
						
						$("#noticeForm").attr("action","delete.no").submit();
						
					}
				}
				
				function backList() {
					location.href='noticeAdminList.ad';
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