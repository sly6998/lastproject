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
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		NotiDAO notidao = new NotiDAO();
		NotiBean notireplydata = new NotiBean();

		
		int num2 = Integer.parseInt(request.getParameter("NOTI_REPLY_SEQ"));
		System.out.println("333");
		
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
		System.out.println("나오나요?");

		forward.setRedirect(false);
		System.out.println("ddd");
		forward.setPath("./noti/noti_detail.jsp");

		System.out.println("fff");
		return forward;
	}
}
