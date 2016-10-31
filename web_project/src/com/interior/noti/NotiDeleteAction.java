package com.interior.noti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("NOTI_NUM"));

		NotiDAO notidao = new NotiDAO();
		result = notidao.notidelete(num);

		if (result == false) {
			System.out.println("게시판 삭제 시스템 오류");
			return null;
		}

		System.out.println("게시판 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./noti_list.html");
		return forward;
	}
}
