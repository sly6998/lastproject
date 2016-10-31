<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%
   String MEMBER_ID = "";
   String MEMBER_NAME = "";
   if (session.getAttribute("MEMBER_ID") != null) {
   MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
   System.out.println("아이디 : "+MEMBER_ID);
   }

   if (session.getAttribute("MEMBER_NAME") != null) {
   MEMBER_NAME =(String)session.getAttribute("MEMBER_NAME");
   System.out.println("이름 : "+MEMBER_NAME);
   }
   
   
    %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/js/noti.js"></script>
<meta charset="utf-8">
</head>
<body>
   <div width="100%" align="center">
      <h3>공지사항 글쓰기</h3>
      <form name="noti_write_form" method="post" action="./NotiWriteAction.html">
         <input type="hidden" name="NOTI_MEMBER_ID" value="<%=MEMBER_ID %>"/>
         <input type="hidden" name="NOTI_MEMBER_NAME" value="<%=MEMBER_NAME %>"/>
         <table>
            <tr>
               <td><input name="NOTI_SUBJECT" type="text"
                  placeholder="제목을 입력하세요." size="100%" />
               <p></td>
            </tr>

            <TR>
               <td><textarea name="NOTI_CONTENT" id="contents">
              </textarea></td>
            </TR>
            <tr>
               <td><input type="button" value="글등록" onclick="noti_write_chek()"> <input
                  type="reset" value="취소"> <a href="./noti_list.html">목록보기</a></td>
            </tr>
         </table>
      </form>
   </div>
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