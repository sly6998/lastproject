<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.review.*" %>
<%
 ReviewBean review=(ReviewBean)request.getAttribute("reviewdata");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">							

	<h3 class="p2">review(detail)</h3>
	<table cellpadding="0" cellspacing="0">
   <tr align="center" valign="middle">
    <td colspan="5">MVC 게시판</td>
   </tr>
   
   <tr>
    <td style="font-family:돋움; font-size:12" height="16">
     <div align="center">제목&nbsp;&nbsp;</div>
    </td>
 
    <td style="font-family:돋움; font-size:12">
     <%=review.getREVIEW_SUBJECT() %>
    </td>
   </tr>
   
   <tr bgcolor="cccccc">
    <td style="height:1px;" colspan="2">
    </td>
   </tr>
   
   <tr>
    <td style="font-family:돋움; font-size:12">
     <div align="center" valign="middle">내용</div>
    </td>
    <td style="font-family:돋움; font-size:12">
     <table border=0 width=490 height=250 style="table-layout:fixed">
      <tr>
       <td valign=top style="font-family:돋움; font-size:12">
        <%= review.getREVIEW_CONTENT() %>
       </td>
      </tr>
     </table>
    </td>
   </tr>
   
   <tr bgcolor="cccccc">
    <td colspan="2" style="height:1px;"></td>
   </tr>
   
   <tr><td colspan="2">&nbsp;</td></tr>
   
   <tr align="center" valign="middle">
    <td colspan="5">
     <font size=2>
      <a href="./review_modify_view.html?REVIEW_NUM=<%=review.getREVIEW_NUM() %>">[수정]</a>&nbsp;&nbsp;
      <a href="./ReviewDeleteAction.html?REVIEW_NUM=<%=review.getREVIEW_NUM() %>">[삭제]</a>&nbsp;&nbsp;
      <a href="./review_list.html">[목록]</a>&nbsp;&nbsp;
     </font>
    </td>
   </tr>
  </table>
    
</body>
</html>
