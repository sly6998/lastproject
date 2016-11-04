<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.order.*"%>

<%
  String MEMBER_ID = null;
  if (session.getAttribute("MEMBER_ID") != null) {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
  }
  List orderlist = (List)request.getAttribute("orderlist");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
	<h3 >주문 내역 조회</h3>
	<table width="870">
      <!-- 빈공간(여백) -->
      <tr>
         <td style="border: 0px solid #000;" colspan="5" height="20px"></td>
      </tr>
      <tr align="center" style="border: 1px solid #ddd; background-color: #EFEFEF">
         <td
            style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 80px;"
            height="26">
            <div align="center">주문번호</div>
         </td>
         
         <td
            style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 80px;"
            height="26">
            <div align="center">주문자 ID</div>
         </td>

         <td style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="400" height="26">
            <div align="center">상품명</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="190" height="26">
            <div align="center">결제금액</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="100" height="26">
            <div align="center">주문일자</div>
         </td>
         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="100" height="26">
            <div align="center">주문상세 조회</div>
         </td>
      </tr>
      <%
         for (int i = 0; i < orderlist.size(); i++) {
            OrderBean ol = (OrderBean) orderlist.get(i);
      %>
      <!-- 내용 -->
      <tr align="center" valign="middle" style="border: 1px solid #ddd;"
         onmouseover="this.style.backgroundColor='#F8F8F8'">
         <td height="23"
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <%=ol.getORDER_TRADE_NUM() %>
         </td>
         
         <td height="23"
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <%=ol.getORDER_MEMBER_ID() %>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
           <%=ol.getORDER_ITEM_NAME()%>
         </a>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center"><%=ol.getORDER_ITEM_PRICE_SUM()%>
            </div>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center">
               <%=ol.getORDER_DATE()%></div>
         </td>

         <td
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center"><a href="./orderManagementDetail.html?trade_num=<%=ol.getORDER_TRADE_NUM() %>">조회</a>
            </div>
         </td>

      </tr>
      <%
         }
      %>
   </table>
	
</body>
</html>
