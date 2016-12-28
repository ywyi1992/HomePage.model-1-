<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%  
String id=(String) session.getAttribute("id");
String grade=(String) session.getAttribute("grade");
boolean flag = bdao.update(dto);


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
	url +="?id=<%=dto.getId()%>";
	

	location.href=url;
}

function mlist() {
	var url="<%=root%>/admin/list.jsp";
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
 
 
 
<DIV class="title">처리결과</DIV>
<div class="content">
<%if(flag){
	out.print("성공했습니다");
	%>

  <DIV class='bottom'>
 
    <input type='button' value='정보확인' onclick="read()">
    
 
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
 
  </DIV>
 <%}else{ %>
out.print("실패했습니다");

  <DIV class='bottom'>
 
    <input type="button" value='다시시도' onclick="history.back()">
 
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
 
  </DIV>
<%} %>
 </div>
 <div class='bottom'>
 <%if(id!=null&&grade.equals("A")){ %>
 <input type="button" value="목록" onabort="mlist.jsp">
 <%} %>
</div>
 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 