<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
</head>
<body >
	
<h3>주문상세정보(detail)</h3>
 
<a href=basket_list.jsp>주문리스트 페이지로 이동</a>

<h4>[상품정보]</h4>
<table style="border-top:2px solid #111; width:850px;" >
	<tr align="center" style="background-color:#EFEFEF ">
		<td style="font-size:12pt; font-weight:bold;" width="80"  >
			[주문일자]
		</td>
		
		<td style="font-size:12pt; font-weight:bold;" colspan="2" width="200">
			[상품정보] 
		</td>
		
		<td style="font-size:12pt; font-weight:bold;" colspan="2"  >
			[상품금액 및 수량] 
		</td>
		
		<td style="font-size:12pt; font-weight:bold;" width="100">
			[총 금액] 
		</td>
		
		<td style="font-size:12pt; font-weight:bold;" width="100">
			[주문상태] 
		</td>
		
	</tr>
	

	<!-- 내용  -->
	<tr style="border:1px solid #ddd; height:100px "onmouseover="this.style.backgroundColor='#F8F8F8'">
		<td>2016.10.13</td>
		
		<td width=160>
			<img src="../images/sofa1.jpg" width="150" height="100">
		</td>
		
		<td width=290>다이애나 리클라이너 가죽 소파(3B_2)</td>
		
		<td width=100>50,000</td>
		
		<td width=50>5</td>
		
		<td> 150,000</td>
		
		<td> 배송 준비중</td>
		
	</tr>
	
</table><br/>



		<h4>[결제금액정보]</h4>
<table style="width:850px; border-top:2px solid #111; ">
	<tr>
		<td bgcolor="#efefef"  width=100>결제금액</td>
		<td>50,000원</td>
	</tr>
	
	<tr >
		<td bgcolor="#efefef"  width=100>입금방법</td>
		<td>무통장 입금</td>
	</tr>
	
	<tr>
		<Td bgcolor="#efefef"  width=100>입금자명 </Td>
		<td> 이순자 </td>
	</tr>
	
	<tr>
		<td bgcolor="#efefef"  width=100>입금날짜</td>
		<td>2016. 12. 12</td>
	</tr>
	
	<tr>
		<td bgcolor="#efefef"  width=100>카드/통장 번호</td>
		<Td>444-444-44444 </Td>
	</tr>
</table><br/>


<h4 >[배송정보-수령지]</h4>

<table style="width:850px; border-top:2px solid #111; ">
	<tr >
		<td bgcolor="#efefef" height="150" rowspan="4" width=100>받는사람</td>
		<td>김순자</td>
	</tr>
	
	<tr><Td>010-111-1111 </Td></tr>

	<tr><Td>121-121 </Td></tr>

	<tr><Td>서울시 서대문구 ~~ </Td></tr>

	<tr>
		<td bgcolor="#efefef" height="50" >요청사항</td>
		<td colspan=2>경비실에 맡겨주세요. 오시기전에 전화/문자 부탁드립니다.</td>
	</tr>
</table><br/>


<h4>[회원정보]</h4>
<table style="width:850px; border-top:2px solid #111; ">
	<tr >
		<td bgcolor="#efefef"  width=100>ID</td>
		<td>sky7777</td>
	</tr>
	
	<tr>
		<Td bgcolor="#efefef"  width=100>이름 </Td>
		<td> 이순자 </td>
	</tr>
	
	<tr>
		<td bgcolor="#efefef"  width=100>전화번호</td>
		<td>010-2222-2222</td>
	</tr>
	
	<tr>
		<td bgcolor="#efefef"  width=100>우편번호</td>
		<Td>121-121 </Td>
	</tr>

	<tr>
		<td bgcolor="#efefef"  width=100>주소</td>
		<Td>서울시 서대문구 ~~ </Td>
	</tr>

</table>

</body>
</html>
