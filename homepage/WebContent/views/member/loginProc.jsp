<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
boolean flag=bdao.login(id,passwd);
String grade=null;
if(flag){
	grade=bdao.getGrade(id);
	session.setAttribute("id",id);
	session.setAttribute("grade",grade);
	
}
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
 
 
 
<DIV class="title">로그인 처리</DIV>


 
 
  <DIV class='content'>
<%if(flag){
out.print("로그인이 성공했습니다<br><br>");
%> 
    <input type='button' value='홈'onclick="location.href='<%=root%>/index.jsp'">
 <%}else{ 
	 out.print("로그인이 실패했습니다<br><br>");
 %>
    <input type='button' value='다시시도' onclick="history.back()">
 <%} %>
  </DIV>

 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 