<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.item.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
 String MEMBER_ID = (String)session.getAttribute("MEMBER_ID");
 ItemBean item =(ItemBean)request.getAttribute("itemdata");
%>
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
	
	
</script>
</head>
<body>
<%@ include file="../page/header.jsp"%>
    <section id="content">
        <div class="bg-top">
        	<div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="gallery p3">
                            
                            
                            	<h3 >상품보기(detail)</h3>
<form name="product_detail" method="post" action="./../addBasket.html">                    
<table width=800>
	<tr>
		<td>
		<div>
			<img name="item_img" src="<%=request.getContextPath()%>/upload/main_upload/<%=item.getITEM_IMAGE() %>" width=250 height="250">
			<%String img = request.getContextPath()+"/upload/main_upload/"+item.getITEM_IMAGE();%>
			<input type="hidden" name="hidden_img" value="<%=img%>">
		</div>
		</td>
		<td>
			<table>
				<tr>
					<td>상품명</td>
					<td><input type="text" id="item_name" name="item_name" value="<%=item.getITEM_NAME()%>"/></td>
				</tr>
				<tr>
					<td>가 격</td>
					<td><input type="text" name="item_price" id="item_price" value="<%=item.getITEM_PRICE()%>"></td>
				</tr>
				<tr>
					<td>옵 션</td>
					<td>
						<select name="item_type">
							<option selected="selected">옵션</option>
							<option value="<%=item.getITEM_TYPE_1() %>"><%=item.getITEM_TYPE_1() %></option>
							<option value="<%=item.getITEM_TYPE_2() %>"><%=item.getITEM_TYPE_2() %></option>
							<option value="<%=item.getITEM_TYPE_3() %>"><%=item.getITEM_TYPE_3() %></option>
							<option value="<%=item.getITEM_TYPE_4() %>"><%=item.getITEM_TYPE_4() %></option>
							<option value="<%=item.getITEM_TYPE_5() %>"><%=item.getITEM_TYPE_5() %></option>
						</select>
					</td>
				</tr>
				<tr>
					<td>수 량</td>
					<td>
						<table border="0" width="50">
      						<tr>
         					     <td><input type="text" name="num" value="1" id="" class="num"/></td>
            					  <td>
               				 		 <img src="<%=request.getContextPath()%>/images/up_btn.png" alt="" width="10" valign="bottom" class="bt_up"/>
                 					 <img src="<%=request.getContextPath()%>/images/down_btn.png" alt="" width="10" valign="top" class="bt_down" />
             					 </td>
             				</tr>
					    </table>
        			</td>
      			</tr>
				<tr>
					<td>총 금액</td>
					<td><input type="text" name=price_sum id="price_sum" value=""></td>
				</tr>
				<tr>
					<td colspan=2>
						<a href="">바로구매</a>
						<input type="submit" value="장바구니 추가">
						<a href="product_list.jsp">목록으로</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
<hr size="2">
<!-- 제품상세설명 -->

<sapn name="item_content"><%=item.getITEM_CONTENT()%></sapn>
                            
                            
                            
                            </div>
                            <div class="container_12">
                            	<div class="wrapper">
                                	<article class="grid_12">
                                    	<h3 class="color-1">Our Services List</h3>
                                        <div class="wrapper">
                                        	<article class="grid_6 alpha">
                                                <figure class="img-indent frame"><img src="images/page1-img1.jpg" alt="" /></figure>
                                                <div class="extra-wrap">
                                                    <div class="indent-top">
                                                        <ul class="list-1">
                                                             <li><a href="#">Interior Decorating Services</a></li>
                                                             <li class="last"><a href="#">Complete Color <br>Analysis</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </article>
                                            <article class="grid_6 omega">
                                                <figure class="img-indent frame"><img src="images/page1-img2.jpg" alt="" /></figure>
                                                <div class="extra-wrap">
                                                    <div class="indent-top">
                                                        <ul class="list-1">
                                                             <li><a href="#">Design Services <br>for Home Construction</a></li>
                                                             <li class="last"><a href="#">Interior Design Remodeling</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </article>
                                        </div>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
        </div>
        <div class="bg-bot">
        	<div class="main">
            	<div class="container_12">
                	<div class="wrapper">
                    	<article class="grid_4">
                        	<h3 class="prev-indent-bot">About Us</h3>
                            <p class="prev-indent-bot">This <a target="_blank" href="http://blog.templatemonster.com/2011/08/22/free-website-template-clean-style-interior/ ">Interior Design Template</a> goes with two pack ages: with PSD source files and without them.</p>
                            PSD source files are available for free for the registered members of Templates.com. The basic package (without PSD source) is available for anyone without registration.
                        </article>
                        <article class="grid_4">
                        	<h3 class="prev-indent-bot">Testimonials</h3>
                            <div class="quote">
                            	<p class="prev-indent-bot">At vero eos et accusamus et iusto odio tium voluptatum deleniti atque corrupti quos<br> dolores et quas molestias excepturi sint occaecati cupiditate.</p>
                                <h5>James Reese</h5>
                                Managing Director
                            </div>
                        </article>
                        <article class="grid_4">
                        	<h3 class="prev-indent-bot">What’s New?</h3>
                            <time class="tdate-1" datetime="2011-08-15"><a class="link" href="#">15.08.2011</a></time>
                            <p class="prev-indent-bot">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.</p>
                            <time class="tdate-1" datetime="2011-08-11"><a class="link" href="#">11.08.2011</a></time>
                            Totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis et quasi architecto.
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>