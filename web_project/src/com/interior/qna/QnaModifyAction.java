package com.interior.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class QnaModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		  ActionForward forward = new ActionForward();
		  request.setCharacterEncoding("utf-8");
		  
		  boolean result = false;
		  int num = Integer.parseInt(request.getParameter("QNA_NUM"));
		  
		  QnaDAO qnadao = new QnaDAO();
		  QnaBean qnadata = new QnaBean(); 
		  
		  try{
		    qnadata.setQnA_NUM(num);
		    qnadata.setQnA_SUBJECT(request.getParameter("QNA_SUBJECT"));
		    qnadata.setQnA_CONTENT(request.getParameter("QNA_CONTENT"));
		    
		    result = qnadao.qnaModify(qnadata);
		    
		      if(result == false){
		        System.out.println("질문게시판 수정 시스템 에러");
		        return null;
		      }
		    
		  
		  System.out.println("질문게시판 수정 완료");
		  
		  forward.setRedirect(true);
		  forward.setPath("./qna_detail.html?QNA_NUM="+qnadata.getQnA_NUM());
		  
		  }catch(Exception e){
		    e.printStackTrace();
		  }
		  return forward;
	}

}
