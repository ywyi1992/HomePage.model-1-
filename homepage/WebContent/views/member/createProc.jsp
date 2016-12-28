<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<%
String upDir=application.getRealPath("/views/member/storage");
String tempDir=application.getRealPath("/views/member/temp");
UploadSave up=(UploadSave) request.getAttribute("up");
dto.setId(UploadSave.encode(up.getParameter("id")));
dto.setMname(UploadSave.encode(up.getParameter("mname")));
dto.setAddress1(UploadSave.encode(up.getParameter("address1")));
dto.setAddress2(UploadSave.encode(up.getParameter("address2")));
dto.setEmail(UploadSave.encode(up.getParameter("email")));
dto.setJob(UploadSave.encode(up.getParameter("job")));
dto.setPasswd(up.getParameter("passwd"));
dto.setZipcode(up.getParameter("zipcode"));
dto.setTel(up.getParameter("tel"));



FileItem fileItem=up.getFileItem("fname");
int size=(int)fileItem.getSize();
String fname=null;
if(size>0){
	fname=UploadSave.saveFile(fileItem, upDir);
}else{
	fname="member.jpg";
}

dto.setFname(fname);

boolean flag=bdao.create(dto);

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
function a(){
	var url="<%=root%>/views/member/loginForm.jsp";
	location.href=url;
}
function b(){
	var url="<%=root%>/index.jsp";
	location.href=url;
}

</script>
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">회원가입여부</DIV>
 
 
<div class="content">
<% if(flag){%>
     <%="아이디를 생성했습니다" %><br><br>
     <input type="button" value="로그인" onclick="a()">
     <input type="button" value="홈" onclick="b()">
<% }else{%>
   <%="아이디 생성에 실패 했습니다" %><br><br>
   <input type="button" value="다시시도" onclick="location.href='createForm.jsp'">
   <input type="button" value="홈" onclick="b()">
<%} %>
</div>
 

 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 