<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ include file="/ssi/ssi.jsp" %> 
<jsp:useBean id="dto" class="address.AddressDTO"/>
 <jsp:setProperty property="*" name="dto"/>
 
<%
int no = Integer.parseInt(request.getParameter("no"));
boolean flag=adao.update(dto);

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
 div{
 margin: auto;
 text-align: center;
 }
 </style> 
 <script type="text/javascript">
 function A(){
	 var url="list.jsp";
	 url+="?col=<%=request.getParameter("col")%>";
	 url+="&word=<%=request.getParameter("word")%>";
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
	 location.href=url;
 }
 
 </script>
 </head> 
 <body> 
 	<jsp:include page="/menu/top.jsp"/>
	
 <div>

 <%if(flag){
 out.print("성공");
 %>
 <br>
 <div>
 <input type="button" value="목록" onclick="A()">
</div>
<br>
 
 <%}else{
	 out.print("실패");
%>
<br>
<div>

 <input type="button" value="목록" onclick="A()">
</div>
<br>
<%}
 
 %>

 </div>

	
	<jsp:include page="/menu/bottom.jsp"/>
</body> 
 </html> 
