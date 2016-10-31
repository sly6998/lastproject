package com.interior.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiBean;
import com.interior.noti.NotiDAO;

public class AdviceDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		AdviceDAO advicedao = new AdviceDAO();
		AdviceBean advicedata = new AdviceBean();
		
		int num = Integer.parseInt(request.getParameter("ADVICE_NUM"));
		advicedata = advicedao.getDetail(num);//게시글 보기

		if (advicedata == null) {
		  System.out.println("Advice 상세보기 시스템 에러");
		   
		  return null;   
		}

		System.out.println("Advice 상세보기 성공");
		  
		request.setAttribute("advicedata", advicedata);

		forward.setRedirect(false);
		forward.setPath("./advice/advice_detail.jsp");
		  
		return forward;
	}

}
