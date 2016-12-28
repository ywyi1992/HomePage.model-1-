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
	if(f.id.value == ""){
		alert("아이디를 입력해 주세요");
		f.id.focus();
		return false;
	
	}
}

</script>
 
</head> 
 

<!-- *********************************************** -->

<body>

<!-- *********************************************** -->
 
 
 
<DIV class="title">ID 중복 확인</DIV>
 
 
 
<FORM name='frm' method='POST' action='./id_proc.jsp' onsubmit="return a(this)">
<div class="content">ID를 입력해주세요<br><br>

  <TABLE>
 
    <TR>
 
      <TH>ID</TH>
 
      <TD><input type="text" name="id" size="20">  <input type='submit' value='중복확인'></TD>
 
    </TR>
 
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
  
     
    <input type='button' value='닫기' onclick="window.close()">
 
  </DIV>
  </div>
</FORM>
 
 
 

 


<!-- *********************************************** -->


</body>

<!-- *********************************************** -->
 
</html> 
 