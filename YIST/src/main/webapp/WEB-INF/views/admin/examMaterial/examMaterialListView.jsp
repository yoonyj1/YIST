<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-시험자료관리</title>
<style>
	table#testTable{
          text-align: center;
          line-height: 2em;
          width: 85%;
          margin-left: auto; margin-right: auto;
	}

	table#testTable input[type=checkbox]{
          margin-top: 7px;
          margin-bottom: 7px;
	}

	table#testTable tbody>tr:hover{
          box-shadow: 0px 10px 18px 0px rgb(55 103 208 / 20%);
          background-color: transparent;
          cursor: pointer;
	}
	
	table#testTable tbody>tr:hover td{
          color: #8a909d;
	}

	.search-area{
          display: flex;
          justify-content: center;
          margin-top: 40px;
          width: 100%;
	}
        
	.search-area>form{
          text-align: center;
          display: inline-block;
	}

	.search-area>form>*{
          float: left;
	}
	
	nav > ul > li.page-item.active > a.page-link{
          background-color: #99da87;
          border-color: #99da87;
	}
	
	a.page-link:hover{
		color:#99da87;
		background-color: white;
		border-color: #99da87;
    }
    

</style>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>


  <c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>


	
	<div class="card card-default">
		<div class="card-header">
			<h2>시험 자료</h2>
			<div class="btn-right" style="float:right">
				<button type="button" class="mb-1 btn btn-pill btn-primary" onclick="insert();">등록</button>
				<button type="button" class="mb-1 btn btn-pill btn-danger" id="classDeleteBtn" data-toggle="modal" data-target="#classDeleteModal">삭제</button>
				<div class="modal fade" id="classDeleteModal" tabindex="-1" role="dialog" aria-labelledby="classDeleteModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="classDeleteModalLabel">자료 삭제</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span>
                        </button>
                      </div>
                      <div class="modal-body" style="text-align: center; color: black;">
                        삭제된 자료는 복구할 수 없습니다.
                        <br>
                        정말 삭제하시겠습니까?
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger btn-pill btn-block" data-dismiss="modal" onclick="deleteExamMaterial();">삭제</button>
                      </div>
                    </div>
                  </div>
                </div>  

			</div>
		</div>

		<div class="card-body">

 			<table id="testTable" class="table table-hover table-product" style="border-color: #e5e9f2;">
				<thead>
                    <tr>
                      <th><input type="checkbox"></th>
                      <th>자료번호</th>
                      <th>과목명</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일자</th>
                      <th>관리</th>
                    </tr>
				</thead>
				
				<tbody>

          <c:if test="${ empty list }">
            <tr>
              <td colspan="7" style="text-align: center;">조회된 자료가 없습니다.</td>
            </tr>
          </c:if>

          <c:forEach var='em' items="${ list }">
            
            <tr>
              <td>
                <input type="checkbox">
              </td>
              <td class="boardNo">${ em.boardNo }</td>
              <td>${ em.className }</td>
              <td>${ em.boardTitle }</td>
              <td>${ em.boardWriter }</td>
              <td>${ em.createDate }</td>
              <td>
                <button type="button" class="btn btn-sm btn-outline-warning">수정</button>
              </td>
            </tr>

          </c:forEach>
            
        </tbody>

			</table>




           
      <div class="search-area">
        <form action="search.em" method="get">

          <select name="condition" class="custom-select my-1 mr-sm-2 w-auto" id="testSearchCondition">

            <option selected name value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="no">자료번호</option>
            <option value="name">과목</option>

          </select>

          <input type="text" name="keyword" class="form-control rounded-pill" style="width:50%;">
          <button type="submit" class="btn btn-outline-primary">검색</button>
        </form>
      </div>


      <c:if test="${ ! empty condition }">
        <script>
        
          $(function() {
            $(".search-area option[value=${condition}]").attr("selected", true);
          })
        
        </script>
      </c:if>


      <div class="card align-items-center" style="border: none; clear: both;">

        <nav aria-label="Page navigation example" style="margin-top: 50px;">
          <ul class="pagination pagination-seperated pagination-seperated-rounded">
            <c:choose>
              <c:when test="${ pi.currentPage eq 1 }">
                <li class="page-item disabled">
                  <a class="page-link" href="" aria-label="Previous"> 
                    <span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
                    <span class="sr-only">Previous</span>
                  </a>
                </li>
              </c:when>
              <c:otherwise>
                <c:choose>
                  <c:when test="${ empty condition }">
                    <li class="page-item">
                      <a class="page-link" href="examMaterialAdminList.ad?page=${ pi.currentPage -1 }" aria-label="Previous"> 
                        <span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>							
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="search.em?page=${ pi.currentPage -1 }&condition=${condition}&keyword=${keyword}" aria-label="Previous"> 
                        <span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>							
                  </c:otherwise>
                </c:choose>
              </c:otherwise>
            </c:choose>
          
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              <c:choose>
                <c:when test="${ empty condition }">
                  <li class="page-item">
                    <a class="page-link" href="examMaterialAdminList.ad?page=${ p }">${ p }</a>
                  </li>
                </c:when>
                <c:otherwise>
                  <li class="page-item">
                    <a class="page-link" href="search.em?page=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a>
                  </li>
                </c:otherwise>
              </c:choose>
            </c:forEach>
            
            <c:choose>
              <c:when test="${ pi.currentPage eq pi.maxPage }">
                <li class="page-item disabled">
                  <a class="page-link" href="" aria-label="Next"> 
                    <span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
                    <span class="sr-only">Next</span>
                  </a>
                </li>
              </c:when>
              <c:otherwise>
                <c:choose>
                  <c:when test="${ empty condition }">
                    <li class="page-item">
                      <a class="page-link" href="examMaterialAdminList.ad?page=${ pi.currentPage + 1 }" aria-label="Next"> 
                        <span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
                        <span class="sr-only">Next</span>
                      </a>
                    </li>							
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="search.em?page=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}"" aria-label="Next"> 
                        <span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
                        <span class="sr-only">Next</span>
                      </a>
                    </li>							
                  </c:otherwise>
                </c:choose>
              </c:otherwise>
            </c:choose>
            

          </ul>

        </nav>


      </div>


    </div>



<script>

    function insert(){
      location.href="insertForm.em";
    }


    $(function(){

      const cP = '${pi.currentPage}';

      const $pageLinks = $('a.page-link');

      $pageLinks.each(function(index, link) {

        let text = link.innerText;
        
        if (text === cP) {
          $(link).parent('li').addClass('active');
        }

      });
        
      //전체선택(해제)
      $("#testTable thead th input[type=checkbox]").click(function(){
        if($("#testTable thead th input[type=checkbox]").is(":checked")){
          $("#testTable tbody td input[type=checkbox]").attr("checked",true);
        }else{
          $("#testTable tbody td input[type=checkbox]").attr("checked",false);
        }
      });
                          
      //수정화면이동
      $("#testTable>tbody>tr>td>button").click(function(){
        let $boardNo = $(this).parent("td").siblings('.boardNo').text();
        location.href='updateForm.em?no'+$boardNo;
      });
                        
      //조회화면이동
      $('#testTable').on('click', 'tr td:nth-child(4)', function() {
        let $boardNo = $(this).siblings('.boardNo').text();

        location.href = 'detail.em?no='+$boardNo;
                  
      });
            
    })

    function deleteExamMaterial() {
              let boardNoArr = [];
              
              $('#testTable tbody tr').each(function() {
                if($(this).find('td:first-child input[type="checkbox"]').is(':checked')){
                  let $boardNo = $(this).find('td.boardNo').text();
                  boardNoArr.push($boardNo);
                }
              })

              $.ajax({

                type:'POST'
                ,url:'ajaxDelete.em'
                ,data:{'boardNoArr':boardNoArr}
                ,success: function(result) {
                  if(result == "YYYY"){
                    alert("게시글 삭제에 성공했습니다.");
                    location.reload();
                  }else{
                    alert("게시글 삭제에 실패했습니다. \n잠시 후 다시 시도해주세요.")
                  }
                }
                ,error:function(){
                  alert("오류가 발생했습니다! \n잠시 후 다시 시도해주세요.")
                }

              })

    }


  </script> 







	</div>

</body>
</html>