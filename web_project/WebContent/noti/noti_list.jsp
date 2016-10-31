<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.noti.*"%>

<%
  String MEMBER_ID = "";
  String MEMBER_NAME = "";
  if (session.getAttribute("MEMBER_ID") != null) {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
  }

  if (session.getAttribute("MEMBER_NAME") != null) {
  MEMBER_NAME =(String)session.getAttribute("MEMBER_NAME");
  }
  
  
  List boardList = (List)request.getAttribute("boardlist");
  int listcount = ((Integer)request.getAttribute("listcount")).intValue();
  int nowpage = ((Integer)request.getAttribute("page")).intValue();
  int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
  int startpage = ((Integer)request.getAttribute("startpage")).intValue();
  int endpage = ((Integer)request.getAttribute("endpage")).intValue();
  
  
  
//검색 기능용
String srchKey = (String)request.getAttribute("srchKey");
	if(srchKey == null){
		srchKey = "";
}

String srchFlds = (String)request.getAttribute("srchFlds");
	if(srchFlds == null){
		srchFlds = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/noti.js"></script>
</head>
<body>
<h3>공지사항</h3>
   <table width="870">
   
   <!-- 검색 기능 추가 -->
		<tr>
			<td colspan="5" align="right"><br/>
				<form name="srchForm" action="./noti_list.html" method="post">
					<select name="srchFlds">
						<option value="all"
							<%= srchFlds.equals("all")?"selected='selected'":"" %>>모두</option>
						<option value="sub"
							<%= srchFlds.equals("sub")?"selected='selected'":"" %>>제목</option>
						<option value="au"
							<%= srchFlds.equals("au")?"selected='selected'":"" %>>글쓴이</option>
						<option value="con"
							<%= srchFlds.equals("con")?"selected='selected'":"" %>>내용</option>
					</select> 
					<input type="text" name="srchKey" size="20" maxlength="50"
						value="<%= srchKey %>" /> <input type="button" value="검색"
						onClick="submitSrchForm()" /> <input type="button" value="리셋"
						onClick="resetSrchForm()" />
				</form> <br /></td>
			<td/>
		</tr>
   
      <!-- 항목 (번호/제목 / 글쓴이 / 날짜 / 조회수 ) -->
      <tr align="center" style="border: 1px solid #ddd; background-color: #EFEFEF">
         <td
            style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 80px;"
            height="26">
            <div align="center">번호</div>
         </td>

         <td style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="400" height="26">
            <div align="center">제목</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="190" height="26">
            <div align="center">글쓴이</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="100" height="26">
            <div align="center">날짜</div>
         </td>
         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="100" height="26">
            <div align="center">조회수</div>
         </td>
      </tr>
      
      <%
         for (int i = 0; i < boardList.size(); i++) {
            NotiBean bl = (NotiBean) boardList.get(i);
      %>
      <tr align="center" valign="middle" style="border: 1px solid #ddd;"
         onmouseover="this.style.backgroundColor='#F8F8F8'">
         <td height="23"
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <%=bl.getNOTI_NUM()%>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <a href="./noti_detail.html?NOTI_NUM=<%=bl.getNOTI_NUM()%>" style='text-decoration: none;'><%=bl.getNOTI_SUBJECT()%>
         </a>
         </td>
         

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center"><%=bl.getNOTI_MEMBER_NAME()%>
            </div>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center">
               <%=bl.getNOTI_DATE()%></div>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center"><%=bl.getNOTI_READCOUNT()%>
            </div>
         </td>

      </tr>
      
      <%
         }
      %>

      <!-- [이전] / [1] [2] [3] / [다음] -->
      <tr align="center" height="20">
         <td colspan="3"
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">


            <%
               if (nowpage <= 1) {
            %> [이전]&nbsp; <%
    } else {
 %> <a
            href="./noti_list.html?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
    }
 %> <%
    for (int a = startpage; a <= endpage; a++) {
       if (a == nowpage) {
 %> [<%=a%>] <%
    } else {
 %> <a
            href="./noti_list.html?page=<%=a%>">[<%=a%>]
         </a> &nbsp; <%
    }
 %> <%
    }
 %> <%
    if (nowpage >= maxpage) {
 %> [다음] <%
    } else {
 %> <a
            href="./noti_list.html?page=<%=nowpage + 1%>">[다음]</a> <%
    }
 %>


         </td>
         <%if(MEMBER_ID.equals("admin")){ %>
         <td colspan="2" align="right"><a href="./noti_write.html"> 글쓰기</a></td>
         <%}%>
      	</tr>
   </table>
</body>
</html>