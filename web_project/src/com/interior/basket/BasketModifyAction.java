package com.interior.basket;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.member.MemberBean;
import com.interior.member.MemberDAO;

public class BasketModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession(false);
		
		BasketDAO basketdao = new BasketDAO();
		BasketBean basket = new BasketBean();

		String ID = (String)session.getAttribute("MEMBER_ID");
	
		
		boolean result = false;

		basket.setBASKET_MEMBER_ID(ID);
		basket.setBASKET_NUM(Integer.parseInt(request.getParameter("num")));
		basket.setBASKET_AMOUNT(Integer.parseInt(request.getParameter("amount")));
		
		result = basketdao.basketModify(basket);

		if (result == true) {

			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 수량이 변경되었습니다.');");
			out.println("location.href='./basketlist.html';");
			out.println("</script>");
			out.close();
			return null;
		} else if (result == false) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수량변경 에러.');");
			out.println("location.href='./basketlist.html';");
			out.println("</script>");
			out.close();
			return null;
		}
		System.out.println("장바구니 수량변경 실패");
		return null;
	}
}
