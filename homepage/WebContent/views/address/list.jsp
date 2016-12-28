<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>



<%
Map map=new  HashMap();
String word= utility.checkNull(request.getParameter("word"));
String col= utility.checkNull(request.getParameter("col"));
if(col.equals("total")){
	word="";
}

int nowPage=1;
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage=5;
int totalRecord=adao.total(col, word);
int ano=((nowPage-1)*recordPerPage)+1;
int bno=(nowPage*recordPerPage);
map.put("col",col);
map.put("word",word);
map.put("ano",ano);
map.put("bno",bno);
List<AddressDTO> list=   adao.list(map);             
Iterator<AddressDTO> iter= list.iterator();
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
}

div {
	margin-top: 20px;
	margin-bottom: 20px;
	text-align: center;
}

a:link {
	color: #000000;
	text-decoration: none;
}

a:visited {
	color: #000000;
	text-decoration: none;
}

a:hover {
	color: #000000;
	text-decoration: none;
}

a:active {
	color: #000000;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function r(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href = url;

	}

	function d(no) {
		var url = 'delete.jsp';
		url += "?no=" + no;
		url +="&col=<%=col%>";
		url +="&word=<%=word%>";
		url+="&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function u1(no) {
 		var url = 'updateForm.jsp';
 		url += "?no=" + no;
 		url +="&col=<%=col%>";
 		url +="&word=<%=word%>";
 		url+="&nowPage=<%=nowPage%>";
 		location.href = url;

	}
</script>
<script type="text/javascript">
function a(f){
	alert
}
function A(){
	url="./createForm.jsp"
	location.href=url;
}

</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div class="title">리스트</div>
<div class ="search">
<form  name="f" method="post" action="list.jsp" onsubmit="return a(this)">
<select name="col">

<option value="name" <%if(col.equals("name"))
	                    out.print("selected='selected'");%>>이름</option>

<option value="phone" <%if(col.equals("phone"))
	                    out.print("selected='selected'");%>>전화번호</option>

<option value="address" <%if(col.equals("address"))
	                    out.print("selected='selected'");%>>주소</option>

</select>
<input type="text" name='word' value="<%=word%>">
<input type="submit" value="검색">
<input type="button" value="등록" onclick="A()">
</form>
</div>
<form method="post" onsubmit="return a(this)">
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
						<th>삭제/수정</th>
		</tr>
		<%
			if (list.size()==0) {
		%>
		<tr>
			<td colspan="6">등록된 팀정보가 없습니다.</td>



		</tr>
		<%
			} else {
				while(iter.hasNext()) {
					AddressDTO dto=iter.next();
				
		%>
		
		<tr>
			<td><%=dto.getNo()%></td>

			<td><a href="javascript:r('<%=dto.getNo()%>')"><%=dto.getName()%></a></td>
			<td><%=dto.getPhone()%></td>
			<td colspan="2"><a href="javascript:d('<%=dto.getNo()%>')"><input type="button" value="삭제" ></a>/
				<a href="javascript:u1('<%=dto.getNo()%>')"><input type="button"value="수정" ></a></td>

		</tr>
		<%
			} 
			}
		%>

	</table>
	</form>
	<div>
	   <%=utility.paging2(totalRecord, nowPage, recordPerPage, col, word) %>

	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>

</html>

