package com.interior.noti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  ActionForward forward = new ActionForward();
		  request.setCharacterEncoding("utf-8");
		  
		  boolean result = false;
		  int num = Integer.parseInt(request.getParameter("NOTI_NUM"));
		  
		  NotiDAO notidao = new NotiDAO();
		  NotiBean notidata = new NotiBean(); 
		  
		  try{
		    notidata.setNOTI_NUM(num);
		    notidata.setNOTI_SUBJECT(request.getParameter("NOTI_SUBJECT"));
		    notidata.setNOTI_CONTENT(request.getParameter("NOTI_CONTENT"));
		    
		    result = notidao.boardModify(notidata);
		    
		      if(result == false){
		        System.out.println("공지사항 수정 시스템 에러");
		        return null;
		      }
		    
		  
		  System.out.println("공지사항 수정 완료");
		  
		  forward.setRedirect(true);
		  forward.setPath("./noti_detail.html?NOTI_NUM="+notidata.getNOTI_NUM());
		  
		  }catch(Exception e){
		    e.printStackTrace();
		  }
		  return forward;
	}

}
