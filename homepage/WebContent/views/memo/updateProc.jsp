<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean f = mdao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin: auto;
}
</style>
<script type="text/javascript">
 function A(){
	 var url="list.jsp";
	 url+="?col=<%=request.getParameter("col")%>"
	 url+="&word=<%=request.getParameter("word")%>"
	 url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div>
		<%
			if (f) {
				out.print("성공");
		%>
		<input type="button" value="목록" onclick="A()">
		<%
			} else {
				out.print("실패");
		%>
		<input type="button" value="목록" onclick="A()">
		<%
			}
		%>
		

		<jsp:include page="/menu/bottom.jsp" />
	</div>
</body>
</html>
