<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String id=request.getParameter("id");
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
 <script type="text/javascript">
 function pa(f) {
	if(f.oldpasswd.value==""){
		alert("기존 비밀번호를 입력해 주세요");
		f.oldpasswd.focus();
		return false;
	}	
	if(f.<%=dto.getPasswd()%>.value!=<%=dto.getPasswd()%>){
		alert("기존 비밀번호가 같지 않습니다");
		f.oldpasswd.focus();
		return false;
	}
	
	if(f.passwd.value==""){
		alert("수정할 비밀번호를 입력해 주세요");
		f.passwd.focus();
		return false;
	}
	if(f.ps_passwd.value==""){
		alert("수정할 비밀번호를 확인해 주세요");
		f.ps_passwd.focus();
		return false;
	}
	if(f.passwd.value!=f.ps_passwd.value){
		alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요");
		f.passwd.focus();
		return false;
	}
	if(f.passwd.value==<%=dto.getPasswd()%>){
		alert("기존 비밀번호와 같습니다");
		f.passwd.focus();
		return false;
	}
}


 </script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">페스워드 수정</DIV>
 
 
 
<FORM name='frm' method='POST' action='updatePasswdProc.jsp' onsubmit="return pa(this)">
 
 <input type="hidden" value="<%=id%>" name="id">


  <TABLE>

    <TR>
 
      <TH>기존 비밀번호</TH>
 
      <TD><input type="password" placeholder="old passwd" name="oldpasswd"></TD>
 
    </TR>
    
 <tr>
 <th>수정할 비밀번호</th>
 <td> <input type="password"  name="passwd" placeholder="new passwd" ></td>
 </tr>
 <tr>
 <th>비밀번호 수정 확인</th>
 <td> <input type="password"  name="ps_passwd" placeholder="identify passwd" ></td>
 </tr>
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
    <input type='submit' value='수정'>
 
   
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 