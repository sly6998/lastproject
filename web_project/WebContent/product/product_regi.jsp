<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>  
    <title></title>
    <meta charset="utf-8">
   
</head> 
<body >
<h3 >제품등록(관리자)</h3>
         
        
        
     <form id="contact-form" method="post" enctype="multipart/form-data">                    
  
     
     	<label>
     		<span class="text-form">모델명 :</span>
     		<input name="ITEM_MODEL" type="text" />
     	</label><br/>
     	
     	
     	
     	<label>
     		<span class="text-form">제품명 :</span>
     		<input name="ITEM_NAME" type="text" />
     	</label><br/>
     
     	<label>
     		<span class="text-form">가            격  : </span>
     		<input name="ITEM_PRICE" type="text" />
     	</label><br/>
     	
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
     	</label><br/>
     	
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
     	</label><br/>
     	
     	
     	<label>
     		<span class="text-form">상품 이미지:</span>
     		<input name="ITEM_IMAGE" type="file"/>
     	</label><br/>
     
     
     	<div class="wrapper">
     		<div class="text-form">내 용 :</div>
     		<textarea name="ITEM_CONTENT" style="width:500px; height:100px ">
상품내용 작성부분
     		
product_regi.jsp
     		
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
   						
     </form>
	                               	
                                                    
                                                
</body>
</html>
