<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>ADMIN-강사관리</title>


</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>
    
	<jsp:include page="common/header.jsp"/>
	
   	<div class="card card-default">
   		<div class="card-header">
			<h2>강사관리</h2>
		</div>
		
		<div class="card-body">
			<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalForm">강사배정</button>
			<button type="button" id="deleteTeacher" class="btn btn-outline-danger">강사삭제</button>
			
			<!-- 모달 시작 -->
              <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalFormTitle">강사배정</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <form>
                          <div class="form-group">
                            <label for="exampleInputEmail1">강사 선택</label>
                            <br>
                            <select name="teacherList" id="teacherList" style="width: 300px;">
                                <option value="강사1">강사1</option>                            
                                <option value="강사2">강사2</option>                            
                                <option value="강사3">강사3</option>                            
                                <option value="강사4">강사4</option>                            
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="exampleInputPassword1">강의 선택</label>
                            <br>
                            <select name="lectureList" id="lectureList" style="width: 300px;">
                              <option value="강의1">강의1</option>                            
                              <option value="강의2">강의2</option>                            
                              <option value="강의3">강의3</option>                            
                              <option value="강의4">강의4</option>                            
                          </select>
                          </div>
                          
                          
                          </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success">저장</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>
              <!-- 모달 끝 -->
         	</div> 
              <!-- 강사 목록 테이블 -->
            <div class="card-body">
            <table class="table">
                <thead>
                  <tr>
                    <th class="selectTeacher" style="display: none;">선택</th>
                    <th scope="col">이름</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">담당과목</th>
                    <th scope="col" style="text-align: center;">관리</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>윤여진</td>
                    <td>010-1234-5678</td>
                    <td>자바</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="location.href='teacherDetail.do'">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Catrin</td>
                    <td>Seidl</td>
                    <td>C</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Lilli</td>
                    <td>Kirsh</td>
                    <td>파이썬</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Else</td>
                    <td>Voigt</td>
                    <td>@voigt</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Ursel</td>
                    <td>Harms</td>
                    <td>-</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Anke</td>
                    <td>Sauter</td>
                    <td>@Anke</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Anke</td>
                    <td>Sauter</td>
                    <td>-</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Anke</td>
                    <td>Sauter</td>
                    <td>-</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>Anke</td>
                    <td>Sauter</td>
                    <td>-</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                  </tr>
                  
                </tbody>
              </table>
              </div>
        
   	</div>
   	 <script>
       // function deleteTeacher(){
       //   $('.selectTeacher').removeAttr("style");
       //   $('.checkTeacher').removeAttr("style");

       //   $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
       //     $(location).attr('href', 'sign-up.html')
       //   });

       //   $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
       // }

       // $(function(){
       //   $("#deleteTeacher").click(function(){
       //     $('.selectTeacher').removeAttr("style");
       //     $('.checkTeacher').removeAttr("style");

       //     $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
       //     $(location).attr('href', 'sign-up.html')
       //     });

       //     $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
       //     })
       // })

       $(function(){
         $("#deleteTeacher").one('click', function(){
           $('.selectTeacher').removeAttr("style");
           $('.checkTeacher').removeAttr("style");

           $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
           $(location).attr('href', 'sign-up.html')
           });

           $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
         })
       })
     </script>
   	</body>
</html>