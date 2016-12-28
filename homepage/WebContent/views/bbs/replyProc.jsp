<%@page import="oracle.net.aso.a"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>


<%
String upDir=application.getRealPath("/views/bbs/storage");
String tempDir=application.getRealPath("/views/bbs/temp");
UploadSave up=new UploadSave(request,-1,-1,tempDir);
dto.setNo(Integer.parseInt(up.getParameter("no")));
dto.setWname(UploadSave.encode(up.getParameter("wname")));
dto.setTitle(UploadSave.encode(up.getParameter("title")));
dto.setContent(UploadSave.encode(up.getParameter("content")));
dto.setPasswd(UploadSave.encode(up.getParameter("passwd")));
//답변
dto.setGrpno(Integer.parseInt(up.getParameter("grpno")));
dto.setIndent(Integer.parseInt(up.getParameter("indent")));
dto.setAnsnum(Integer.parseInt(up.getParameter("ansnum")));
//검색
String col = up.getParameter("col");
String word = UploadSave.encode(up.getParameter("word"));
String nowPage=up.getParameter("nowPage");
//파일업뢰드
FileItem fileItem=up.getFileItem("filename");
int filesize=(int)fileItem.getSize();
String filename=null;
if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
}
dto.setFilename(filename);
dto.setFilesize(filesize);
Map map= new HashMap();
map.put("grpno",dto.getGrpno());
map.put("ansnum",dto.getAnsnum());
dao.upansnum(map);
boolean flag=dao.replycreate(dto);

	
	
%>


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title></title>

<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">
function A(){
	var url="./list.jsp";
	url+="?col=<%=col%>"
    url+="&word=<%=word%>"
    url+="&nowPage=<%=nowPage%>";
	 location.href=url;
}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head>


<!-- *********************************************** -->

<body>

	<jsp:include page="/menu/top.jsp" flush="false" />

	<!-- *********************************************** -->


<div class="title">처리결과</div>

 <DIV class="content">
 <%

 if(flag){

 out.print("답변글이 등록되었습니다.");

 %>
 
		<DIV class='bottom'>
			<input type="button" value='계속입력' onclick="location.href='./replyForm.jsp'">

			<input type="button" value='목록' onclick="A()">


		</DIV>
 <%}else{

 out.print("답변글 등록이 실패했습니다.");

 %>
 
		<DIV class='bottom'>
		

			<input type="button" value='목록' onclick="A()">


		</DIV>
 <%}
 %>
 </DIV>




	<!-- *********************************************** -->

	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>

<!-- *********************************************** -->

</html>
