<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script>
$(function(){ 
	$('#price_sum').val($('#item_price').val());
	  $('.bt_up').click(function(){ 
	    var n = $('.bt_up').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1+1);
	    
	    var sum_price = $('#item_price').val()*$(".num:eq("+n+")").val();
	    document.getElementById('price_sum').value = sum_price;
	    
	  });
	  $('.bt_down').click(function(){ 
	    var n = $('.bt_down').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1-1); 
	    
	    var sum_price = $('#item_price').val()*$(".num:eq("+n+")").val();
	    document.getElementById('price_sum').value = sum_price;
	  });
	}); 
	
	
function addbasket(){
	document.product_detail.action="./addBasket.html";
	document.product_detail.submit;
}
</script>
</head>
<body>
	<form name="a" action="./../addBasket.html">
		<input type="text" name="abc" value="ass">
		<input type="submit" value="ww">
	</form>
<h3 >상품보기(detail)</h3>

<form name="product_detail" method="post" action="./../addBasket.html">                    
<table width=800>
	<tr>
		<td>
			<img name="item_img" src="../images/sofa1.jpg" width=250 height="200">
			<%String img = request.getContextPath()+"/images/sofa1.jpg";%>
			<input type="hidden" name="hidden_img" value="<%=img%>">
		</td>
		<td>
			상품명 
		</td>
		<td>
			<input type="text" id="item_name" name="item_name" value="엄청난 소파">
		</td>
	</tr>
	<tr>
		<td>가  격</td>
		<input type="text" name="item_price" id="item_price" value="500">
	</tr>
	<tr>
		<td>옵션</td>
		<td>	
			<select name="item_type">
			<option selected="selected">색상</option>
			<option>블랙</option>
			<option>브라운</option>
			</select>                           
		</td>
	</tr>
	<tr>
		<td>수  량</td>
		<td>
    <table border="0" width="50">
      <tr>
        <td>
          <table>
            <tr>
              <td><input type="text" name="num" value="1" id="" class="num"/></td>
              <td>
                  <img src="../images/up_btn.png" alt="" width="10" valign="bottom" class="bt_up"/>
                  <img src="../images/down_btn.png" alt="" width="10" valign="top" class="bt_down" />
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
		</td>		
	</tr>

	<tr>
		<Td>총금액</Td>
		<td><input type="text" name=price_sum id="price_sum" value=""></td>
	</tr>
	
	<tr>
		<td colspan=2>
			<a href="">바로구매</a>
			<input type="submit" value="장바구니 추가">
			<a href="#" onclick="addbasket()">장바구니 추가</a>
			<a href="product_list.jsp">목록으로</a>
		</td>
	</tr>
  </table>
</form>
                                                          
	<!-- <tr height="50px">
	</tr>
                                                         
	<tr> 
		<td style='border:0px solid #000; background-color:#efefef;' colspan=3>
		 <h3>제품 상세내용 표시부분</h3><br/>
		 </td>
	</tr>
	
	<TR>
		<TD style='border:0px solid #000; background-color:#efefef;' align="center" colspan=3 >
			<img src="../images/sofa1_1.jpg">
		 	<img src="../images/sofa1_2.jpg">
		</td>
	</TR>
  -->                                                   					
                                                
</body>
</html>