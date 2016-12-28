<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
	
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");

	
	ImageDTO dto = idao.read(no);

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




function checkInput(f){
	
	if(f.name.value==""){
		alert("이름을 입력해주세요");
		f.name.focus();
		return false;
		
	}
	
	if(f.title.value==""){
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;
		
	}
	
	if(f.content.value==""){
		alert("내용을 입력해주세요");
		f.content.focus();
		return false;
		
	}
	
	if(f.passwd.value==""){
		alert("비밀번호을 입력해주세요");
		f.passwd.focus();
		return false;
		
	}
	if(f.filename.value==""){
		alert("파일을 입력해주세요");
		f.filename.focus();
		return false;
		
	}
}


</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 <jsp:include page="/menu/top.jsp" flush="false"/>
<DIV class="title">정보 수정</DIV>
 
<FORM name='frm' method='POST' action='./updateProc.jsp' enctype="multipart/form-data" onsubmit="return checkInput(this)">

<input type= "hidden" name="col" value =<%=col %>>
<input type= "hidden" name="word" value =<%=word %>>
<input type= "hidden" name="nowPage" value =<%=nowPage %>>
<input type= "hidden" name="no" value =<%=no %>>
<input type= "hidden" name="oldfile" value =<%=dto.getFilename() %>>


  <TABLE>
    <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" value="<%=dto.getName()%>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea name="content"><%=dto.getContent()%></textarea></TD>
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd" value="<%=dto.getPasswd()%>"></TD>
    </TR>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
