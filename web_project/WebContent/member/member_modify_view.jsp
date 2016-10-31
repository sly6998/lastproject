<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.interior.member.*"%>
<%
	MemberBean member = (MemberBean)request.getAttribute("member");
%>	
<%@ include file="../page/header.jsp"%>
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_form.css">
<script src="<%=request.getContextPath()%>/js/member_modify.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<div class="text-center">
	<div class="member_logo">My Page</div>
	<div class="login-form-2">
		<form id="mypage_form" name="mypage_form" class="text-left" method="post" action="./MemberModifyAction.html">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ID" name="MEMBER_ID" value="<%=member.getMEMBER_ID()%>" disabled >
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_NAME" name="MEMBER_NAME" placeholder="User Name" value="<%=member.getMEMBER_NAME()%>" disabled>
					</div>
					<div class="form-group-1">
						<input type="password" class="form-control-1" size="50" id="MEMBER_PWD" name="MEMBER_PWD" placeholder="Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd_cl"><font color="red">특수문자/문자/숫자 포함하여
							8~15자리 이내의 비밀번호</font></span>
					</div>
					<div class="form-group-1">
						<input type="password" class="form-control-1" size="50" id="MEMBER_PWD2" name="MEMBER_PWD2" placeholder="Confirm Password" onfocus="infocus(this)" onblur="valchk(this)">
						<span class="collapse" id="pwd2_cl"><font color="red">비밀번호가 일치하지 않습니다.</font></span>
					</div>
					
					<div class="form-group-1">
						<input type="text" class="form-control-1" id="MEMBER_TEL" size="50" name="MEMBER_TEL" placeholder="Phone Number" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_TEL()%>">
						<span class="collapse" id="tel_cl"><font color="red">전화번호 형식이 올바르지 않습니다.</font></span>
					</div>
					
					
					<div class="form-group-1 login-group-checkbox">
						<input type="radio" class="" name="MEMBER_GENDER" id="male" value="남자"
						<%if(member.getMEMBER_GENDER().equals("남자")){%>checked<%}%>>
						<label for="male">male</label>
						
						<input type="radio" class="" name="MEMBER_GENDER" id="female" value="여자"
						<%if(member.getMEMBER_GENDER().equals("여자")){%>checked<%}%>>
						<label for="female">female</label>
					</div>
					
					
					<div class="form-group-1">
						<input type="text" class="form-control-1" id="MEMBER_ADDR_ZIP" name="MEMBER_ADDR_ZIP" placeholder="Zip Code" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_ZIP()%>">
						&nbsp;&nbsp;<input type="button" value="Search" onclick="execDaumPost()" class="btn-default-1 btn"></td>
						<span class="collapse" id="zip_cl"><font color="red">우편번호를 입력하여 주세요.</font></span>
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ADDR_1" name="MEMBER_ADDR_1" placeholder="Address" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_1()%>">
						<span class="collapse" id="addr1_cl"><font color="red">주소를 입력하여 주세요.</font></span>
					</div>
					<div class="form-group-1">
						<input type="text" class="form-control-1" size="50" id="MEMBER_ADDR_2" name="MEMBER_ADDR_2" placeholder="Detail Address" onfocus="infocus(this)" onblur="valchk(this)" value="<%=member.getMEMBER_ADDR_2()%>">
						<span class="collapse" id="addr2_cl"><font color="red">상세주소를 입력하여 주세요.</font></span>
					</div>
              		<label style="margin-top:6px">Birth Day</label>
              		<div class="form-group-1">
                		<select size="1" name="MEMBER_YEAR" >
							<option value="">Year</option>
							<%for (int i = 2010; i >= 1930; i--) {%>
							<option value="<%=i%>" <%if(member.getMEMBER_YEAR()==i){%>selected<%}%>><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_MONTH">
							<option value="">Month</option>
							<%for (int i = 1; i <= 12; i++) {%>
							<option value="<%=i%>" <%if(member.getMEMBER_MONTH()==i){%>selected<%}%>><%=i%></option>
							<%}%>
						</select>&nbsp;&nbsp;
						<select size="1" name="MEMBER_DAY">
						<option value="">Date</option>
						<%for (int i = 1; i <= 31; i++) {%>
						<option value="<%=i%>" <%if(member.getMEMBER_DAY()==i){%>selected<%}%>><%=i%></option>
						<%}%>
						</select>
            		</div><br>
            		<div align="center" class="form-group-1">
						<button type="button" data-toggle="modal" data-target="#leaveModal" class="btn-default-1 btn">Member Leave</button>&nbsp;&nbsp;
						<button type="button" onclick="member_modify()" class="btn-default-1 btn">Save</button>&nbsp;&nbsp;
						<button type="button" onclick="javascript:location.href='./mainpage.html'" class="btn-default-1 btn">Cancel</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div>
</div>
<%@ include file="../page/footer.jsp"%>

	<!-- 회원탈퇴 모달 팝업 -->
	<div class="modal fade" id="leaveModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	  	  <div class="modal-header">
      		  <h4 class="modal-title" id="myModalLabel">Member Leave</h4>
      	  </div>
	      <div class="modal-body">
	      <div align="left">
			<span>
				<font color="red" size="10"><b>회원탈퇴 신청 전 안내 사항을 확인 해 주세요.</b></font><p/>
				 회원탈퇴를 신청하시면 신청하신 아이디는 사용하실 수 없습니다.<br>
				 <div style="padding-left:15px;">
				 - 회원 정보<br>
				 - 상품 구입 및 대금 결제에 관한 기록<br>
				 - 상품 배송에 관한 기록<br>
 				 - 소비자 불만 또는 처리 과정에 관한 기록<br>
				 - 게시판 작성 및 사용후기에 관한 기록<br>
				 </div>
			</span><p/>
			<form name="leaveform" method="post" action="./member_leave.html">
				<div class="login-form-2">
					<div class="main-login-form">
						<div class="login-group">
							<div class="form-group-1">
								<div style="padding-left:15px;">
									<input type="hidden" name="LEAVE_ID" value="<%=member.getMEMBER_ID()%>"/>
									<input type="password" size="30" class="form-control-1" name="LEAVE_PWD" id="LEAVE_PWD" placeholder="Password" onblur="member_leave_f()">
									<span class="collapse" id="leave_pwd_cl"><font color="red">특수문자/문자/숫자 포함하여 8~15자리 이내의 비밀번호</font></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<p/>
				<div align="center">
				<button type="button" onclick="member_leave()" class="btn-default-1 btn">Leave</button>
				<button type="button" onclick="javascript:location.href='./member_modify.html'" class="btn-default-1 btn">Cancel</button>
				</div>
			</form>
	      </div>
		  </div>
	    </div>
	  </div>
	</div>

