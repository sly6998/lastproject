<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.item.*"%>

<%
  String MEMBER_ID = "";
  String MEMBER_NAME = "";
  
  if (session.getAttribute("MEMBER_ID") != null) {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
  System.out.println(request.getAttribute("MEMBER_NAME"));
  }

  if (session.getAttribute("MEMBER_NAME") != null) {
  MEMBER_NAME =(String)session.getAttribute("MEMBER_NAME");
  }
  
  
  List itemlist = (List)request.getAttribute("itemlist");
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
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
   
</head>
<body>
	<%@ include file="../page/header.jsp"%>
<form id="contact-form" method="post" enctype="multipart/form-data">                    
  <section id="content">
        <div class="bg-top">
        	<div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="box">
                                <div class="padding">
                                    <div class="container_12">
                                        <div class="wrapper">
                                            <div class="grid_12">
                                            	<div class="indent-left p2">
                                                	<h3 class="p0">상품목록(list)</h3>
                                                </div>
                                                <%
       										    int num =1;
       										    for (int i = 1; i < itemlist.size(); i++) {
        										ItemBean il = (ItemBean) itemlist.get(i);
   											    %>
                                                <div class="wrapper p4">
                                                <% if(il.getITEM_NUM() == (num+3) ||il.getITEM_NUM() == 1){%>
                                                    <article class="grid_4 alpha">
                                                        <div class="indent-left">
                                                            <figure class="frame2 p2"><img src="<%=il.getITEM_IMAGE() %>" width="250" height="250"/></figure>
                                                            <p class="color-4 prev-indent-bot"><a href="#"><%=il.getITEM_NAME() %></a></p>
                                                            <div class="wrapper">
                                                            	<span class="price fleft"><%=il.getITEM_PRICE() %></span>
                                                            </div>
                                                        </div>
                                                    </article>
                                                <%
                                                 num = num++;
                                                 }else if(il.getITEM_NUM() == (num+3) ||il.getITEM_NUM() == 2){ %>    
                                                    <article class="grid_4">
                                                        <div class="indent3">
                                                            <figure class="frame2 p2"><img src="<%=il.getITEM_IMAGE() %>" width="250" height="250" /></figure>
                                                            <p class="color-4 prev-indent-bot"><a href="#"><%=il.getITEM_NAME() %></a></p>
                                                            <div class="wrapper">
                                                            	<span class="price fleft"><%=il.getITEM_PRICE() %></span>
                                                            </div>
                                                        </div>
                                                    </article>
                                                    
                                                     <!-- else if get(i) ==  get(i)+3 ||get(i)==3-->
                                                <% num = num++;
                                                 }else if(il.getITEM_NUM() == (num+3) ||il.getITEM_NUM() == 3){ %>                                                    
                                                    <article class="grid_4 omega">
                                                        <div class="indent-right">
                                                            <figure class="frame2 p2"><img src=""<%=il.getITEM_IMAGE() %>" width="250" height="250" /></figure>
                                                            <p class="color-4 prev-indent-bot"><a href="#"><%=il.getITEM_NAME() %></a></p>
                                                            <div class="wrapper">
                                                            	<span class="price fleft"><%=il.getITEM_PRICE() %></span>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                                <%num = num++;	} %>
                                                <%} %>
                                            </div>
                                        </div>
                                        <!-- 글등록.... -->
                                    </div>
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
                        	<h3 class="p2">New Furniture</h3>
                            <div class="wrapper">
                            	<figure class="img-indent frame2"><img src="images/page4-img7.jpg" alt="" /></figure>
                                <p class="prev-indent-bot color-4">At vero eos eaccusa mus etusto odio.</p>
                                <p class="prev-indent-bot">Tium voluptatum del eniti atque corrupti quos dolores.</p>
                                <a class="button" href="#">View More</a>
                            </div>
                        </article>
                        <article class="grid_8">
                        	<h3 class="prev-indent-bot2">Our Pricing</h3>
                            <div class="wrapper">
                            	<div class="grid_4 alpha">
                                	<div class="indent-right2">
                                        <ul class="price-list">
                                            <li><span>$6700.00</span><a href="#">Totam rem aperiam eaque</a><strong>&nbsp;</strong></li>
                                            <li><span>$4370.00</span><a href="#">Inventore veritatis quasi</a><strong>&nbsp;</strong></li>
                                            <li><span>$5780.00</span><a href="#">Nemo enim ipsam voluptatem</a><strong>&nbsp;</strong></li>
                                            <li><span>$2300.00</span><a href="#">Voluptas sit aspernatur aut</a><strong>&nbsp;</strong></li>
                                            <li><span>$3650.00</span><a href="#">Sed quia consequuntur magni</a><strong>&nbsp;</strong></li>
                                            <li class="last"><span>$7900.00</span><a href="#">Ratione voluptatem sequi</a><strong>&nbsp;</strong></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="grid_4 omega">
                                	<div class="indent-right2">
                                        <ul class="price-list">
                                            <li><span>$6700.00</span><a href="#">Totam rem aperiam eaque</a><strong>&nbsp;</strong></li>
                                            <li><span>$4370.00</span><a href="#">Inventore veritatis quasi</a><strong>&nbsp;</strong></li>
                                            <li><span>$5780.00</span><a href="#">Nemo enim ipsam voluptatem</a><strong>&nbsp;</strong></li>
                                            <li><span>$2300.00</span><a href="#">Voluptas sit aspernatur aut</a><strong>&nbsp;</strong></li>
                                            <li><span>$3650.00</span><a href="#">Sed quia consequuntur magni</a><strong>&nbsp;</strong></li>
                                            <li class="last"><span>$7900.00</span><a href="#">Ratione voluptatem sequi</a><strong>&nbsp;</strong></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>

























<table width=900 >
	<tr>
		<!-- 첫번재 소파 이미지  -->
		<td width="300" style="border:1px solid #ddd;" align=center>
			<a href="./product/product_detail.jsp">
			<img src="../images/sofa1.jpg" width="250" height="200">
			</a>
		</td>
		
		<!-- 두번째 소파 이미지 -->
		<td width="300" style="border:1px solid #ddd;"  align=center>
			<a href="">
			<img src="../images/sofa2.jpg" width="250" height="200" >
			</a>
		</td>
		<td width="300" style="border:1px solid #ddd;" >1</td>
	
	</tr>
	
	<tr>
		<!-- 첫번재 소파 이름, 가격 -->
		<td style="border:1px solid #ddd;" align="center">
			Wendelbo Edge sofa (웬델보 엣지 소파)
			<br/>
			300,000,000원
		</td>
		
		<!-- 첫번재 소파 이름, 가격 -->
		<td style="border:1px solid #ddd;" align=center>
			엘리체 리클라이너 가죽 소파
			<br/>
			500,000,000원
			
		</td>
		<td style="border:1px solid #ddd;" >1</td>
	</tr>
	
</table>

                                                        				
 </form>
                                               
</body>
</html>