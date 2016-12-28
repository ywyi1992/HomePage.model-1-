<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

table {
	widte:50% ;
/* 	align: 'center'; */
	margin:auto;
}
table,td,th{
border:1px solid black ;
border-collapse:collapse;

}
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

</style>
<script type="text/javascript">
function input(frm){
   if(frm.title.value==""){
	   alert("제목을 입력하시오");
	   frm.title.focus();
	   return false;
   }
}
function input(frm){
	   if(frm.content.value==""){
		   alert("내용을 입력하시오");
		   frm.content.focus();
		   return false;
	   }
	}


</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div>등록</div>
	<form name='frm' method='post' action='./createProc.jsp'
	onsubmit="return input(this)"
  
	>
		<table>
			<tr>
				<th>제목</th>
				<td><input type='text' name='title' size='30'placeholder="제목입력"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name='content' rows='10' cols='30'placeholder="내용입력"></textarea>
				</td>
			</tr>
		</table>


		<div>
			<input type='submit' value='전송'>
		</div>
	</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>