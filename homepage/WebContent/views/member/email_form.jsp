<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% %>
  
 
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
	if(f.email.value == ""){
		alert("Email을를 입력해 주세요");
		f.email.focus();
		return false;
	
	}
}

</script>
 
</head> 
 

<!-- *********************************************** -->

<body>

<!-- *********************************************** -->
 
 
 
<DIV class="title">Email 중복 확인</DIV>
 
 
 
<FORM name='frm' method='POST' action='./email_proc.jsp' onsubmit="return a(this)">
<div class="content">Email를 입력해주세요<br><br>

  <TABLE>
 
    <TR>
 
      <TH>ID</TH>
 
      <TD><input type="text" name="email" size="30">  <input type='submit' value='중복확인'></TD>
 
    </TR>
 
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
  
     
    <input type='button' value='취소' onclick="window.close()">
 
  </DIV>
  </div>
</FORM>
 
 
 

 


<!-- *********************************************** -->


</body>

<!-- *********************************************** -->
 
</html> 
 