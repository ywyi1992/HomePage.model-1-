<%@ page contentType="text/html; charset=UTF-8"%>


<%
	int memono = Integer.parseInt(request.getParameter("memono"));
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
div{text-align: center;
margin-top:20px;
margin-bottom:20px;

}
</style>
<script type="text/javascript">
function A(){
	var url="./list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}


</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp"/>

<div>삭제확인</div>
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
<div>
삭제를 하면 복구 될수없습니다<br>
그래도 삭제 하시겠습니까?<br>
아니면 "목록"<br>
삭제하실꺼면 "삭제를"<br>
눌러주시기 바랍니다
<br><br>
<input type="submit" value="삭제">
<input type="button" value="목록"
onclick="A()">

</div>
</form>
	
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>






