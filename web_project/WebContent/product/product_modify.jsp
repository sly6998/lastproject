<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>  
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="../css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="../css/grid.css" type="text/css" media="screen">   
    <script src="../js/jquery-1.6.2.min.js" type="text/javascript"></script>     
	<!--[if lt IE 7]>
        <div style=' clear: both; text-align:center; position: relative;'>
            <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"  alt="" /></a>
        </div>
	<![endif]-->
    <!--[if lt IE 9]>
   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]--> 
</head> 
<body id="page5">
	<%@ include file="../page/header.jsp" %>
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
                                            	<div class="indent-left">
                                                	<h3 class="p2">제품수정(관리자)</h3>
         
        
        
     <form id="contact-form" method="post" enctype="multipart/form-data">                    
     <fieldset>
     
     	<label>
     		<span class="text-form">모델명 :</span>
     		<input name="ITEM_MODEL" type="text" />
     	</label>
     	
     	
     	
     	<label>
     		<span class="text-form">제품명 :</span>
     		<input name="ITEM_NAME" type="text" />
     	</label>
     
     	<label>
     		<span class="text-form">가격  :</span>
     		<input name="ITEM_PRICE" type="text" />
     	</label>
     	
     	<label>
     		<span class="text-form">제품타입</span>
     		<select name="ITEM_MODEL" >
     			<option value="선택하세요" selected="selected">선택하세요</option>
     			<option value="책상">책상</option>
     			<option value="소파">소파</option>
     			<option value="침대">침대</option>
     			<option value="의자">의자</option>
     			<option value="기타">기타</option>
     		</select> 
     	</label>
     	
     	<label>
     		<span class="text-form">제품브랜드</span>
     		<select name="ITEM_BRAND" >
     			<option value="선택하세요" selected="selected">선택하세요</option>
     			<option value="이케아">이케아</option>
     			<option value="까사미아">까사미아</option>
     			<option value="HANSEM">HANSEM</option>
     			<option value="한국가구">한구가구</option>
     			<option value="기타">기타</option>
     		</select> 
     	</label>
     	
     	
     	<label>
     		<span class="text-form">상품 이미지:</span>
     		<input name="ITEM_IMAGE" type="file"/>
     	</label>
     
     
     	<div class="wrapper">
     		<div class="text-form">내 용 :</div>
     		<textarea name="ITEM_CONTENT">
상품수정 부분
     		
product_modify.jsp
     		
모델명		ITEM_MODEL
제품명		ITEM_NAME
가격			ITEM_PRICE
제품 이미지 	ITEM_IMAGE
제품 타입 		ITEM_TYPE
제품 브랜드	ITEM_BRAND
내용			ITEM_CONTENT
     		
     		
     		</textarea>
     	</div>
     	
     	<label>
   		</label>
     	
     	
		<label>
		<span class="text-form">	</span>
     	
     	<input type="submit" value="등록">
     	<input type="reset" value="다시쓰기">
     	</label>
     </fieldset>						
     </form>
	                               	
                                                    
                                                
                                                </div>
                                            </div>
                                        </div>
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
                    	<article class="grid_3">
                        	<h3 class="prev-indent-bot">Our Address</h3>
                            <dl>
                                <dt class="indent-bot">8901 Marmora Road,<br>Glasgow, D04 89GR.</dt>
                                <dd><span>Freephone:</span>  +1 800 559 6580</dd>
                                <dd><span>Telephone:</span>  +1 959 603 6035</dd>
                                <dd><span>FAX:</span>  +1 504 889 9898</dd>
                                <dd><strong>E-mail:</strong> <a href="../#">mail@demolink.org</a></dd>
                            </dl>
                        </article>
                        <article class="grid_9">
                        	<h3 class="prev-indent-bot">Miscellaneous Info</h3>
                            <strong>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</strong> sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus.
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<%@ include file="../page/footer.jsp" %>
</body>
</html>
