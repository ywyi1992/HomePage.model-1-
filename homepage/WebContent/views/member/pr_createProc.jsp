<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%  
String tempDir=application.getRealPath("/views/member/storage");
String upDir=application.getRealPath("/views/member/temp");
UploadSave up=new UploadSave(request,-1,-1,tempDir);
String id= UploadSave.encode(up.getParameter("id"));
String email= UploadSave.encode(up.getParameter("email"));
String str="";
if(bdao.duplicateId(id)){
	str="ID중복확인을 해주세요";
}else if(bdao.duplicateEmail(email)){
	str="Email중복 확인을 해주세요";
}else{
	request.setAttribute("up",up);

%>
<jsp:forward page="/views/member/createProc.jsp"/>
<!--request를 살려서 정하는 위치에서 response 가된다 -->
 <%

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
 
 
 
<DIV class="title">중복 확인 요청</DIV>
 <div class="content">
 <%= str%>
 </div>
 


 

<div class="bottom">
<input type="button" value="다시시도" onclick="history.back()">
</div>
<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 