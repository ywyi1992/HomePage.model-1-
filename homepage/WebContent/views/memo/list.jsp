<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<%
//페이지관련
int nowPage=1;//현제페이지
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));//번호를 변경할때 필요한 소스
}
int recordPerPage=5;//레코드갯수
//DB에서 읽어올 시작순번과 끝순번생성
int ano= ((nowPage-1)*recordPerPage)+1;
int bno= nowPage * recordPerPage;


String col = utility.checkNull(request.getParameter("col"));
String word = utility.checkNull(request.getParameter("word"));

if(col.equals("total")){
	word="";
}
Map p= new HashMap();
p.put("ano",ano);
p.put("bno",bno);
p.put("col",col);
p.put("word",word);


List<MemoDTO> list=mdao.list(p);
int total=mdao.total(col, word);
String paging=utility.paging2(total, nowPage, recordPerPage, col, word);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
a:LINK {
color:#000000;
text-decoration: none;
}
a:visited{
color:#000000;
text-decoration: none;
}
a:hover{
color:#ff0000;
text-decoration:none;
}
a:ACTIVE{
color:#000000;
text-decoration: none;

}
* {
	font-family: gulim;
	font-size: 20px;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
div{
text-align: center;
margin: auto;
}
table{
text-align: center;
margin: auto;
}
.search {
	text-align: center;
	margin: 10px auto;
}
</style>

<script type="text/javascript">
function read(memono){
var url="./read.jsp";
url+="?memono="+memono;
url+="&col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
location.href=url;
}

</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div>메모 목록</div>
	<div class="search">
		<form name="f" method="post" action="./list.jsp" >
			<select name="col">
				<!--  검색할 컬럼 -->
		
				<option value="title"
				<%
				if(col.equals("title")){
			       out.print("selected='selected'");		
				}
				
				%>
				
				>제목</option>
				<option value="content"
				<%
				if(col.equals("content")){
			       out.print("selected='selected'");		
				}
				
				%>
				>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<!--  검색어 -->
			<input type="submit" value="검색"> <input type='button'
				value='등록' onclick="location.href='./createForm.jsp'">
				
		</form>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			if (list.size()==0) {
		%>
		<tr>
			<td colspan="4">등록된 메모가 없습니다.</td>
		</tr>

		<%
			} else {
		%>
		<%
			for(int i=0; i<list.size(); i++) {
				MemoDTO mdto1=list.get(i);
		%>
		<tr>
			<td><%=mdto1.getMemono()%></td>
			<td><a href="javascript:read('<%=mdto1.getMemono()%>')"><%=mdto1.getTitle()%></a></td>
			<td><%=mdto1.getWdate()%></td>
			<td><%=mdto1.getViewcnt()%></td>
		</tr>
		<%} 
		}%>
	</table>
	<div>
	
		<%=paging%>
		

	</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
