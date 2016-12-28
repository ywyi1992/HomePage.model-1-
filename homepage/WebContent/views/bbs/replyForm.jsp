<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ include file="/ssi/ssi.jsp" %>
 <%

	
 int no = Integer.parseInt(request.getParameter("no"));
 BbsDTO dto=dao.replyread(no);
 
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
 
 
 
<DIV class="title">등록</DIV>
 
 
<FORM name='frm' method='POST' action='replyProc.jsp'
 enctype="multipart/form-data">
<!--  답변을 등록하기위해서 -->
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<!--페이지와 검색 유지를위해서-->
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<!--  부모글 삭제를 막기위해서  -->
<input type="hidden"  name="no" value=<%=no%>>   
  <TABLE>
 
    <TR>
 
      <TH>닉네임</TH>
 
      <TD><input type="text" name="wname" placeholder="닉네임"></TD>
 
    </TR>
     
    <TR>
 
      <TH>답변 제목</TH>
 
      <TD><%=dto.getTitle()%></TD>
 
    </TR>
     
    <TR>
    <TR>
 
      <TH>제목</TH>
 
      <TD><input type="text" name="title" placeholder="제목"></TD>
 
    </TR>
     
    <TR>
 
      <TH>내용:</TH>
 
      <TD><textarea rows="10" cols="45" name="content" placeholder="내용입력"></textarea></TD>
 
    </TR>
    <TR>
 
      <TH>비밀번호</TH>
 
      <TD><input type="password" name="passwd" placeholder="비밀번호입력"></TD>
 
    </TR>
       <tr>
         <TH>파일</TH>
 
      <TD><input type="file" name="filename" ></TD>
 
    </TR>
   
 
  </TABLE>
 
  <DIV class='bottom'>
 
    <input type='submit' value='등록'>
 
    <input type="reset" value='다시입력'>
    <input type="button" value="취소" onclick="history.back()">
 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 