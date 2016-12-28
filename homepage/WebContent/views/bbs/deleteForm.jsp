<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
int no = Integer.parseInt(request.getParameter("no"));
boolean flag= dao.checkRefno(no);
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

function c(f){
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
		
	}

}
function b(){
	var url="./list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
	
}



</script>
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">삭제 확인</DIV>
 
 <div class="content">
 <%if(flag){ 
    out.print("답변있는 글이므로 삭제 할수 없습니다,<br>");
    out.print("<input type='button' value='다시시도' onclick='history.go(-2)'>");
 }else{%>
 
<FORM name='frm' method='POST' action="deleteProc.jsp" onsubmit="return c(this)">
 
  <TABLE>
 
    <TR>
 
      <TH>비밀번호:
      <input type="hidden"  name="no" value="<%=no %>" >
      <input type="hidden"  name="col" value="<%=request.getParameter("col") %>" >
      <input type="hidden"  name="word" value="<%=request.getParameter("word") %>" >
      <input type="hidden"  name="nowPage" value="<%=request.getParameter("nowPage") %>">
      <input type="hidden"  name="oldfile" value="<%=request.getParameter("oldfile") %>">
      </TH>
 
      <TD><input type="password" name="passwd" ></TD>

    </TR>
 
  </TABLE>
 
  <div class='bottom'><input type="submit" value='삭제' >
  <input type='button' value='목록' onclick="b()">
 </div>
    
</FORM>
</div>
<%}
%>
<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 