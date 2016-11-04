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
  List orderdetail = (List)request.getAttribute("orderdetail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>주문상품 상세조회</h3>
<p/>
<%
for (int i = 0; i < orderdetail.size(); i++) {
OrderBean ol = (OrderBean) orderdetail.get(i);
%>
주문자정보<p/>
주문자&nbsp;&nbsp;<%=ol.getORDER_MEMBER_NAME() %>&nbsp;&nbsp;&nbsp;&nbsp;주문일자&nbsp;&nbsp;<%=ol.getORDER_DATE() %><p/>
입금현황&nbsp;&nbsp;
<!--ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)-->
           <% if(ol.getORDER_TRADE_STATUS().equals("paid")){%>
           결제완료
           <%}else if(ol.getORDER_TRADE_STATUS().equals("ready")){%>
           미결제
           <%}else if(ol.getORDER_TRADE_STATUS().equals("cancelled")){%>
           결제취소
           <%}else if(ol.getORDER_TRADE_STATUS().equals("failed")){%>
           결제실패
           <%} %>
&nbsp;&nbsp;&nbsp;&nbsp;연락처&nbsp;&nbsp;<%=ol.getORDER_MEMBER_TEL() %><p/>
주문메모&nbsp;&nbsp;<%=ol.getORDER_MEMO() %><p/>


배송지정보<p/>
수취인&nbsp;&nbsp;<%=ol.getORDER_NAME() %>&nbsp;&nbsp;&nbsp;&nbsp;연락처&nbsp;&nbsp;<%=ol.getORDER_TEL() %><p/>
주소&nbsp;&nbsp;<%=ol.getORDER_ZIP() %><br>
<%=ol.getORDER_ADDR_1() %><br>
<%=ol.getORDER_ADDR_1() %><p/>

<%} %>
주문상품정보<p/>
사진&nbsp;&nbsp;	주문상품정보&nbsp;&nbsp;	수량&nbsp;&nbsp;	가격<p/>
<table>
<%
for (int i = 0; i < orderdetail.size(); i++) {
OrderBean ol = (OrderBean) orderdetail.get(i);
%>
	<tr align="center" valign="middle" style="border: 1px solid #ddd;">
    	<td height="23" style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <img src="<%=ol.getORDER_ITEM_IMG() %>" width="100">
        </td>

        <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
           <%=ol.getORDER_ITEM_NAME()%><br>
           옵션 > <%=ol.getORDER_ITEM_TYPE() %>
        </td>

        <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
        	<div align="center"><%=ol.getORDER_ITEM_AMOUNT()%></div>
        </td>

        <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <div align="center"><%=ol.getORDER_ITEM_PRICE_SUM()%></div>
        </td>
	</tr>
<%}%>
</table>


결제정보<p/>
주문번호&nbsp;&nbsp;	결제방법&nbsp;&nbsp;	결제금액&nbsp;&nbsp;<p>
<table>
<%
for (int i = 0; i < orderdetail.size(); i++) {
OrderBean ol = (OrderBean) orderdetail.get(i);
%>
	<tr align="center" valign="middle" style="border: 1px solid #ddd;">
    	<td height="23" style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
            <%=ol.getORDER_TRADE_NUM() %>
        </td>

        <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
          <!--card(신용카드) trans(실시간계좌이체) vbank(가상계좌) phone(휴대폰소액결제)-->
           <% if(ol.getORDER_TRADE_TYPE().equals("card")){%>
           신용카드
           <%}else if(ol.getORDER_TRADE_TYPE().equals("trans")){%>
           실시간계좌이체
           <%}else if(ol.getORDER_TRADE_TYPE().equals("vbank")){%>
           가상계좌
           <%}else if(ol.getORDER_TRADE_TYPE().equals("phone")){%>
           휴대폰소액결제
           <%} %>
        </td>

        <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
        	<div align="center"><%=ol.getORDER_ITEM_PRICE_SUM()%></div>
        </td>
	</tr>
<%}%>
</table>


두문취소	닫기

</body>
</html>