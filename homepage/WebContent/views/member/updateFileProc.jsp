<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
String upDir= application.getRealPath("/views/member/storage");
String tempDir=application.getRealPath("/views/member/temp");
UploadSave up=new UploadSave(request,-1,-1,tempDir);
String id =up.getParameter("id");
String oldfile=UploadSave.encode(up.getParameter("oldfile"));

FileItem fileItem=up.getFileItem("fname");
String fname=null;
int size=(int) fileItem.getSize();
if(size>0){
	UploadSave.deleteFile(upDir,oldfile);
   fname=UploadSave.saveFile(fileItem, upDir);   
}
   boolean flag=bdao.updateFile(id,fname);
   if(id==null){
		id=(String)session.getAttribute("id");
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
 <script type="text/javascript">
 function read() {
	var url="read.jsp";
	url+="?id=<%=id%>";
	location.href=url;
}
 
 </script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
  
<DIV class="title">처리결과
</DIV>
<div class="content">
 
  <%if(flag){ out.print("사진을 변경했습니다");%>
 <input type="button" value="수정 확인" onclick="read()">
 <%}else{ %>
 <input type="button" value="다시시도" onclick="history.back()">
 
 <%}	 %>
</div>
<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 