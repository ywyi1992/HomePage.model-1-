<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String id= request.getParameter("id");
if(id==null){
	id=(String)session.getAttribute("id");
}
String oldfile=request.getParameter("oldfile");
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
 
 
 
<DIV class="title">삭제페이지</DIV>
 
 
 
<FORM name='frm' method='POST' action='./deleteProc.jsp' > 
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="oldfile" value="<%=oldfile%>">
 
 <div class="content" >
  삭제를 하시면 불이익이 있을수 있습니다 
 </div>
 
  
 
  <DIV class='bottom'>
 
    <input type='submit' value='삭제'>
 
    <input type='button' value='뒤로가기' onclick="history.back()">
 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 