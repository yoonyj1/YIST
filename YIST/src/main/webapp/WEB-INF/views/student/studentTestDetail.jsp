<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
    border-collapse: collapse;
    width: 100%;
    margin: 13px 0 37px 0;
    text-align: center;
  }
  
  caption {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
  }
  
  th,
  td {
    height: 50px;
    padding: 10px;
    border: 1px solid #dae0e9;
  }

  th {
    background-color: #eee;
    font-weight: bold;
  }
  
</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <form action="">
    <table style="margin-top: 40px;">
        <caption>수강생 평가</caption>
        <thead>
            <tr>
              <th width="80%" style="text-align: left;">프로그래밍 언어 활용</th>
              <th width="20%" style="text-align: right;">서술형 | 5문항</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2" style="text-align: left;">
                    1. 문자열을 담을 수 있는 자료형을 쓰고 str 변수에 "java"라는 값을 담으시오. (20점) <br>
                    <textarea name="" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                    2. 산술연사자에서 각 연산자가 어떠한 기능을 하는지 서술하시오. (20점) <br>
                    <textarea name="" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                    3. 전위 연산자와 후위 연산자를 설명하시오. (20점) <br>
                    <textarea name="" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                    4. 다음 연산자들 목록에서 연산자의 우선순위가 높은 순서대로 기술하시오. (20점) <br>
                    <textarea name="" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                    5. 아래의 메인클래스를 작성하고, 메인에서 아래와 같은 실행결과가 나오도록 코딩하시오. (20점) <br>
                    <textarea name="" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
        </tbody>
    </table>
    <ul style="text-align: center; margin: 40px;">
        <li>
            <button type="submit" class="btn btn-gray btn-theme-colored btn-circled">제출하기</button>
            <button type="button" class="btn btn-gray btn-theme-colored btn-circled">뒤로가기</button>
        </li>
    </ul>
    </form>
  </div>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>