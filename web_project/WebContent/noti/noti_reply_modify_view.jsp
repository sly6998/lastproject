<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.noti.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	String NOTI_REPLY_MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
	List replylist = (List)request.getAttribute("replylist");
 	NotiBean ssibal =(NotiBean)request.getAttribute("ssibal");
 	NotiBean modify_reply = (NotiBean)request.getAttribute("modify_reply");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<!-- 공지사항 글 내용 부분 시작 -->
  <table cellpadding="0" cellspacing="0">
   <tr align="center" valign="middle">
    <td colspan="5">MVC 게시판</td>
   </tr>
   
   <tr>
    <td style="font-family:돋움; font-size:12" height="16">
     <div align="center">제목&nbsp;&nbsp;</div>
    </td>

    <td style="font-family:돋움; font-size:12">
     <%= ssibal.getNOTI_SUBJECT() %>
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
        <%= ssibal.getNOTI_CONTENT() %>
       </td>
      </tr>
     </table>
    </td>
   </tr>
   
  </table> 
  
<!-- 공지사항 글 내용 부분  끝 -->

  
  
   <tr bgcolor="cccccc">
    <td colspan="2" style="height:1px;"></td>
   </tr>
   <tr><td colspan="2">&nbsp;</td></tr>
   
   <hr size=5></hr>
  
  
  
  
  <!-- 댓글  시작  -->
 <table width=600>
    	
    		<%
       		  for (int i = 0; i < replylist.size(); i++) {
              NotiBean nrmv = (NotiBean)replylist.get(i);
   			%>
    		<tr> 
				<td style="border:0px solid #ddd; font-size:small; font-weight:bold; ">
					<%= nrmv.getNOTI_REPLY_MEMBER_ID() %>
				</td>
				
			   	<td style="border:0px solid #ddd; font-size:small;" align="left" width="350">
			   		<%= nrmv.getNOTI_REPLY_CONTENT() %>
			   	</td>
			   	
		   		<td style="border:0px solid #ddd; font-size:small;" align="right">
		   			<font color="#747474">
		   			<% if(nrmv.getNOTI_REPLY_DATE() == null){ %>
		   			-
		   			<% }else{ %>
		   			<%= nrmv.getNOTI_REPLY_DATE() %>
		   			<% } %>
		   			</font>
		   		</td> 
    		</tr>
    		<% } %>
   
    		<tr>
    			<td style="border:0px solid #ddd; font-size:small; font-weight:bold; " colspan=3>
    				<input style="width:400px; height:50px;" name="NOTI_REPLY_CONTENT" type="text" value="<%=modify_reply.getNOTI_REPLY_CONTENT()%>"/>
    				<input type="hidden" name="noti_reply_seq" value="<%=modify_reply.getNOTI_REPLY_SEQ()%>">
    				<input type="submit" value="수정완료">
				</form>
    			</td>
    		</tr>
    		
    		
 
    	</table>
</body>
</html>