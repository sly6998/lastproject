package com.interior.basket;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.member.MemberDAO;

public class BasketDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
	    ActionForward forward = new ActionForward();
	    
	    BasketDAO basketdao = new BasketDAO();
	    HttpSession session = request.getSession();
	    
	    String id = (String)session.getAttribute("MEMBER_ID");
	    int num = Integer.parseInt(request.getParameter("num"));
	    
	    
	    boolean result = false;
	    
	    
	    result = basketdao.basket_delete(id,num); //아이디 중복체크(1=탈퇴성공 2=비밀번호 불일치)

	    if(result == true){
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품삭제 완료');");
			out.println("location.href='./basketlist.html';");
			out.println("</script>");
			out.close();
			
			return null;
	    }else{
	    	response.setContentType("text/html;charset=utf-8");
	    	PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품삭제 실패');");
			out.println("location.href='./basketlist.html';");
			out.println("</script>");
			out.close();
			return null;
	    }
	}
}
