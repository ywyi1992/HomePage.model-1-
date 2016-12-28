<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String id=request.getParameter("id");
if(id==null){
	id=(String)session.getAttribute("id");
}
String fname=request.getParameter("fname");
MemberDTO dto=bdao.read(id);


%>
   
 
<!DOCTYPE html> 
 
<html> 
 
<head> 
 
<meta charset="UTF-8"> 
 
<title></title> 
 
<style type="text/css"> 
 
*{ 
 
  font-family: gulim; 
 
  font-size: 20px; 
 
} 
 
</style> 
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function a(f){

	if(f.email.value==""){
		alert("Email를 입력해 주세요");
		f.email.focus();
		return false;
	}
	if(f.job.value==""){
		alert("Job를 선택해 주세요");
		f.job.focus();
		return false;
		
	}	
	if(f.tel.value==""){
		alert("Tel를 입력해 주세요");
		f.tel.focus();
		return false;
	}
	if(f.address1.value==""){
		alert("집주소를 입력해 주세요");
		f.address1.focus();
		return false;
	}
	if(f.address2.value==""){
		alert("상세주소를 입력해 주세요");
		f.address2.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("우편번호를 입력해 주세요");
		f.zipcode.focus();
		return false;
	}

}



function emailCheck(email){
	if(email==""){
		alert("Email를 입력해주세요");
		document.frm.email.focus();
	}else{
		var url="email_proc.jsp";
		url+= "?email="+email;
		wr=window.open(url,"Email 중복 확인","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);
	}
	
}
function emailCheck2(i) {
	alert("Email을 변경 하실려면\n 중복확인을 해주세요");
	i.blur();
}

</script>
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
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->

 
 
<DIV class="title"> 회원가입 </DIV>
 
 
 
<FORM name='frm' method='POST' action='./updateProc.jsp'onsubmit="return a(this)">
 <input type="hidden" value="<%=id %>" name="id">
  <input type="hidden" value="<%=request.getParameter("word")%>" name="word">
 <input type="hidden" value="<%=request.getParameter("col")%>" name="col">
 <input type="hidden" value="<%=request.getParameter("nowPage")%>" name="nowPage">

  <TABLE>
 
    <TR>
 
      <TH>사진</TH>
 
      <TD colspan="2">
       <img src="./storage/<%=dto.getFname()%>">
      </TD>
     
         
 
    </TR>
    <TR>
 
      <TH>ID</TH>
       
      <TD colspan="2"><%=dto.getId() %></td>
         
 
    </TR>

       <TR>
 
      <TH >Name</TH>
 
      <TD colspan="2"><%=dto.getMname()%></TD>
         
 
    </TR>
     <tr>
      <TH>Tel</TH>
 
      <TD colspan="2"> <input type="text" name="tel" value="<%=dto.getTel()%>"></TD>
         
 
    </TR>
         <tr>
      <TH>Email</TH>
 
      <TD colspan="2"> <input type="text" name="email" value="<%=dto.getEmail()%> " onclick="emailCheck2(this)">

   
            <input type="button" value="중복확인" onclick="emailCheck(document.frm.email.value)">
      </TD>
         
 
    </TR>
    <tr>
    <th>ZipCode</th>
    <td><input type="text" name="zipcode" size="7" id="sample6_postcode" value="<%=dto.getZipcode()%>">
    <input type="button" value="주소 검색" onclick="sample6_execDaumPostcode()">
    </td>
    
    </tr>
    <tr>
    <th>Address</th>
    <td><input type="text" value="<%=dto.getAddress1() %>" name="address1" id="sample6_address" > </td>
    </tr>
     <tr>
    <th>Address2</th>
    <td><input type="text" value="<%=dto.getAddress2() %>" name="address2" id="sample6_address2"> </td>
    </tr>
  
    
       <tr>
    <th>Job</th>
   <td>
    <select name="job" >
    <option></option>
     <option value="a1">회사원</option>
     <option value="a2">전산관련직</option>
     <option value="a3">연구전문직</option>
     <option value="a4">자영업</option>
     <option value="a5">가수</option>
     <option value="a6">텔런트</option>
     <option value="a7">군인</option>
     <option value="a8">대통령</option>
     <option value="a9">학생</option>
     <option value="a10">피카츄</option>
    </select>
    <script type="text/javascript">
    document.frm.job.value='<%=dto.getJob() %>';
    </script>
    </td>
    </tr>
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
    <input type='submit' value='수정' >
 
    <input type="reset" value='다시입력'>
    <input type="button" value="뒤로가기" onclick="history.hack()">
 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html>  