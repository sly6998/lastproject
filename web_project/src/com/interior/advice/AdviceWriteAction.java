package com.interior.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class AdviceWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		AdviceDAO advicedao = new AdviceDAO();
		AdviceBean advicedata = new AdviceBean();

		boolean result = false;

		try {
			
			advicedata.setADVICE_NAME((String)request.getParameter("ADVICE_NAME"));
			advicedata.setADVICE_TEL((String)request.getParameter("ADVICE_TEL"));
			advicedata.setADVICE_CONTENT((String)request.getParameter("ADVICE_CONTENT"));

			result = advicedao.AdviceInsert(advicedata);

			if (result == false) {
				System.out.println("상담 게시판 등록 시스템 에러");
				return null;
			}

			System.out.println(request.getParameter("ADVICE_NAME"));
			System.out.println("상담 게시판 등록 완료");

			forward.setRedirect(true);
			forward.setPath("./advice_list.html");
			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}