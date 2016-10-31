package com.interior.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class MemberManagementLeaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
	    ActionForward forward = new ActionForward();
	    
	    MemberDAO memberdao = new MemberDAO();
	    
	    String id = (String)request.getParameter("id");
	
	    
	    int result = 2;
	    
	    
	    result = memberdao.manage_member_leave(id); //아이디 중복체크(1=탈퇴성공 2=비밀번호 불일치)

	    if(result ==1){
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원탈퇴가 완료 되었습니다.');");
			out.println("location.href='./member_management.html';");
			out.println("</script>");
			out.close();
			
			return null;
	    }else{
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원탈퇴에 실패하였습니다.');");
			out.println("location.href='./member_management.html';");
			out.println("</script>");
			out.close();
			return null;
	    }
	}
}