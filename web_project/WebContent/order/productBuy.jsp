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
function buyfunction(){
	var select = document.getElementById("buytype");
	var buytype_value = select.options[select.selectedIndex].value;
	var price_sum = $('#price_sum').val();
	var membername = $('#membername').val();
	var memberphone = $('#memberphone').val();
	var memberemail = $('#memberemail').val();
	
	 /* 
	 아임포트 계정 : testbuyer@test.com / q!123456
	 */
	 var IMP = window.IMP; // 생략가능
	 IMP.init('imp97371231'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	 IMP.request_pay({
	     pg : 'nice',
	     pay_method : buytype_value,
	     merchant_uid : 'merchant_' + new Date().getTime(),
	     name : '(주)리빙투게터 상품 결제',
	     amount : price_sum,
	     buyer_email : memberemail,
	     buyer_name : membername,
	     buyer_tel : memberphone,
	 }, function(rsp) {
	     if ( rsp.success ) {
	         var msg = '결제가 완료되었습니다.';
		     alert(msg);
		     $('#payment_status').val() = rsp.status;
		     $('#payment_num').val() = rsp.merchant_uid;
		 	/* ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패) */
	     } else {
	         var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
		     alert(msg);
		     return;
	     }

	     document.buyform.submit();
	 });
}
</script>


<title>결제 페이지</title>
</head>
<body>

<h2>결제 페이지</h2>
<form method="post" name="buyform" action="./abc.html">
<input type="hidden" value="" id="payment_status" name="payment_status">
<input type="hidden" value="" id="payment_num" name="payment_num">
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
			<td>
				<img src="<%=ol.getORDER_ITEM_IMG()%>" width="100">
				<input type="hidden" name="item_img" value="<%=ol.getORDER_ITEM_IMG()%>">
			</td>
			<td>
				<%=ol.getORDER_ITEM_NAME()%>
				<input type="hidden" name="item_name" value="<%=ol.getORDER_ITEM_NAME()%>"><br>
				옵션> <%=ol.getORDER_ITEM_TYPE() %><input type="hidden" name="item_type" value="<%=ol.getORDER_ITEM_TYPE()%>">
			</td>
			<td><%=ol.getORDER_ITEM_AMOUNT() %><input type="hidden" name="item_amount" value="<%=ol.getORDER_ITEM_AMOUNT()%>"></td>
			<td><%=ol.getORDER_ITEM_PRICE() %><input type="hidden" name="item_price" value="<%=ol.getORDER_ITEM_PRICE()%>"></td>
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
			<td>
				<input type="text" name="item_getname" id="item_getname" value="<%=memberlist.getORDER_MEMBER_NAME() %>">
			</td>
			<td>연락처</td>
			<td>
				<input type="text" name="item_getphone" id="item_getphone" value="<%=memberlist.getORDER_MEMBER_TEL() %>">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="item_getzip" id="item_getzip" value="<%=memberlist.getORDER_MEMBER_ZIP() %>"><br>
			<input type="text" name="item_getaddr1" id="item_getaddr1" value="<%=memberlist.getORDER_MEMBER_ADDR_1() %>"><br>
			<input type="text" name="item_getaddr2" id="item_getaddr2" value="<%=memberlist.getORDER_MEMBER_ADDR_2() %>">
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
	
	<input type="button" value="결제" onclick="buyfunction()">
	<input type="button" value="취소">
</form>

</body>
</html>