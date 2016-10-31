package com.interior.noti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  
		request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();
		  NotiDAO notidao = new NotiDAO();
		  NotiBean notidata = new NotiBean();


		  boolean result = false;

		  try {

		    notidata.setNOTI_MEMBER_ID((String)request.getParameter("NOTI_MEMBER_ID"));
		    notidata.setNOTI_MEMBER_NAME((String)request.getParameter("NOTI_MEMBER_NAME"));
		    notidata.setNOTI_SUBJECT((String)request.getParameter("NOTI_SUBJECT"));
		    notidata.setNOTI_CONTENT((String)request.getParameter("NOTI_CONTENT"));

		    result = notidao.notiInsert(notidata);

		    if (result == false) {
		      System.out.println("게시판 등록 시스템 에러");
		      return null;
		    }

		    System.out.println("게시판 등록 완료");

		    forward.setRedirect(true);
		    forward.setPath("./noti_list.html");
		    return forward;
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  return null;
	}

}
