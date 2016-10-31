<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.basket.*"%>

<%
  String MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
  String MEMBER_NAME = "";
  List basketList = (List)request.getAttribute("basketList");
%>
<%-- <%
  String MEMBER_ID = "";
  if (session.getAttribute("MEMBER_ID") != "") {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
  }
  
  List boardList = (List)request.getAttribute("boardlist");
  int listcount = ((Integer)request.getAttribute("listcount")).intValue();
  int nowpage = ((Integer)request.getAttribute("page")).intValue();
  int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
  int startpage = ((Integer)request.getAttribute("startpage")).intValue();
  int endpage = ((Integer)request.getAttribute("endpage")).intValue();
%> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<style>
input{
text-align:center;
}
</style>
</head>
<body >
<h3 >장바구니</h3>

<table border="1">
      <tr>
        <td>사진</td>
        <td>제품명</td>
        <td>수량</td>
        <td>가격</td>
        <td>삭제</td>
      </tr>
	 <%
         for (int i = 0; i < basketList.size(); i++) {
        	 BasketBean bl = (BasketBean)basketList.get(i);
      %>
      <tr>
         <td>
         <img src="<%=bl.getBASKET_ITEM_IMAGE()%>" width="150">
         </td>
         <td>
         	<table>
         	  <tr>
         	    <td><a href="#"><%=bl.getBASKET_ITEM_NAME()%></a><td>
         	  </tr>
         	  <tr>
         	    <td>[옵션]<%=bl.getBASKET_ITEM_TYPE()%></td>
         	  </tr>
         	</table>
         </td>
         <td>
           <input type="text" name = "amount" size="1" class="num" value="<%=bl.getBASKET_AMOUNT()%>"><br>
 			<a href="./BasketModify.html?rownum=<%=bl.getBASKET_NUM()%>">수정</a>
         </td>
         <td>
           <span id="price">
           <%=bl.getBASKET_ITEM_PRICE()%>
           </span>
           
         </td>
         <td>
         	<a href="#">삭제</a>
         </td>
      </tr>
      <%
         }
      %>
    </table>

	
	
	
     

</body>
</html>
