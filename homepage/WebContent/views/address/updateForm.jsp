<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ include file="/ssi/ssi.jsp" %> 

 <%
 int no= Integer.parseInt(request.getParameter("no"));
 AddressDTO dto=adao.read(no);
 %>
<!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
 <title></title> 
 <style type="text/css"> 
 *{ 
   font-family: gulim; 
   font-size: 24px; 
 } 
 table,tr,th{
 border: 1px soild black;
 border-collapse: collapse;
 }
 table{
 text-align: center;
 margin: auto;
 }
 fieldset {
	margin:auto;
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
	width: 30%;
	}
 </style> 
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<script type="text/javascript">
function A(){
	url="list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}

</script>
 </head> 
 <body> 
 	<jsp:include page="/menu/top.jsp"/>

 <fieldset>
 <legend>address update</legend>
<form name="frm" method="post" action="updateProc.jsp">
 
 <input type="hidden" name="no" value="<%=no%>">
 <input type="hidden" name="col" value="<%=request.getParameter("col")%>">
 <input type="hidden" name="word" value="<%=request.getParameter("word")%>">
 <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
 
 

 <table>
  

 <tr>
 <th>이름:</th>
 <td><%=dto.getName() %>
 </td>
</tr>
 <tr>
 
 <th>전화번호:</th>
 <td><input type="text" name="phone" value=<%=dto.getPhone() %>>
 </td>
 </tr>
<tr>
<th>우편번호</th>
<td><input type="text" name="zipcode"  value="<%=dto.getZipcode()%>" id="sample6_postcode">
<input type="button"  	value="주소검색"onclick="sample6_execDaumPostcode()">
</td>

</tr>

 <tr>
 
 <th>주소:</th>
 <td><input type="text" name="address" value='<%=dto.getAddress()%>'id="sample6_address" >
 </td>
</tr> 
 <tr>
 <th>상세주소:</th>
 <td><input type="text" name="address1" value='<%=dto.getAddress1() %>' id="sample6_address2"></td>
 </tr>
 <tr>
 <td><input type="button" value="목록" onclick="A()">
</td> 
<td><input type="submit" value="수정" >
 </td>
 </tr>
 </table>
 
 

</form>
</fieldset>
	
	<jsp:include page="/menu/bottom.jsp"/>
</body> 
 </html> 
