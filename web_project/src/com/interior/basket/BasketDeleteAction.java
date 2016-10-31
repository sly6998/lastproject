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

		BasketDAO basketdao = new BasketDAO();
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("MEMBER_ID");

		boolean result = false;

		if (request.getParameter("num") != null) {
			int num = Integer.parseInt(request.getParameter("num"));

			result = basketdao.basket_delete(id, num);

			if (result == true) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('상품삭제 완료');");
				out.println("location.href='./basketlist.html';");
				out.println("</script>");
				out.close();

				return null;
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('상품삭제 실패');");
				out.println("location.href='./basketlist.html';");
				out.println("</script>");
				out.close();
				return null;
			}

		} else if (request.getParameter("num") == null) {// 장바구니 전체 비우기

			result = basketdao.basket_all_delete(id);

			if (result == true) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('장바구니 비우기 완료');");
				out.println("location.href='./basketlist.html';");
				out.println("</script>");
				out.close();

				return null;
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('장바구니 비우기 실패');");
				out.println("location.href='./basketlist.html';");
				out.println("</script>");
				out.close();
				return null;
			}
		}
		return null;
	}
}
