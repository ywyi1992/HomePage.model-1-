<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% int no = Integer.parseInt(request.getParameter("no"));
String passwd=request.getParameter("passwd");
String col = request.getParameter("col");
String word = request.getParameter("word");
String oldfile = request.getParameter("oldfile");

Map map= new HashMap();
map.putIfAbsent("no",no);
map.putIfAbsent("passwd",passwd);
boolean pflag=dao.passwdcheck(map);
boolean flag=false;
if(pflag){
	flag=dao.delete(no);
}
if(flag){
	String upDir=application.getRealPath("/views/bbs/storage");
	utility.deleteFile(oldfile, upDir);

}

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
function blist(){
	var url="./list.jsp";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}


</script>
 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
 
</head> 
 

<!-- *********************************************** -->

<body>

<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- *********************************************** -->
 
 
 

 
 
<DIV class="title">정보처리</DIV>
<div class="content">
<%
if(pflag==false){
	out.print("패스워드가 일치하지 않습니다.");
%>	
<div>
<input type="button" value='다시시도' onclick="history.back()">
<input type="button" value="목록" onclick="blist()">
</div>
<%}else if(flag){
	out.print("글을 삭제하였습니다");

%>
<div><input type="button" value="목록" onclick="blist()"></div>
<%}else{
	out.print("글을 삭제하지 못했습니다");
%>
<div><input type="button" value="목록" onclick="blist()"></div>
<%} %>
</div>
 
 

 


<!-- *********************************************** -->

<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>

<!-- *********************************************** -->
 
</html> 
 