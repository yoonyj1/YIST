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
    text-align: center;
    border-bottom: 1px solid #dae0e9;
  }

  th {
    background-color: #f2f5f9;
    font-weight: bold;
  }

#search-area {
  width: 100%;
  margin-bottom: 30px;
}

form {
  display: flex;
  justify-content: center;
}

select, input{
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 0px;
  background-color: white;
}

button {
  background-color: #828282;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  color: #eeeeee;
  padding: 6px 20px 8px;
}

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>

	<div class="container">
	    <div class="sub08_title">
	      <ul style="text-align: center; margin-top: 40px">
	        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">내 정보</h2></li>
	        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
	        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
	        <p class="join_necessary" style="clear:both; margin-bottom:12px; text-align: right; color: red;">*표시는 필수입력 항목입니다.</p>
	      </ul>
	    </div> 
	    <div class="entry-content">
	      <table>
	          <tr style="border-top: 1px solid black;">
	            <th width="20%">아이디*</th>
	            <td width="60%" style="text-align: left;">
	              <input type="text" class="form-control" id="" name="" value="user01" readonly>
	            </td>
	            <th rowspan="4"><img src="resources/images/yist/profile.png" alt=""></th>
	          </tr>
	          <tr>
	            <th>비밀번호*</th>
	            <td style="text-align: left;">
	              <input type="text" class="form-control" id="" name="" value="">
	            </td>
	          </tr>
	          <tr>
	            <th>비밀번호 확인*</th>
	            <td style="text-align: left;">
	              <input type="text" class="form-control" id="" name="" value="">
	            </td>
	          </tr>
	          <tr>
	            <th>이름*</th>
	            <td style="text-align: left;">
	              <input type="text" class="form-control" id="" name="" value="">
	            </td>
	          </tr>
	          <tr>
	            <th>휴대폰</th>
	            <td style="text-align: left;" colspan="2">
	              <input type="text" class="" id="" name="" value="" style="width: 61%;">
	              <button type="button" class="common_btn2" id="" style="font-size: 14px; height: 35px; margin-left: 5px; color: #eeeeee;">인증하기</button><br>
	            </td>
	          </tr>
	          <tr>
	            <th>이메일 주소</th>
	            <td style="text-align: left;" colspan="2">
	              <input type="text" class="form-control" id="" name="" value="">
	            </td>
	          </tr>
	          <tr>
	            <th>생년월일</th>
	            <td style="text-align: left;" colspan="2">
	              <select style="width: 20%; height:45px; text-align: center;" id="birth1" name="stdtCheck">
	                <option value="2023">2023</option>
	                <option value="2022">2022</option>
	                <option value="2021">2021</option>
	                <option value="2020">2020</option>
	                <option value="2019">2019</option>
	                <option value="2018">2018</option>
	                <option value="2017">2017</option>
	                <option value="2016">2016</option>
	                <option value="2015">2015</option>
	                <option value="2014">2014</option>
	                <option value="2013">2013</option>
	                <option value="2012">2012</option>
	                <option value="2011">2011</option>
	                <option value="2010">2010</option>
	                <option value="2009">2009</option>
	                <option value="2008">2008</option>
	                <option value="2007">2007</option>
	                <option value="2006">2006</option>
	                <option value="2005">2005</option>
	                <option value="2004">2004</option>
	                <option value="2003">2003</option>
	                <option value="2002">2002</option>
	                <option value="2001">2001</option>
	                <option value="2000">2000</option>
	                <option value="1999">1999</option>
	                <option value="1998" selected="selected">1998</option>
	                <option value="1997">1997</option>
	                <option value="1996">1996</option>
	                <option value="1995">1995</option>
	                <option value="1994">1994</option>
	                <option value="1993">1993</option>
	                <option value="1992">1992</option>
	                <option value="1991">1991</option>
	                <option value="1990">1990</option>
	                <option value="1989">1989</option>
	                <option value="1988">1988</option>
	                <option value="1987">1987</option>
	                <option value="1986">1986</option>
	                <option value="1985">1985</option>
	                <option value="1984">1984</option>
	                <option value="1983">1983</option>
	                <option value="1982">1982</option>
	                <option value="1981">1981</option>
	                <option value="1980">1980</option>
	                <option value="1979">1979</option>
	                <option value="1978">1978</option>
	                <option value="1977">1977</option>
	                <option value="1976">1976</option>
	                <option value="1975">1975</option>
	                <option value="1974">1974</option>
	                <option value="1973">1973</option>
	                <option value="1972">1972</option>
	                <option value="1971">1971</option>
	                <option value="1970">1970</option>
	                <option value="1969">1969</option>
	                <option value="1968">1968</option>
	                <option value="1967">1967</option>
	                <option value="1966">1966</option>
	                <option value="1965">1965</option>
	                <option value="1964">1964</option>
	                <option value="1963">1963</option>
	                <option value="1962">1962</option>
	                <option value="1961">1961</option>
	                <option value="1960">1960</option>
	                <option value="1959">1959</option>
	                <option value="1958">1958</option>
	                <option value="1957">1957</option>
	                <option value="1956">1956</option>
	                <option value="1955">1955</option>
	                <option value="1954">1954</option>
	                <option value="1953">1953</option>
	                <option value="1952">1952</option>
	                <option value="1951">1951</option>
	                <option value="1950">1950</option>
	              </select>
	              <select style="width: 20%; height:45px; text-align: center;" id="birth2" name="stdtCheck">
	                <option value="01" selected="selected">01</option>
	                <option value="02">02</option>
	                <option value="03">03</option>
	                <option value="04">04</option>
	                <option value="05">05</option>
	                <option value="06">06</option>
	                <option value="07">07</option>
	                <option value="08">08</option>
	                <option value="09">09</option>
	                <option value="10">10</option>
	                <option value="11">11</option>
	                <option value="12">12</option>
	              </select>
	              <select style="width: 20%; height:45px; text-align: center;" id="birth3" name="stdtCheck">
	                <option value="01">01</option>
	                <option value="02">02</option>
	                <option value="03">03</option>
	                <option value="04">04</option>
	                <option value="05">05</option>
	                <option value="06">06</option>
	                <option value="07">07</option>
	                <option value="08">08</option>
	                <option value="09">09</option>
	                <option value="10">10</option>
	                <option value="11">11</option>
	                <option value="12">12</option>
	                <option value="13">13</option>
	                <option value="14" selected="selected">14</option>
	                <option value="15">15</option>
	                <option value="16">16</option>
	                <option value="17">17</option>
	                <option value="18">18</option>
	                <option value="19">19</option>
	                <option value="20">20</option>
	                <option value="21">21</option>
	                <option value="22">22</option>
	                <option value="23">23</option>
	                <option value="24">24</option>
	                <option value="25">25</option>
	                <option value="26">26</option>
	                <option value="27">27</option>
	                <option value="28">28</option>
	                <option value="29">29</option>
	                <option value="30">30</option>
	                <option value="31">31</option>
	              </select>
	            </td>
	          </tr>
	          <tr>
	            <th>주소</th>
	            <td style="text-align: left;" colspan="2">
	              <input type="text" id="city" name="stdtCheck" value="" style="width: 61%;">
	              <button type="button" class="common_btn2" id="findAddress" style="font-size: 14px; height: 35px; margin-left: 5px; color: #eeeeee;" onclick="fnFindAddress();">주소검색</button><br>
	              <input type="text" id="city" name="stdtCheck" value="" style="width: 61%; margin-top:5px;"><br>
	              <input type="text" id="address_etc" value="" style="width:61%; margin-top:5px;">
	              </td>
	          </tr>
	        </tbody>
	      </table>
	      <ul style="text-align: center; margin: 40px;">
	        <li>
	          <a href="#" class="btn btn-default btn-theme-colored btn-circled">정보수정</a>
	          <a href="#" class="btn btn-dark btn-theme-colored btn-circled">수강포기</a>
	        </li>
	      </ul>
	      
	    </div>       
  </div>
  <jsp:include page="common/footer.jsp"/>
</body>
</html>