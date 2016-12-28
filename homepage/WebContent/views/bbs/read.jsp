<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	BbsDTO dto = dao.read(no);
	
	dao.upviewcnt(no);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
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

.A {
	
}
</style>

<script type="text/javascript">
	function bdelete() {
		var url = "./deleteForm.jsp";
		url += "?no=<%=no%>";
		url+="&col=<%=col%>";
		url+="&word=<%=word%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		url+="&oldfile=<%=dto.getFilename()%>";
		location.href = url;
	}
	function bupdate(no) {
		var url = "./updateForm.jsp";
		url += "?no=" + no;
		url+="&col=<%=col%>";
	    url+="&word=<%=word%>";
	    	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	    
		location.href = url;
	}
	function re(no) {
		var url = "./replyForm.jsp";
		url += "?no=" + no;;
		url+="&col=<%=col%>"
		url+="&word=<%=word%>";
	    url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function blist(){
		var url="./list.jsp";
		url+="?col=<%=col%>";
		url+="&word=<%=word%>";
	    url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>


<!-- *********************************************** -->

<body>

	<jsp:include page="/menu/top.jsp" flush="false" />

	<!-- *********************************************** -->



	<DIV class="title">Read</DIV>



	<FORM name='frm' method='POST'>

		<TABLE>

			<TR>

				<TH>닉네임:</TH>
				<td><%=dto.getWname()%></td>



			</TR>
			<TR>


				<TH>제목:</TH>
				<td><%=dto.getTitle()%></td>



			</TR>

			<tr>
				<th>내용:</th>
				<td><%=dto.getContent()%></td>


			</tr>

			<tr>
				<th>날짜:</th>
				<td><%=dto.getWdate().substring(0, 10)%></td>

			</tr>
			<tr>
				<th>조회수:</th>
				<td><%=dto.getViewcnt()%></td>
			</tr>
			<tr>
				<th>파일:</th>
				<%if(dto.getFilename()==null){%>
					<td>파일없음</td>
					<%
				}else{
				%>
				
				<td>
				
				<%=dto.getFilename()%>
				<a href="<%=root %>/download?dir=/views/bbs/storage&filename=<%=dto.getFilename()%>"><span class='glyphicon glyphicon-download-alt'></span></a></td>
			<%} %>
			</tr>
			<tr>
				<th>파일용량:</th>
				<td><%=dto.getFilesize() / 1024%>KB</td>
			</tr>


		</TABLE>



		<DIV class='bottom'>

			<input type='button' value='수정' onclick="bupdate('<%=no%>')">
			<input type="button" value='삭제'onclick="bdelete()"> <input
				type="button" value='답변' onclick="re('<%=no%>')"> <input
				type="button" value='목록' onclick="blist()">

		</DIV>

	</FORM>







	<!-- *********************************************** -->

	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>

<!-- *********************************************** -->

</html>
