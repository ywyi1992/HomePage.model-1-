<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String upDir=application.getRealPath("/views/member/storage");
String tempDir=application.getRealPath("/views/member/temp");
String id=request.getParameter("id");
String oldfile=request.getParameter("oldfile");
boolean flag=bdao.delete(id);
if(flag){
	UploadSave.deleteFile(upDir, oldfile);
	session.invalidate();
 
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
 
 
 
<DIV class="title">삭제 처리 결과</DIV>
 
 <div class="content">
 <% if(flag){
 out.print("성공하였습니다");
 
 %>
  <DIV class='bottom'>
     <input type='button' value='홈' onclick="location.href='<%=root%>'">
   </DIV>
 <%}else{
	 out.print("실패하였습니다");
 %>
 <DIV class='bottom'>
     <input type='button' value='다시시도' onclick="history.back()">
   </DIV>
<%} %>
 </div>

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 