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
<script>
function modify(){
	
	var num = document.getElementById('num').value;
	var amount = document.getElementById('amount').value;
	
	location = "./BasketModify.html?num="+num+"&amount="+amount;
}

function submit_f(str){
	
	if(str == 'modify'){
		basketform.action = './BasketModify.html';
	}else if(str == 'buy'){
		basketform.action = './ProductBuy.html';
	}
	
	
	
}
</script>
</head>
<body >
<h3 >장바구니</h3>
 <form name ="basketform" method="post">
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
         <img src="<%=bl.getBASKET_ITEM_IMAGE()%>" width="100">
         <input type="hidden" name="product_img" value="<%=bl.getBASKET_ITEM_IMAGE()%>">
         </td>
         <td>
         	<table>
         	  <tr>
         	    <td><a href="#"><%=bl.getBASKET_ITEM_NAME()%></a><td>
         	    <input type="hidden" name="product_name" value="<%=bl.getBASKET_ITEM_NAME()%>">
         	  </tr>
         	  <tr>
         	    <td>[옵션]<%=bl.getBASKET_ITEM_TYPE()%></td>
         	    <input type="hidden" name="product_type" value="<%=bl.getBASKET_ITEM_TYPE()%>">
         	  </tr>
         	</table>
         </td>
         <td>
         
           <input type="text" name = "amount" id ="amount" size="1" class="num" value="<%=bl.getBASKET_AMOUNT()%>"><br>
 			<input type="hidden" name ="num" value="<%=bl.getBASKET_NUM()%>">
 			<input type="submit" value="변경"  onclick="submit_f('modify')">
        
         </td>
         <td>
           <span id="price">
           <%=bl.getBASKET_RESULT()%>
           </span>
           <input type="hidden" name="product_result" value="<%=bl.getBASKET_RESULT()%>">
           
           
         </td>
         <td>
        	<button type="button" onclick="location.href='./BasketDelete.html?num=<%=bl.getBASKET_NUM()%>'">삭제</button>
         </td>
      </tr>
      <%
         }
      %>
       
    </table>



<table>
	<tr>
		<td>
			<button type="button" onclick="location.href='./BasketDelete.html'">장바구니 비우기</button>
		</td>
		<td>
			<input type="submit" value="주문하기" onclick="submit_f('buy')">
		</td>
		<td>
			<button type="button" onclick="location.href='./product_list.html'">쇼핑계속하기</button>
		</td>
	</tr>
</table>
	</form>
	
	
     

</body>
</html>
