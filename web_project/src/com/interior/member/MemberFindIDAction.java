package com.interior.member;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.sendemail.SendEmail;

public class MemberFindIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		ActionForward forward = new ActionForward();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		member.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
		member.setMEMBER_TEL(request.getParameter("MEMBER_TEL"));
		member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL"));
		member.setMEMBER_YEAR(Integer.parseInt(request.getParameter("MEMBER_YEAR")));
		member.setMEMBER_MONTH(Integer.parseInt(request.getParameter("MEMBER_MONTH")));
		member.setMEMBER_DAY(Integer.parseInt(request.getParameter("MEMBER_DAY")));
		
		member = memberdao.IDfind(member);
		

		if (!(member.getMEMBER_ID().equals("")) || member.getMEMBER_ID() != null) {

			String ID = (String) member.getMEMBER_ID();
			
	    String emailTO = member.getMEMBER_EMAIL();
	    String emailContent = " 고객님의 아이디는 \n"+ID+" 입니다.";
			
	    boolean result = true;
	    request.setAttribute("result", result);
	    
	    SendEmail sendemail = new SendEmail(emailTO, emailContent);
      sendemail.main(null);
      
			forward.setRedirect(false);
		    forward.setPath("./member/member_idfind_result.jsp");
			return forward;
		} else if (member.getMEMBER_ID().equals("")) {
      forward.setRedirect(true);
      forward.setPath("./member/member_idfind_result.jsp");
    return forward;
		}
		else{
		System.out.println("아이디 찾기 시스템 오류");
		}
		return null;
	}
}
