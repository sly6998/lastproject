package com.interior.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiDAO;

public class QnaReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		
 
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("QNA_REPLY_SEQ"));
		int num2 = Integer.parseInt(request.getParameter("QNA_NUM"));//댓글

		QnaDAO qnadao = new QnaDAO();
		result = qnadao.qnaReplydelete(num);

		
		
		
		
		if (result == false) {
			System.out.println("QnA게시판 댓글 삭제 시스템 에러");
			return null;
		}

		System.out.println("QnA게시판 댓글 삭제 완료");

		forward.setRedirect(true);
		forward.setPath("./qna_detail.html?QNA_NUM="+num2);
		return forward;
	}
}
