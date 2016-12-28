<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 

String id=request.getParameter("id");

String oldfile=request.getParameter("oldfile");
String upDir=application.getRealPath("/views/member/storage");
String tempDir=application.getRealPath("/views/member/temp");



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
#a{
background-color:yellow;
color: black;
}

</style> 
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 <script type="text/javascript">
 function a(f) {
	if(f.fname.value==""){
		alert("수정할 파일을 업로드 해주세요");
		f.fname.focus();
		return false;
	}
}
 </script>
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">사진 수정</DIV>
 
 
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return a(this)">
 <input type="hidden" name="id"value="<%=id%>">
 <input type="hidden" name="oldfile"value="<%=oldfile%>">
  <input type="hidden" value="<%=request.getParameter("word")%>" name="word">
 <input type="hidden" value="<%=request.getParameter("col")%>" name="col">
 <input type="hidden" value="<%=request.getParameter("nowPage")%>" name="nowPage">
  <TABLE>
 
    <TR>
 
      <TH id="a">원본 파일</TH>
       
      <TD><img src="./storage/<%=oldfile%>"></TD>
 
    </TR>
 <tr>
 <th>수정 사진</th>
 <td><input type="file" name="fname"></td>
 </tr>
 
 
 
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
    <input type='submit' value='수정 하기'> 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 