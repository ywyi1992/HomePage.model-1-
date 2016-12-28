<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
String id=request.getParameter("id");
String passwd=request.getParameter("passwd");
boolean flag=bdao.login(id,passwd);
String grade=null;
if(flag){
	grade=bdao.getGrade(id);
	session.setAttribute("id",id);
	session.setAttribute("grade",grade);
	// ---------------------------------------------- 

    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 

    // ---------------------------------------------- 

    Cookie cookie = null; 

       

    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 

       

    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리

      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 

      cookie.setMaxAge(120);               // 2 분 유지 

      response.addCookie(cookie);          // 쿠키 기록 

   

      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  

      cookie.setMaxAge(120);               // 2 분 유지 

      response.addCookie(cookie);          // 쿠키 기록  

         

    }else{ 

      cookie = new Cookie("c_id", "");     // 쿠키 삭제 

      cookie.setMaxAge(0); 

      response.addCookie(cookie); 

         

      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 

      cookie.setMaxAge(0); 

      response.addCookie(cookie); 

   

    // --------------------------------------------- 
}
}
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
function use(){
	var url="<%=root%>/index.jsp";	
	
	window.close();
	opener.location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>


<!-- *********************************************** -->
 
 
 
<DIV class="title">로그인 처리</DIV>


 
 
  <DIV class='content'>
<%if(flag){
out.print("로그인이 성공했습니다<br><br>");
%> 
    <input type='button' value='홈'onclick="use()">
 <%}else{ 
	 out.print("로그인이 실패했습니다<br><br>");
 %>
    <input type='button' value='다시시도' onclick="history.back()">
 <%} %>
  </DIV>

 

 


<!-- *********************************************** -->



</body>

<!-- *********************************************** -->
 
</html> 
 