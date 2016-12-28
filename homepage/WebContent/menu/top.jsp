<%@ page contentType="text/html; charset=UTF-8"%>



<%
	String root = request.getContextPath();
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
%>



<html>

<head>

<style type="text/css">
a:LINK{
color: black;
text-decoration: none; 
}
  

a:visited{     /* A 태그의 링크를 방문한 경우 */

   text-decoration: none;     /* 문자열 꾸미기값을 지정하지 않음, 밑줄 삭제 */

   color:black;              /* 글자색깔 검정 */

 }  
a:ACTIVE{
color:black;
text-decoration: none; 
}

.desplay{
box-shadow: 0px 0px 15px 0px rbga(0,0,0,.4);
background-color: gray;
border-radius: 3px;
padding-right:40px;
padding-bottom:40px;
float: left;
}
.desplay ul{
float:none;
list-style-type: none;
position: static;
}
.desplay ul li{
margin-right:20px;
float: left;
}
.desplay ul ul{
float:none;
display: none;
}
.desplay ul li:HOVER ul{
float:none;
display: block;
}
.desplay ul ul ul{
position:absolute;
}
.desplay ul ul ul li{
float:none;
display: none;
}

.desplay ul ul li:hover li{
float:none;
display: block;
}
</style>

</head>
<nav class="desplay">
<ul>
<li>Menu
<ul>
<li>Memo
<ul>
<li><a href="<%=root%>/views/memo/list.jsp">MemoList</a>
</li>
<li><a href="<%=root%>/views/memo/createForm.jsp">MemoCreate</a>
</li>
</ul>
</li>
<li>Address
<ul>
<li><a href="<%=root%>/views/address/list.jsp">AddressList</a></li>
<li><a href="<%=root%>/views/address/createForm.jsp">AddressCreate</a></li>
</ul>
</li>
<li>Member
<ul>
<%if(id==null){ %>
<li><a href="<%=root%>/views/member/loginForm.jsp">로그인</a></li>
<%}else{ %>
<li><a href="<%=root%>/views/member/logoutForm.jsp">로그아웃</a></li>
<%} %>
<li><a href="<%=root%>/views/member/agreement.jsp">회원가입</a></li>
<%if(id!=null && grade.equals("A")){ %>
<li><a href="<%=root%>/views/admin/list.jsp">리스트</a></li>
<%}else if(id!=null){%>
<li><a href="<%=root%>/views/member/read.jsp">회원정보</a></li>
<%} %>
</ul>
</li>
<li>BBS
<ul>
<li><a href="<%=root%>/views/bbs/list.jsp">BbsList</a></li>
<li><a href="<%=root%>/views/bbs/createForm.jsp">BbsCreate</a></li>
</ul>
</li>
<li>Image
<ul>
<li><a href="<%=root%>/views/image/list.jsp">ImageList</a></li>
<li><a href="<%=root%>/views/image/createForm.jsp">ImageCreate</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</nav>
 <br><br><br><br>
 <br>
</body>
<!-- 상단 메뉴 끝 -->