<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.order.*"%>

<%
  List basketlist = (List)request.getAttribute("basketlist");
  OrderBean memberlist = (OrderBean)request.getAttribute("memberlist");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
/* 
아임포트 계정 : testbuyer@test.com / q!123456
*/
/* card(신용카드)
trans(실시간계좌이체)
vbank(가상계좌)
phone(휴대폰소액결제)
kpay(KPay앱 직접호출 / 이니시스 전용)
cultureland(문화상품권 / 이니시스 전용)
smartculture(스마트문상 / 이니시스 전용)
happymoney(해피머니 / 이니시스 전용) */





function buyfunction(){
	var select = document.getElementById("buytype");
	var buytype_value = select.options[select.selectedIndex].value;
	var price_sum = $('#price_sum').val();
	var membername = $('#membername').val();
	var memberphone = $('#memberphone').val();
	var memberemail = 'test@test.com';
	
	
	location.href='./buyersystem.jsp?buytype='+buytype_value+'&price_sum='+price_sum+'&membername='+membername+'&memberphone='+membername+'&memberemail='+memberemail;
}
</script>


<title>Insert title here</title>
</head>
<body>

<h2>결제 페이지</h2>
<form method="post" name="buyform">

<span>주문상품</span>
	<table>
		<tr>
			<td>제품 이미지</td>
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
		</tr>
		<%
         for (int i = 0; i < basketlist.size(); i++) {
        	 OrderBean ol = (OrderBean)basketlist.get(i);
        %>
		<tr>
			<td><img src="<%=ol.getORDER_ITEM_IMG()%>" width="100"></td>
			<td>
				<%=ol.getORDER_ITEM_NAME()%><input type="hidden" name="item_name" value="<%=ol.getORDER_ITEM_NAME()%>"><br>
				옵션> <%=ol.getORDER_ITEM_TYPE() %>
			</td>
			<td><%=ol.getORDER_ITEM_AMOUNT() %></td>
			<td><%=ol.getORDER_ITEM_PRICE() %></td>
		</tr>
		<tr>
		<td><sapn>총 결제 금액 : <%=ol.getORDER_ITEM_PRICE_SUM() %><input type="hidden" id="price_sum" name="price_sum" value="<%=ol.getORDER_ITEM_PRICE_SUM() %>"></sapn></td>
		</tr>
		<%}%>
	</table>

	<span>주문자정보</span>
	<table>
		<tr>
			<td>이름</td>
			<td><%=memberlist.getORDER_MEMBER_NAME() %><input type="hidden" id="membername"name="membername" value="<%=memberlist.getORDER_MEMBER_NAME() %>"></td>
			<td>연락처</td>
			<td><%=memberlist.getORDER_MEMBER_TEL() %><input type="hidden" id="memberphone" name="memberpone" value="<%=memberlist.getORDER_MEMBER_TEL() %>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="buyemail" id="buyemail" value="<%=memberlist.getORDER_MEMEBER_EMAIL() %>"></td>
		</tr>
	</table>
	
	<span>배송지 정보</span>
	<table>
		<tr>
			<td>이름</td>
			<td><%=memberlist.getORDER_MEMBER_NAME() %></td>
			<td>연락처</td>
			<td><%=memberlist.getORDER_MEMBER_TEL() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=memberlist.getORDER_MEMBER_ZIP() %><br>
			<%=memberlist.getORDER_MEMBER_ADDR_1() %><br>
			<%=memberlist.getORDER_MEMBER_ADDR_2() %>
			</td>
		</tr>
		<tr>
			<td>주문메시지</td>
			<td><textarea name="order_memo"></textarea></td>
		</tr>
	</table>
	
	<span>결제 방식</span>
	<select size="1" name="buytype" id="buytype">
		<option value="">선택</option>
		<option value="phone">휴대폰소액결제</option>
		<option value="card">신용카드</option>
		<option value="vbank">가상계좌</option>
		<option value="trans">실시간계좌이체</option>
	</select>
	
	<input type="submit" value="결제" onclick="buyfunction()">
	<input type="button" value="취소">
</form>

</body>
</html>