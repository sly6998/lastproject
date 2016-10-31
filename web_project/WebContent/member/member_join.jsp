<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_form.css">
<script src="<%=request.getContextPath()%>/js/join.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	




<div class="text-center" style="padding:50px 0">
	<div class="member_logo">register</div>
	<div class="login-form-1">
		<form id="joinform" name="joinform" class="text-left" method="post" action="./MemberJoinAction.html">
			<input type="hidden" id="id_isChk" name="id_isChk" value="1" />
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div>
						<input type="text" class="form-control-1" id="MEMBER_ID" name="MEMBER_ID" placeholder="User ID" onfocus="infocus(this)" onblur="valchk(this)">
						&nbsp;&nbsp;<button type="button" id="overlap_id" onclick="isChk_id()" class="btn-default-1 btn">Check</button>
						<span class="collapse" id="id_cl">
							<font color="red">아이디 형식이 올바르지 않습니다.</font>
						</span>
					</div>
					<div>
						<input type="text" class="form-control-1" size="30" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="User Name" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="name_cl">
							<font color="red">한글 2~4 글자 / 영문 first last </font>
						</span>
					</div>
					<div>
						<input type="password" class="form-control-1" size="30" id="MEMBER_PWD" name="MEMBER_PWD" placeholder="Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd_cl"><font color="red">특수문자/문자/숫자 포함하여
							8~15자리 이내의 비밀번호</font></span>
					</div>
					<div>
						<input type="password" class="form-control-1" size="30" id="MEMBER_PWD2" name="MEMBER_PWD2" placeholder="Confirm Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd2_cl"><font color="red">비밀번호가 일치하지 않습니다.</font></span>
					</div>
					
					<div>
						<input type="text" class="form-control-1" id="MEMBER_TEL" size="30" name="MEMBER_TEL" placeholder="Phone Number" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="tel_cl"><font color="red">전화번호 형식이 올바르지 않습니다.</font></span>
					</div>
					<div class="form-group login-group-checkbox">
						<input type="radio" class="" name="MEMBER_GENDER" id="male" value="남자">
						<label for="male">male</label>
						
						<input type="radio" class="" name="MEMBER_GENDER" id="female" value="여자">
						<label for="female">female</label>
					</div>
					<div>
						<input type="text" class="form-control-1" id="MEMBER_ADDR_ZIP" name="MEMBER_ADDR_ZIP" placeholder="Zip Code" onfocus="infocus(this)" onblur="valchk(this)">
						&nbsp;&nbsp;<input type="button" value="Search" onclick="execDaumPost()" class="btn-default-1 btn"></td>
						<span class="collapse" id="zip_cl"><font color="red">우편번호를 입력하여 주세요.</font></span>
					</div>
					<div>
						<input type="text" class="form-control-1" size="30" id="MEMBER_ADDR_1" name="MEMBER_ADDR_1" placeholder="Address" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="addr1_cl"><font color="red">주소를 입력하여 주세요.</font></span>
					</div>
					<div>
						<input type="text" class="form-control-1" size="30" id="MEMBER_ADDR_2" name="MEMBER_ADDR_2" placeholder="Detail Address" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="addr2_cl"><font color="red">상세주소를 입력하여 주세요.</font></span>
					</div>
              		<label style="margin-top:6px">Birth Day</label>
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
            		<div align="center" class="form-group-1">
						<button type="button" onclick="join()" class="btn-default-1 btn">Register</button>&nbsp;&nbsp;
						<button type="button" onclick="javascript:location.href='./mainpage.html'" class="btn-default-1 btn">Cencel</button>
					</div>

				</div>
			</div>
		</form>
	</div>
</div>
<div>
</div>