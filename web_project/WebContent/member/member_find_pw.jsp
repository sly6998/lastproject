<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_form.css">
<script src="<%=request.getContextPath()%>/js/pwdFind.js"></script>

<div class="text-center" style="padding:50px 0">
	<div class="member_logo">Search</div>
	<div class="login-form-1">
		<form id="pwd_search_form" name="pwd_search_form" class="text-left" method="post" action="./MemberFindPWDAction.html">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div>
						<input type="text" class="form-control-1" size="30" id="MEMBER_ID" name="MEMBER_ID" placeholder="User ID" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="id_cl">
							<font color="red">아이디 형식이 올바르지 않습니다.</font>
						</span>
					</div>					
					<div>
						<input type="text" class="form-control-1" size="30" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="User Name" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="name_cl"><font color="red">한글 2~4 글자 / 영문 first last </font></span>
					</div>
					<div>
						<input type="text" class="form-control-1" id="MEMBER_TEL" size="30" name="MEMBER_TEL" placeholder="Phone Number" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="tel_cl"><font color="red">전화번호 형식이 올바르지 않습니다.</font></span>
					</div>
              		<label style="margin-top:6px;">Birth Day</label>
              		<div>
                		<select size="1" name="MEMBER_YEAR" >
							<option value="">Year</option>
							<%for (int i = 2010; i >= 1930; i--) {%>
							<option value="<%=i%>"><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_MONTH">
							<option value="">Month</option>
							<%for (int i = 1; i <= 12; i++) {%>
							<option value="<%=i%>"><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_DAY">
						<option value="">Date</option>
						<%for (int i = 1; i <= 31; i++) {%>
						<option value="<%=i%>"><%=i%></option>
						<%}%>
						</select>
            		</div><br>
            		<div align="center">
						<button type="button" onclick="sub()"class="btn-default-1 btn">Search</button>&nbsp;&nbsp;
						<button type="button" onclick="javascript:location.href='./mainpage.html'" class="btn-default-1 btn">Cencel</button>
					</div>

				</div>
			</div>
		</form>
	</div>
</div>
<div>
</div>