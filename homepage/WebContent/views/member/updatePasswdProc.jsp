<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
boolean flag=bdao.pwupdate(id,passwd);
session.invalidate();

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
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 


 
<DIV class="title">수정 처리 결과</DIV>
 
 <div class="content" >
<%if(flag){out.print("비밀번호가 수정 성공했습니다<br><br>");%>
<input type="button" value="로그인"  onclick="location.href='./loginForm.jsp'">
<input type="button" value="홈" onclick="location.href='<%=root%>/index.jsp'">
<%}else{ %>

<%} %> 
 </div>


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 