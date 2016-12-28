<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/ssi/ssi.jsp"%>
<jsp:setProperty property="*" name="mdao"/>

<%

   String col=request.getParameter("col");
   String word=request.getParameter("word");

	int memono = Integer.parseInt(request.getParameter("memono"));

	mdao.upviewcnt(memono);
	// -----------------------------------------------
	MemoDTO mdto1 = mdao.read(memono);
	String content = null;
	if (mdto1 != null) {
		content = mdto1.getContent();
		content = content.replaceAll("/r/n", "<br>");
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
	margin-top: 10px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script type="text/javascript">
	function mcreate() {
		var url = "createForm.jsp";
		
		location.href = url;
	}
	function mupdate(memono) {
		var url = "updateForm.jsp";
		url += "?memono=" + memono;
		url+="&col=<%=col%>";
			url+="&word=<%=word%>";
				url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mdelete(memono) {
		var url = "deleteForm.jsp";
		url += "?memono=" + memono;
		url+="&col=<%=col%>";
			url+="&word=<%=word%>";
				url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function mlist() {
		var url = "list.jsp";
		url+="?col=<%=col%>";
			url+="&word=<%=word%>";
				url+="&nowPage=<%=request.getParameter("nowPage")%>";

		location.href = url;
	}
</script>

</head>
<body>
	<jsp:include page="/menu/top.jsp"/>


	<div>조회</div>
	<table>
		<tr>
			<th>제목</th>
			<th><%=mdto1.getTitle()%></th>
		</tr>
		<tr>
			<th>내용</th>
			<th><%=mdto1.getContent()%></th>
		</tr>
		<tr>
			<th>조회수</th>
			<th><%=mdto1.getViewcnt()%></th>
		</tr>
		<tr>
			<th>등록일</th>
			<th><%=mdto1.getWdate()%></th>
		</tr>
	</table>
	<div>
		<input type="button" value="등록" onclick="mcreate()"> <input
			type="button" value="수정" onclick="mupdate('<%=mdto1.getMemono()%>')">
		<input type="button" value="삭제"
			onclick="mdelete('<%=mdto1.getMemono()%>')"> <input
			type="button" value="목록" onclick="mlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
<%
	}
%>