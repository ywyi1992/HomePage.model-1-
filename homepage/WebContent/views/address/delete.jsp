<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage=request.getParameter("nowPage");
	int no = Integer.parseInt(request.getParameter("no"));
	boolean flag = adao.delete(no);
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
}
</style>
<script type="text/javascript">
 function A(){
	var url="./list.jsp";
	 url+="?col=<%=col%>";
	 url+="&word=<%=word%>";
	 url+="&nowPage=<%=nowPage%>"
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div>
		<%
			if (flag) {
				out.print("성공");
		%>
			<div>
		<input type="button" value="목록" onclick="A()">
	</div>
		
		<%
			} else {
				out.print("실패");
		%>
			<div>
		<input type="button" value="목록" onclick="A()">
	</div>
		
		<%
			}
		%>
	</div>

	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
