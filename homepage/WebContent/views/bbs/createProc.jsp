<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>


<%

String upDir="/views/bbs/storage";
String tempDir="/views/bbs/temp";//임시 폴더
//폴더에 파일을 저장할 루트(위치,경로)를 성정해주는것
upDir=application.getRealPath(upDir);//절대경로
tempDir=application.getRealPath(tempDir);//절대경로
UploadSave up=new UploadSave(request,-1,-1,tempDir);

dto.setWname(UploadSave.encode(up.getParameter("wname")));
dto.setTitle(UploadSave.encode(up.getParameter("title")));
dto.setContent(UploadSave.encode(up.getParameter("content")));
dto.setPasswd(UploadSave.encode(up.getParameter("passwd")));


FileItem fileItem =up.getFileItem("filename");
String filename=null;
int filesize=(int)fileItem.getSize();
if(filesize>0){
	filename=UploadSave.saveFile(fileItem, upDir);
}
dto.setFilesize(filesize);
dto.setFilename(filename);


boolean flag=dao.create(dto);





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
function blist(){
	var url="./list.jsp";
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

 out.print("글이 등록되었습니다.");
%>
<br>
		<DIV class='bottom'>
			<input type="button" value='계속입력' onclick="location.href='createForm.jsp'">

			<input type="submit" value='목록' onclick="blist()">


		</DIV>

<% }else{

 out.print("글 등록이 실패했습니다.");
 %>
<br>
		<DIV class='bottom'>
	<input type="submit" value='목록' onclick="blist()">
		</DIV>
<%}

  

  

 %>
 </DIV>


	<!-- *********************************************** -->

	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>

<!-- *********************************************** -->

</html>
