<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
   <jsp:include page="common/header.jsp" />

   <div class="card card-default">
      <div class="card-header">
         <h2>성적관리</h2>
      </div>

      <ul class="nav nav-tabs mb-3" id="pills-tab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" id="pills-java-tab" data-toggle="pill" href="#nav-java-home" role="tab"
            aria-controls="nav-tabs" aria-selected="true">JAVA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="nav-python-tab" data-toggle="pill" href="#nav-python" role="tab"
            aria-controls="nav-profile" aria-selected="false">Python</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="nav-c-tab" data-toggle="pill" href="#nav-c" role="tab"
            aria-controls="nav-profile" aria-selected="false">C</a>
        </li>
      </ul>
      <div class="tab-content mt-5" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-java-home" role="tabpanel" aria-labelledby="nav-java-tab">
          <div class="accordion accordion-shadow" id="accordionShadow">
            <div class="card">
              <div class="card-header" id="headingShadowOne">
                <h2 class="mb-0">
                  <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseShadowOne"
                    aria-expanded="true" aria-controls="collapseShadowOne">
                    자바1반
                  </button>
                </h2>
              </div>
              <div id="collapseShadowOne" class="collapse show" aria-labelledby="headingShadowOne" data-parent="#accordionShadow">
                <div class="card-body">
                  <table class="table">
                  <thead>
                     <tr>
                        <th scope="col">시험명</th>
                        <th scope="col">평균</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr style="cursor: pointer;" data-toggle="modal"
                        data-target="#exampleModalForm">
                        <td scope="row" data-toggle="modal">시험1</td>
                        <td>88</td>
                     </tr>

                     <tr>
                        <td scope="row">시험2</td>
                        <td>92</td>
                     </tr>
                     <tr>
                        <td scope="row">시험3</td>
                        <td>68</td>
                     </tr>
                     <tr>
                        <td scope="row">시험4</td>
                        <td>100</td>
                     </tr>
                     <tr>
                        <td scope="row">시험5</td>
                        <td>48</td>
                     </tr>
                     <tr>
                        <td scope="row">시험6</td>
                        <td>52</td>
                     </tr>
                  </tbody>
               </table>
               
               <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalFormTitle">시험 1</h5>
                        </div>
                        <div class="modal-body">
                          <table class="table">
                            <thead>
                              <tr align="right">
                                <td colspan="3"><button class="updateScore btn btn-sm btn-primary">수정</button></td>
                              </tr>
                              <tr>
                                <th scope="col">석차</th>
                                <th scope="col">이름</th>
                                <th scope="col">점수</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td scope="row">1</td>
                                <td>Lucia</td>
                                <td class="score">100</td>
                              </tr>
                              <tr>
                                <td scope="row">2</td>
                                <td>Catrin</td>
                                <td class="score">98</td>
                              </tr>
                              <tr>
                                <td scope="row">3</td>
                                <td>Lilli</td>
                                <td class="score">95</td>
                              </tr>
                              <tr>
                                <td scope="row">4</td>
                                <td>Else</td>
                                <td class="score">90</td>
                              </tr>
                              <tr>
                                <td scope="row">5</td>
                                <td>Ursel</td>
                                <td class="score">88</td>
                              </tr>
                              <tr>
                                <td scope="row">6</td>
                                <td>Anke</td>
                                <td class="score">85</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="closeBtn btn btn-danger btn-pill" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingShadowTwo">
                <h2 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowTwo"
                    aria-expanded="false" aria-controls="collapseShadowTwo">
                    Collapsible Group Item #2
                  </button>
                </h2>
              </div>
              <div id="collapseShadowTwo" class="collapse" aria-labelledby="headingShadowTwo" data-parent="#accordionShadow">
                <div class="card-body">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                  moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                  wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                  anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                  butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                  probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" id="headingShadowThree">
                <h2 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowThree"
                    aria-expanded="false" aria-controls="collapseShadowThree">
                    Collapsible Group Item #3
                  </button>
                </h2>
              </div>
              <div id="collapseShadowThree" class="collapse" aria-labelledby="headingShadowThree" data-parent="#accordionShadow">
                <div class="card-body">
                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                  moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                  wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                  anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                  butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                  probably haven't heard of them accusamus labore sustainable VHS.
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="tab-pane fade" id="nav-python" role="tabpanel" aria-labelledby="nav-python-tab">
          파이썬
        </div>
        
        <div class="tab-pane fade" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">
          C
        </div>
      </div>
            
            <script>
              $(function(){
                $(".updateScore").click(function(){
                  
                  $(".score").html("<input type='text'>");

                  $(".closeBtn").text("적용");
                })
              })
            </script>
   </div>
               

</body>
</html>