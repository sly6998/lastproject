package com.interior.noti;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiModifyViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		NotiDAO notidao = new NotiDAO();
		NotiBean notidata = new NotiBean();

		int num = Integer.parseInt(request.getParameter("NOTI_NUM"));
		
		notidata = notidao.notimodifyview(num);
		
		if (notidata == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('시스템 오류. 관리자에게 연락바람');");
			out.println("</script>");
			out.close();
			return null;
		}
		System.out.println("공지사항 수정페이지 보기 성공");

		System.out.println(notidata.getNOTI_NUM());
		System.out.println(notidata.getNOTI_MEMBER_ID());
		System.out.println(notidata.getNOTI_MEMBER_NAME());
		System.out.println(notidata.getNOTI_CONTENT());
		System.out.println(notidata.getNOTI_SUBJECT());
		request.setAttribute("notimodifyview", notidata);

		forward.setRedirect(false);
		forward.setPath("./noti/noti_modify_view.jsp");


		return forward;

	}

}
