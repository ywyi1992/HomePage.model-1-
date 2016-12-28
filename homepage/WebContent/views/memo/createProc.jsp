<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="/ssi/ssi.jsp"%> 
<jsp:useBean  id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>


<%


boolean f= mdao.create(dto);
 %>
  
  
  
  
  
 
<!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
<!--  <title></title>  -->
 <style type="text/css"> 
 *{ 
   font-family: gulim; 
   font-size: 24px; 
 } 
 div{text-align:center; margin-top:100px;
 
 }
 
 </style> 
 </head> 
 <body> 
 	<jsp:include page="/menu/top.jsp"/>
	
 <div>
<%if(f){
	out.print("성공");
%>
  <br>
  <input type='button' value='계속 등록' onclick="location.href='./createForm.jsp'">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
<%}else{
	out.print("실패");
%>
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
<%}%>


 </div>
 
<jsp:include page="/menu/bottom.jsp"/>
</body> 
 </html> 
 