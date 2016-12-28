<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<% 
String col = request.getParameter("col");
String word = request.getParameter("word");
int no= Integer.parseInt(request.getParameter("no"));
    BbsDTO dto=dao.read(no);


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
 function A(f){
	 if(f.wname.value==""){
		alert("닉네임을 입력하시오");
		f.wname.focus();
		return false ;
		 
	 }
	 if(f.title.value==""){
			alert("제목을 입력하시오");
			f.title.focus();
			return false;
			}
	 if(f.content.value==""){
			alert("내용을 입력하시오");
			f.content.focus();
			return false;
			}
	 if(f.passwd.value==""){
			alert("비밀번호를 입력하시오");
			f.passwd.focus();
			return false;
			}
	
	 
	 
 }
 
 
 </script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">정보,내용수정</DIV>
 
 
 
<FORM name='frm' method='POST' action='updateProc.jsp'
       enctype="multipart/form-data"
 onsubmit="return A(this)">
 
  <TABLE>
  
 
    <TR>
 
      <TH>닉네임:<input type="hidden" name="no" value="<%=no%>">
    <input type="hidden" name="col" value="<%=col%>">
      <input type="hidden" name="word" value="<%=word%>">
      <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
      <input type="hidden" name="oldfile" value="<%=dto.getFilename()%>">
      </TH>
 
      <TD><input type="text" name="wname" value="<%=dto.getWname()%>"></TD>
 
    </TR>
        <TR>
 
      <TH>제목:</TH>
 
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
 
    </TR>
 
     <TR>
 
      <TH>내용:</TH>
 
 
      <TD><textarea rows="10" cols="45" name="content" ><%=dto.getContent()%></textarea></TD>
 
    </TR>
         <TR>
 
      <TH>비밀번호:</TH>

      <TD><input type='password' name="passwd" placeholder="비밀번호"></TD>
 
    </TR>
     <tr>
       <TH>파일:</TH>

      <TD><input type="file" name="filename" ><%=utility.checkNull(dto.getFilename())%></TD>
 
    </TR>

   
 
  </TABLE>
 
  
 
  <DIV class='bottom'>
 

 
    <input type="submit" value='수정완료' >
    <input type='button' value='취소' onclick="history.back()">
 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 