<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>



 <%
 String col=request.getParameter("col");
 String word=request.getParameter("word");
 int memono = Integer.parseInt(request.getParameter("memono"));

boolean f= mdao.delete(memono);
%>
<!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
 <title></title> 
 <style type="text/css"> 
 *{ 
   font-family: gulim; 
   font-size: 24px; 
 } 
 div{text-align: center;
margin-top:20px;
margin-bottom:20px;
 </style> 
 <script>
 function mlist(){
	var url="./list.jsp";
	url+= "?col=<%=col%>";
	url+= "&word=<%=word%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
  }
 
 
 </script>
 </head> 
 <body> 
 	<jsp:include page="/menu/top.jsp"/>

 <div>
<%
if(f){
	out.print("성공");
%>
<br>
  <input type="button" value="목록"onclick="mlist()">
<%}else{
	out.print("실패");
%>
<br>
  <input type="button" value="목록"onclick="mlist()">
<%}%>



 
</div>

	<jsp:include page="/menu/bottom.jsp"/>
</body> 

 </html> 

 