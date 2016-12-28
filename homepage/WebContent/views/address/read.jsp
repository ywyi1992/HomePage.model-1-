<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<%
	int no = Integer.parseInt(request.getParameter("no"));
   AddressDTO dto=adao.read(no);
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

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	margin: auto;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
div{
text-align: center;
margin: auto;
}

</style>
<script type="text/javascript">
function A(){
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
	
<div>팀정보</div>

	<table>
		<tr>
			<th>이름:</th>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<th>핸드폰번호:</th>
			<td><%=dto.getPhone()%></td>
		</tr>
		<tr>
			<th>우편번호:</th>
			<td><%=dto.getZipcode()%></td>
		</tr>
		<tr>
			<th>주소:</th>
			<td><%=dto.getAddress()%></td>
		</tr>
		<tr>
			<th>상세주소:</th>
			<td><%=dto.getAddress1()%></td>
		</tr>
		<tr>
			<th>날짜:</th>
			<td><%=dto.getWdate()%></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<th colspan="2"><input type="button" value="목록"
				onclick="A()"></th>
		</tr>
	</table>

	  <footer class="slide">
	</footer>

	
	<jsp:include page="/menu/bottom.jsp"/>

</body>
</html>
