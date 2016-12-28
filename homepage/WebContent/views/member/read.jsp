<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String id = request.getParameter("id");
String grade=(String)session.getAttribute("grade");
if(id==null){
	id=(String)session.getAttribute("id");
	
}


	MemberDTO dto = bdao.read(id);


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
</style>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
 function updateFile() {
	var url="updateFileForm.jsp";
	url+="?id=<%=id%>";
	url+="&oldfile=<%=dto.getFname()%>";
	location.href=url;
}
 function updatePasswd() {
		var url="updatePasswdForm.jsp";
		url+="?id=<%=id%>";
	
		location.href=url;
	}
	 function update(){
		 var url="updateForm.jsp";
		 url+="?id=<%=id%>";
			url+="&col=<%=request.getParameter("col")%>";
			url+="&word=<%=request.getParameter("word")%>";
			url+="&nowPage=<%=request.getParameter("nowPage")%>";
		
			location.href=url;
	 }
	 function delete1(){
		var url="deleteForm.jsp";
		url+="?id=<%=id%>";
		url+="&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	 function mlist() {
		var url="<%=root%>/views/admin/list.jsp";
		url+="?col=<%=request.getParameter("col")%>";
		url+="&word=<%=request.getParameter("word")%>";
		url+="&nowPage=<%=request.getParameter("nowPage")%>";
		location.href=url;
	}
</script>
</head>


<!-- *********************************************** -->

<body>

	<jsp:include page="/menu/top.jsp" flush="false" />

	<!-- *********************************************** -->



	<DIV class="title"><%=dto.getMname()%>의 회원정보
	</DIV>



	<TABLE>
		<tr>
			<td colspan="2"><img src="<%=root %>/views/member/storage/<%=dto.getFname()%>">

			</td>
		</tr>
		<TR>

			<TH>ID</TH>

			<TD><%=dto.getId()%></TD>

		</TR>
		<TR>

			<TH>Name</TH>

			<TD><%=dto.getMname()%></TD>

		</TR>
		<TR>

			<TH>Email</TH>

			<TD><%=dto.getEmail()%></TD>

		</TR>
		<TR>

			<TH>Tel</TH>

			<TD><%=dto.getTel()%></TD>

		</TR>
		<TR>

			<TH>Zipcode</TH>

			<TD><%=dto.getZipcode()%></TD>

		</TR>
		<TR>

			<TH>Address1</TH>

			<TD><%=dto.getAddress1()%></TD>

		</TR>
		<TR>

			<TH>Address2</TH>

			<TD><%=dto.getAddress2()%></TD>

		</TR>
		<TR>

			<TH>Job</TH>

			<TD><%=utility.job(dto.getJob())%></TD>

		</TR>
		<TR>

			<TH>Date</TH>

			<TD><%=dto.getMdate()%></TD>

		</TR>


	</TABLE>



	<DIV class='bottom'>
	<%if(id!=null && grade.equals("A")){%>
			<input type="button" value="목록" onclick="mlist()">
			 <%}else{%>
			 
		<input type="button" value='정보수정' onclick="update()"> <input
			type='button' value='사진수정' onclick="updateFile()"> <input
			type='button' value='비밀번호수정' onclick="updatePasswd()"> <input
			type='button' value='탈퇴' onclick="delete1()">
		<%} %>
    <input type='button' value='다운로드'  
 
           onclick="location.href='<%=root %>/download?dir=/views/member/storage&filename=<%=dto.getFname()%>'"> 

	</DIV>







	<!-- *********************************************** -->

	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>

<!-- *********************************************** -->

</html>
