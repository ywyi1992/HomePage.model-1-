<%@ page contentType="text/html; charset=UTF-8"%>



<%
	String root = request.getContextPath();
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
%>



<html>

<head>

<style type="text/css">

nva, ul, li { margin:0; padding:0; }

.desplay {
	float:right;
	margin:0px 5px 3px 5px;
	padding:0 0 3px 0;
	box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-webkit-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-o-box-shadow: 0px 0px 15px rgba(0,0,0,.3);
	-moz-border-radius: 3px;
	-khtml-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	background-color:#5c5c5c;
}

.desplay ul li {
	float:left;
	list-style-type:none;
}

.desplay a {
	height:16px;
	color:#f1f1f1;
	font-family:arial;
	font-size:12px;
	padding:0 10px 0 10px;
	text-decoration:none;
}

.desplay a:hover {
	color:#D4F4FA;
	border-bottom:3px solid #FAED7D;
}
.desplay ul ul {
	display:none;
	position:absolute;
	background-color:#5c5c5c;
}

.desplay ul li:hover ul {
	display: block;
}

.desplay ul ul li {
	float:none;
}
</style>

</head>
<nav class="desplay">

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
</nav>
 <br><br><br><br>
 <br>
</body>