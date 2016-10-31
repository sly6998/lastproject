package com.interior.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class MemberLeaveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
	    ActionForward forward = new ActionForward();
	    
	    MemberDAO memberdao = new MemberDAO();
	    
	    String id = (String)request.getParameter("LEAVE_ID");
	    String pwd = (String)request.getParameter("LEAVE_PWD");
	    
	    
	    int result = 2;
	    
	    
	    result = memberdao.member_leave(id,pwd); //아이디 중복체크(1=탈퇴성공 2=비밀번호 불일치)

	    if(result ==1){
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원탈퇴가 완료 되었습니다.');");
			out.println("location.href='./logout.html';");
			out.println("</script>");
			out.close();
			
			return null;
	    }else{
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='./member_modify.html';");
			out.println("</script>");
			out.close();
			return null;
	    }
	}
}
