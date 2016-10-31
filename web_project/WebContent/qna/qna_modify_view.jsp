<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.interior.qna.*" %>    
<%
	QnaBean qna = (QnaBean)request.getAttribute("qnadata");
%>    
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>  
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/qna.js"></script>
    <title></title>
    <meta charset="utf-8">
    
</head> 
<body id="page5">
	
<h3 >공지사항(MODIFY)</h3>
         
        
        
    <form name="qna_modify_form" method="post" action="./QnaModifyAction.html?QNA_NUM=<%=qna.getQnA_NUM()%>">                    
    <table>
     	<tr>
     		<td>제 목  :</td>
     		<td>
     		<input name="QNA_SUBJECT" type="text" value="<%=qna.getQnA_SUBJECT()%>"/>
     		</td>
     	</tr>
     	  
     	<TR	>
     		<td>내 용 :</td>
     		<td>
     		<textarea id="contents" name="QNA_CONTENT">
     		<%=qna.getQnA_CONTENT() %>
     		</textarea>
     		</td>
     	</TR>
     	
     	
     	
		<tr>
			<td><input type="button" value="수정" onclick="qna_modify_check()">
			<input type="reset" value="다시쓰기"></td>
			<td><a href="./qna_list.html">목록보기</a></td>
		</tr>     					
    </table>
     </form>
	   <script>
    $(function(){
         
        CKEDITOR.replace( 'contents', {//해당 이름으로 된 textarea에 에디터를 적용
            width:'100%',
            height:'400px',
            'filebrowserUploadUrl':'<%=request.getContextPath()%>/ckeditor/upload.jsp?'
                              + 'realUrl=upload/img_upload/'
                              + '&realDir=upload/img_upload',
                        skin : 'kama'
                     });

         CKEDITOR.on('dialogDefinition', function(ev) {
            var dialogName = ev.data.name;
            var dialogDefinition = ev.data.definition;

            switch (dialogName) {
            case 'image': //Image Properties dialog
               //dialogDefinition.removeContents('info');
               dialogDefinition.removeContents('Link');
               dialogDefinition.removeContents('advanced');
               break;
            }
         });
      });
   </script>
</body>
</html>
