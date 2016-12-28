<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
String c_id = "";     // ID 저장 여부를 저장하는 변수, Y

String c_id_val = ""; // ID 값

 

Cookie[] cookies = request.getCookies(); 

Cookie cookie=null; 

  

if (cookies != null){ 

 for (int i = 0; i < cookies.length; i++) { 

   cookie = cookies[i]; 

  

   if (cookie.getName().equals("c_id")){ 

     c_id = cookie.getValue();     // Y 

   }else if(cookie.getName().equals("c_id_val")){ 

     c_id_val = cookie.getValue(); // user1... 

   } 

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
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>


<!-- *********************************************** -->
 
 
 
<DIV class="title">로그인</DIV>
 
 
 
<FORM name='frm' method='POST' action='<%=root %>/member/loginProc2.jsp'>
 
  <TABLE>
 
    <TR>
 
      <TH>아이디</TH>
 
      <TD><input type="text" name="id" value="<%=c_id_val %>">
      
       <% 

       if (c_id.equals("Y")){  // id 저장 상태라면 

       %>   

         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 

       <% 

       }else{ %> 

         <input type='checkbox' name='c_id' value='Y' > ID 저장 

       <% 

       } 

       %> 
      
      </TD>
 
    </TR>
 
  </TABLE>
    <TABLE>
 
    <TR>
 
      <TH>비밀번호</TH>
 
      <TD><input type="password" name="passwd"></TD>
 
    </TR>
 
  </TABLE>
 
  
 
  <DIV class='bottom'>
 
    <input type='submit' value='로그인'>
 
   
 
  </DIV>
 
</FORM>
 
 
 

 


<!-- *********************************************** -->


</body>

<!-- *********************************************** -->
 
</html> 
 