package com.interior.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiDAO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");

		boolean result = false;
		int num = Integer.parseInt(request.getParameter("QNA_NUM"));

		QnaDAO qnadao = new QnaDAO();
		result = qnadao.qnadelete(num);

		if (result == false) {
			System.out.println("QnA게시판 글 삭제 시스템 에러");
			return null;
		}

		System.out.println("QnA게시판 글 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./qna_list.html");
		return forward;
	}
}
