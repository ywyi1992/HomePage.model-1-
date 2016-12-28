<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="Utility.*" %>
<%@ page import="memo.*" %>
<jsp:useBean id="mdao" class="memo.MemoDAO"/>
<%@ page import="address.*" %> 
<jsp:useBean id="adao" class="address.AddressDAO"/> 
<%@ page import="member.*" %>
<jsp:useBean id="bdao" class="member.MemberDAO"/>
<%@ page import ="bbs.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/> 
<%@ page import ="image.*" %>
<jsp:useBean id="idao" class="image.ImageDAO"/> 



<%
	request.setCharacterEncoding("utf-8");
String root=request.getContextPath();
%>

