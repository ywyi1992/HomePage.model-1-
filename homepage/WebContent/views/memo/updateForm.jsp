<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<%
	int memono = Integer.parseInt(request.getParameter("memono"));

MemoDTO mdto1=mdao.read(memono);
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

table {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	function A() {
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
	
	<div>수정</div>
	<form name='frm' method='post' action='./updateProc.jsp'
		onsubmit="return input(this)">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<table>
			<tr>
				<th>제목</th>
				<td><input type='text' name='title' size='30'
					value="<%=mdto1.getTitle()%>"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name='content' rows='10' cols='30'><%=mdto1.getContent()%></textarea></td>
			</tr>
		</table>


		<div>
			<input type='submit' value='수정'>
			<input type="button" value='목록' onclick="A()"> 
		</div>
	</form>
	
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
