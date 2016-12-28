<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<% //검색
	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word="";
	}
//페이지	
	Map map= new HashMap();
	int nowPage=1;//현제 머물고있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage=Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordperpage=5;//한 블럭에 보여줄 페이지 갯수
//DB에서 갖고올 순번
    int ano= ((nowPage-1)*recordperpage)+1;
	int bno=(nowPage*recordperpage);
//맵에 넣어주는 곳
    map.put("ano",ano);
    map.put("bno",bno);
    map.put("col",col);
    map.put("word",word);
    int totalRecord = dao.total(col, word);
	List<BbsDTO> list = dao.list(map);
	Iterator<BbsDTO> iter = list.iterator();
	
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

.search {
	text-align: center;
	margin: 10px auto;
}
</style>

<script type="text/javascript">
	function r(no) {
		var url = "./read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>" ;
		url += "&word=<%=word%>" ;
		url +="&nowPage=<%=nowPage%>"
	
		location = url;
	}

</script>
<%-- 	url +="&filename=<%=filename%>" --%>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>


<!-- *********************************************** -->

<body>

	<jsp:include page="/menu/top.jsp" flush="false" />

	<!-- *********************************************** -->



	<DIV class="title">List</DIV>

	<div class="search">
		<form name="f" method="post" action="./list.jsp" onsubmit="return a(this)">
			<select name="col">
				<!--  검색할 컬럼 -->
				<option value="wname" 
				<%
				if(col.equals("wname")){
			       out.print("selected='selected'");		
				}
				
				%>
				>성명</option>
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
				value='등록' onclick="location.href='createForm.jsp'">
		</form>
	</div>


	<TABLE>


		<TR>

			<TH>번호</TH>
			<TH>닉네임</TH>
			<TH>제목</TH>
			<th>등록날짜</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>파일명</th>
			

		</TR>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="8">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {
				while (iter.hasNext()) {
					BbsDTO dto = iter.next();
		%>
		<tr>


			<td>
				<%
					for (int x = 0; x < dto.getIndent(); x++) {
								out.print("&nbsp;&nbsp;");

							}
							if (dto.getIndent() > 0) {
								out.print("└▶답변");
							}
				%> <%
 	if (dto.getIndent() == 0) {
 %> <%=dto.getNo()%> <%
 	}
 %> 
			</td>


			<td><a href="javascript:r('<%=dto.getNo()%>')"><%=dto.getWname()%></a>
			<%if(utility.compareDay(dto.getWdate().substring(0, 10))){ %>
			<img src="<%=root %>/menu/images/new.gif">
			<%} %>
			</td>
			<td><%=dto.getTitle()%></td>
			<td><%=dto.getWdate().substring(0, 10)%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getWdate() %></td>
			<td>
			<%if(dto.getFilename()==null){
			     out.print("파일없음");
			%><%}else{			
				 %>
				 	<a href="<%=root %>/download?dir=/views/bbs/storage&filename=<%=dto.getFilename()%>"><span class='glyphicon glyphicon-download-alt'></span></a>
				 <%}
				%>
			
			</td>
			
			
		</tr>




		<%
			}
			}
		%>


	</TABLE>



	<DIV class='bottom'>



		<%=utility.paging2(totalRecord, nowPage, recordperpage, col, word)%>

	</DIV>








	<!-- *********************************************** -->

	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>

<!-- *********************************************** -->

</html>
