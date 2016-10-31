package com.interior.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiDAO;

public class AdviceDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("ADVICE_NUM"));

		AdviceDAO advicedao = new AdviceDAO();
		result = advicedao.advicedelete(num);

		if (result == false) {
			System.out.println("상담게시판 글 삭제 시스템 에러");
			return null;
		}

		System.out.println("상담게시판 글 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./advice_list.html");
		return forward;
	}
}