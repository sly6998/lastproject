package com.interior.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class OverlapIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
	    ActionForward forward = new ActionForward();
	    
	    MemberDAO memberdao = new MemberDAO();
	    
	    String id = (String)request.getParameter("MEMBER_ID");
	    int result = 1;
	    
	    result = memberdao.isoverlap(id);//아이디 중복체크(1=이미가입된 아이디 2=가입가능)
	    
	    request.setAttribute("overlap", result);
	    
	    forward.setRedirect(false);
	    forward.setPath("./member/overlapId.jsp");
	    return forward;
	}

}
