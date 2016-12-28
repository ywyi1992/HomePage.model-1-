<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%
String col=utility.checkNull(request.getParameter("col"));
String word=utility.checkNull(request.getParameter("word"));
if(col.equals("total")){
	word="";
}
int nowPage=1;
int recordPerPage=5;
if(request.getParameter("nowPage")!=null){
	nowPage=Integer.parseInt(request.getParameter("nowPage"));
}
int ano = ((nowPage-1)*recordPerPage)+1;
int bno = (nowPage*recordPerPage);

Map p=new HashMap();
p.put("col",col);
p.put("word",word); 
p.put("ano",ano);
p.put("bno",bno);
int total=bdao.total(col,word);
List<MemberDTO> list=bdao.list(p);
Iterator<MemberDTO> iter=list.iterator();
String paging=utility.paging2(total, nowPage, recordPerPage, col, word);

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
.search {
	text-align: center;
	margin: 10px auto;
}
 
</style> 
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
 <script type="text/javascript">
 function read(id,passwd){
 var url="<%=root%>/views/member/read.jsp";
 url+="?id="+id;
 url+="&col=<%=col%>";
 url+="&word=<%=word%>";
 url+="&nowPage=<%=nowPage%>";
 url+="&passwd="+passwd;
 location=url;
 
 
 }
 function a() {
	var url="<%=root%>/views/member/createForm.jsp";
	 location.href=url;
	 
}
 </script>
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 
<DIV class="title">List</DIV>
 
 
<div class="search"> 
<FORM name='frm' method='POST' action='./list.jsp'>
 
 <select name="col">
 <option value="mname"  <% if(col.equals("mname")){ out.print("selected='selected'"); }%> >Name</option>
 
 <option value="email" <% if(col.equals("email")){ out.print("selected='selected'"); }%> >Email</option>
 <option value="id" <% if(col.equals("id")){ out.print("selected='selected'"); }%> >ID</option>
 <option value="total">All</option> 
 </select>
 <input type="text" name="word"  placeholder="검색어를 입력해 주세요" value="<%=word%>">
 <input type="submit" value="검색">
 <input type="button" value="회원가입" onclick="a()">

</FORM>
 
 </div>
  
 
 
 <%
	 

 while(iter.hasNext()){
	 MemberDTO dto=iter.next();
 
	 %>
 
  <TABLE>
 
    <TR>
 
      <Td rowspan="6">
      <%if(dto.getFname()!=null){ %>
       <img src='<%=root%>/views/member/storage/<%=dto.getFname()%>'  width="250px" height="250px">
       <%}else{ %>
        <img src='<%=root%>/views/member/storage/member.jpg'>
       <%} %>
       </Td>
       <th>Name</th>
      <Td><a href="javascript:read('<%=dto.getId()%>','<%=dto.getPasswd()%>')"><%=dto.getMname() %></a></Td>
      
    </TR>
    <TR>
         
      <TH>Id</TH>
 
      <TD><%=dto.getId() %></TD>
 
    </TR>
    <TR>
 
      <TH>Tel</TH>
 
      <TD><%=dto.getTel() %></TD>
 
    </TR>
<TR>
 
      <TH>Email</TH>
 
      <TD><%=dto.getEmail() %></TD>
 
    </TR>
    <TR>
 
      <TH>Job</TH>
 
      <TD><%=utility.job(dto.getJob()) %></TD>
 
    </TR>
    <tr>
      <TH>Date</TH>
 
      <TD><%=dto.getMdate()%></TD>
 
    </TR>   
  
  
  </TABLE>
 <%} %>
  
 
  <DIV class='bottom'>
 <%=paging %>

 
  </DIV>
 

 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 