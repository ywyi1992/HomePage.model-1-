<%@ page contentType="text/html; charset=UTF-8" %> 
 <%@ include file="/ssi/ssi.jsp" %> 
 <jsp:useBean id="dto" class="address.AddressDTO"/>
<jsp:setProperty property="*" name="dto"/>
 

 <%
 boolean flag =adao.create(dto);
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
 text-align: center;}
 </style> 
 </head> 
 <body> 
 	<jsp:include page="/menu/top.jsp"/>
	
<div> <%
 if(flag){
	 out.print("성공");
	 
 }else{
	 out.print("실패");
 }
 %></div>
 <div>
 <input type="button" value="목록"
 onclick="location.href='./list.jsp'">
 

 </div>
 	<jsp:include page="/menu/bottom.jsp"/>
</body> 
 </html> 
