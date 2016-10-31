package com.interior.qna;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class QnaModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  
	    ActionForward forward = new ActionForward();
	    request.setCharacterEncoding("utf-8");
	    
	    QnaDAO qnadao = new QnaDAO();
	    QnaBean qnadata = new QnaBean(); 
	    
	    int num = Integer.parseInt(request.getParameter("QNA_NUM"));
	    qnadata = qnadao.qnamodifyView(num);
	    
	    if(qnadata == null){
	    	System.out.println("질문게시판 수정페이지 이동 시스템 에러");
	    	return null;
	    }
	    
	    System.out.println("11");
	    System.out.println("질문게시판 수정페이지 보기 성공");
	    
	    request.setAttribute("qnadata", qnadata);
	    forward.setRedirect(false);
	    forward.setPath("./qna/qna_modify_view.jsp");
	    
	    return forward;
	  }

	}
