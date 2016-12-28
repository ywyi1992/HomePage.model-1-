<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%    

	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));
	if(col.equals("total")){
		word="";
	}
	
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	int recordPerPage = 5;
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int totalRecord = idao.total(col, word);
	List<ImageDTO> list = idao.list(map);
	Iterator<ImageDTO> iter = list.iterator();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function read(no){
	var url = "read.jsp";
	url += "?no="+no;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function down(filename){
	var url ="<%=root%>/download";
	url += "?dir=/views/image/storage";
	url += "&filename="+filename;
	location.href = url;
}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<jsp:include page="/menu/top.jsp" flush="false"/>

<DIV class="title">게시판 목록</DIV>
 <div class="content">
<FORM name='frm' method='POST' action='./list.jsp'>
	<select name="col">
		<option value="name"
		<%if(col.equals("name")) out.print("selected='selected'"); %>
		>이름</option>
		<option value="title"
		<%if(col.equals("title")) out.print("selected='selected'"); %>
		>제목</option>
		<option value="total">전체출력</option>
	</select>
	<input type="text" name="word" value="<%=word%>">
	<input type="submit" value="검색">
</FORM>
</div>
  <TABLE>
    <TR>
      <TH>번호</TH>
      <TH>이름</TH>
      <TH>제목</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일</TH>
      
    </TR>
    <%if(list.size()==0) {%>
    <tr>
    	<td colspan='6'>등록된 글이 없습니다.</td>
    </tr>
    <%}else{ %>
    	<%while(iter.hasNext()) {
    	ImageDTO dto = iter.next();%>
	    <tr>
	    	<td><%=dto.getNo() %></td>
	    	<td><%=dto.getName() %></td>
	    	<td><%
	for(int i=0;i<dto.getIno();i++){
		out.print("&nbsp;&nbsp;");
	}
	if(dto.getIno()>0){%>  
	<img src="<%=root %>/menu/images/1.png" width="30px" height="30px"> 
	<%} %>
    	<a href="javascript:read('<%=dto.getNo() %>')">
    	<%=dto.getTitle() %>
    	</a>
    	<%if(utility.compareDay(dto.getWdate())){%>
    	<img src="<%=root %>/menu/images/new.gif">
    	<%} %></td>
	    	<td><%=dto.getViewcnt() %></td>
	    	<td><%=dto.getWdate() %></td>
	    	<td><% if(dto.getFilename()==null){ 
    			out.print("-");
    	}else{%>
    		<a href="javascript:down('<%=dto.getFilename() %>')">
    		<span class='glyphicon glyphicon-download-alt'></span>
    		</a>
    	<%}
    	%></td>
	    </tr>
    <%} 
    }%>
  </TABLE>
  
  <DIV class='bottom'>
  	<input type="button" value="등록" onclick="location.href='createForm.jsp'">
    <%=utility.paging2(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>