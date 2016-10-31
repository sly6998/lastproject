package com.interior.noti;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiReplyModifyViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		NotiDAO notidao = new NotiDAO();
		NotiBean notireplydata = new NotiBean();

		int num2 = Integer.parseInt(request.getParameter("NOTI_REPLY_NUM"));
		
		notireplydata = notidao.notimodifyview(num2);
		
		if (notireplydata == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('시스템 오류. 관리자에게 연락바람');");
			out.println("</script>");
			out.close();
			return null;
		}

		System.out.println("공지사항 댓글 수정페이지 보기 성공");

		request.setAttribute("notireplydata", notireplydata);

		forward.setRedirect(false);
		forward.setPath("./noti/noti_detail.jsp");

		return forward;
	}
}
