<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<% 



String upDir="/views/bbs/storage";
String tempDir="/views/bbs/temp";//임시 폴더
//폴더에 파일을 저장할 루트(위치,경로)를 성정해주는것
upDir=application.getRealPath(upDir);//절대경로
tempDir=application.getRealPath(tempDir);//절대경로
UploadSave up=new UploadSave(request,-1,-1,tempDir);

String col =up.getParameter("col");
String word = UploadSave.encode(up.getParameter("word"));
String nowPage= up.getParameter("nowPage");
String oldfile= UploadSave.encode(up.getParameter("oldfile"));
dto.setNo(  Integer.parseInt(up.getParameter("no")));
dto.setWname(UploadSave.encode(up.getParameter("wname")));
dto.setTitle(UploadSave.encode(up.getParameter("title")));
dto.setContent(UploadSave.encode(up.getParameter("content")));
dto.setPasswd(UploadSave.encode(up.getParameter("passwd")));
FileItem fileItem=up.getFileItem("filename");
String filename=null;

int filesize=(int) fileItem.getSize();
if(filesize>0){
	utility.deleteFile(oldfile,upDir);
	filename=UploadSave.saveFile(fileItem, upDir);
}
dto.setFilename(filename);
dto.setFilesize(filesize);
boolean flag=false;
Map map= new HashMap();
map.putIfAbsent("no",dto.getNo());
map.putIfAbsent("passwd",dto.getPasswd());
boolean pflag=dao.passwdcheck(map);

if(pflag){
	flag=dao.update(dto);
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
div{
text-align: center;
}
 
</style> 
 <script type="text/javascript">
 function blist(){
	 url="./list.jsp";
		url+="?col=<%=col%>";
			url+="&word=<%=word%>";
			url+="&nowPage=<%=nowPage%>";
		
	 location=url;
 }
 function a(no) {
	 url="./read.jsp";
		url+="?col=<%=col%>";
			url+="&word=<%=word%>";
			url+="&nowPage=<%=nowPage%>";
		url+="&no="+no;
	 location=url;
	
}
 </script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">처리결과</DIV>
<div class="content">
<%
if(pflag==true && flag==true){
	out.print("수정 성공");
%>	
<div>

<input type="button" value="수정확인" onclick="a('<%=dto.getNo()%>')">
<input type="button" value="목록" onclick="blist()">
</div>
<%}else if(pflag==false){
	out.print("비밀번호가 다릅니다");
%>
<div>
<input type="button" value='다시시도' onclick="history.back()">
<input type="button" value="목록" onclick="blist()">
</div>

<%}else if(flag==false){
	out.print("수정이 실패했습니다");
%>
<div>

<input type="button" value='뒤로가기' onclick="blist()">

</div>
<%}


%>

</div>








<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 