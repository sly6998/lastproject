<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.noti.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String NOTI_REPLY_MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
 	NotiBean noti=(NotiBean)request.getAttribute("notidata");
	NotiBean noti2=(NotiBean)request.getAttribute("notidata2");
	NotiBean noti3 = (NotiBean)request.getAttribute("notidata3");
	List noti_reply = (List)request.getAttribute("notireplyviewlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <table cellpadding="0" cellspacing="0">
   <tr align="center" valign="middle">
    <td colspan="5">MVC 게시판</td>
   </tr>
   
   <tr>
    <td style="font-family:돋움; font-size:12" height="16">
     <div align="center">제목&nbsp;&nbsp;</div>
    </td>

    <td style="font-family:돋움; font-size:12">
     <%= noti.getNOTI_SUBJECT() %>
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
        <%= noti.getNOTI_CONTENT() %>
       </td>
      </tr>
     </table>
    </td>
   </tr>
   
  </table>
  
  
   <tr bgcolor="cccccc">
    <td colspan="2" style="height:1px;"></td>
   </tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   
   <hr size=5></hr>
  
  <!-- 댓글 -->
 <table width=600>
    	
    		<%
       		  for (int i = 0; i < noti_reply.size(); i++) {
              NotiBean notireplymodifyview = (NotiBean)noti_reply.get(i);
   			%>
    		<tr> 
				<td style="border:0px solid #ddd; font-size:small; font-weight:bold; ">
					<%= notireplymodifyview.getNOTI_REPLY_MEMBER_ID() %>
				</td>
				
			   	<td style="border:0px solid #ddd; font-size:small;" align="left" width="350">
			   		<%= notireplymodifyview.getNOTI_REPLY_CONTENT() %>
			   	</td>
			   	
		   		<td style="border:0px solid #ddd; font-size:small;" align="right">
		   			<font color="#747474">
		   			<% if(notireplymodifyview.getNOTI_REPLY_DATE() == null){ %>
		   			-
		   			<% }else{ %>
		   			<%= notireplymodifyview.getNOTI_REPLY_DATE() %>
		   			<% } %>
		   			</font>
		   		</td> 
		   		
		   		<td>
		   			<form name="noti_reply_modify_form" method="post" action="./NotiReplyModifyViewAction.html">
		   			<input type="hidden" name="NOTI_REPLY_SEQ" value="<%= notireplymodifyview.getNOTI_REPLY_SEQ() %>" />	
		   			<input type="hidden" name="NOTI_NUM" value="<%= noti3.getNOTI_NUM() %>" />
		   			<input type="submit" name="noti_reply_modify_form" value="수정">
		   			</form>
		   		</td>
		   		
    		</tr>
    		<% } %>
   
    		<tr>
    			<td>
    			<form name="noti_reply_write_form" method="post" action="./NotiReplyWriteAction.html">
    				<%=NOTI_REPLY_MEMBER_ID %>
    				<input type="hidden" name="NOTI_REPLY_MEMBER_ID" value="<%=NOTI_REPLY_MEMBER_ID %>"/>
    		 		<input type="hidden" name="NOTI_NUM" value="<%= noti2.getNOTI_NUM() %>" />		
    				
    			</td>
					    		 		    		 		
    			<td style="border:0px solid #ddd; font-size:small; font-weight:bold; " colspan=3>
    				<input style="width:400px; height:50px;" name="NOTI_REPLY_CONTENT" type="text" />
    				<input type="submit" name="noti_reply_write_form" value="등록">
				</form>	   
    			</td> 
    		</tr>
    		
    		
 
    	</table>
</body>
</html>