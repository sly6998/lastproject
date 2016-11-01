package com.interior.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.member.MemberBean;
import com.interior.member.MemberDAO;

public class paymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

	    ActionForward forward = new ActionForward();
	    
	    OrderDAO orderdao = new OrderDAO();
	    OrderBean order = new OrderBean();
	    
	    
	    boolean result = false;
	    
	    order.set
	    	
	    order.setMEMBER_NAME(request.getParameter("MEMBER_NAME"));
	    member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
	    member.setMEMBER_PWD(request.getParameter("MEMBER_PWD"));
	    member.setMEMBER_ADDR_1(request.getParameter("MEMBER_ADDR_1"));
	    member.setMEMBER_ADDR_2(request.getParameter("MEMBER_ADDR_2"));
	    member.setMEMBER_ADDR_ZIP(request.getParameter("MEMBER_ADDR_ZIP"));
	    member.setMEMBER_TEL(request.getParameter("MEMBER_TEL"));
	    member.setMEMBER_GENDER(request.getParameter("MEMBER_GENDER"));
	    member.setMEMBER_YEAR(Integer.parseInt(request.getParameter("MEMBER_YEAR")));
	    member.setMEMBER_MONTH(Integer.parseInt(request.getParameter("MEMBER_MONTH")));
	    member.setMEMBER_DAY(Integer.parseInt(request.getParameter("MEMBER_DAY")));
	
	    

	    result = memberdao.joinMember(member);
	    
	    if(result == false){
	      System.out.println("회원가입 실패");
	      return null;
	    }
	    
	    //회원가입 성공
	    forward.setRedirect(true);
	    forward.setPath("./mainpage.html");
	    return forward;
	}

}
