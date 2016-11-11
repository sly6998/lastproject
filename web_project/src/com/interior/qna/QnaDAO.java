package com.interior.qna;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.interior.basket.AddBasketAction;


public class QnaDAO {
	
	Connection con;
	
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public QnaDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}
  
	public int getListCount(String cond) {//qna 게시판 리스트의 총 게시글 수 구하기 
		// TODO Auto-generated method stub
		int count=0;
		String sql = "select count(*) from qna_board";
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}	
		}catch(Exception e){
			System.out.println("getListCount error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	

	public List getQnaList(int page, int limit, String cond) {//qna 게시글 목록 불러오기
		// TODO Auto-generated method stub
		String sql = "select * from " +
		"(select rownum rnum, qna_num, qna_member_ID, qna_member_name," +
		"qna_subject, qna_content, qna_date, qna_seq, " +
		"qna_readcount , " +
		" (select count(*) from qna_reply bb where  bb.qna_reply_num = qna_num) as zzzzz from "+
		"(select * from qna_board  order by " +
		"qna_date desc))" +
		"where rnum>=? and rnum<=?";
		
		String sql_2 = "select * from " +
				"(select rownum rnum, qna_num, qna_member_ID, qna_member_name," +
				"qna_subject, qna_content, qna_date, qna_seq, " +
				"qna_readcount , " +
				" (select count(*) from qna_reply bb where  bb.qna_reply_num = qna_num) as zzzzz from "+
				"(select * from qna_board  where %s order by " +
				"qna_date desc))" +
				"where rnum>=? and rnum<=?";
		
		if (cond != null && !cond.equals("")) {
			sql = String.format(sql_2, cond);
		}
		
		
		List list = new ArrayList();
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs=pstmt.executeQuery();
				
			while(rs.next()){
				QnaBean qna = new QnaBean();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQNA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQNA_DATE(rs.getDate("QNA_DATE"));
				qna.setQNA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQNA_READCOUNT(rs.getInt("qnA_READCOUNT"));
				qna.setQNA_REPLY_AMOUNT(rs.getInt("zzzzz"));
				list.add(qna);
				
			}
			return list;
			
		}catch(Exception e){
			System.out.println("getQnaList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	
	
	
	///////////////////////////////////////////////////////////////////////////////
	public List getQnaReplyList(int num2) {//qna 댓글 목록 불러오기
		
		// TODO Auto-generated method stub
		String sql =  "select * from qna_reply where qna_reply_num=?";
		
		List list = new ArrayList();
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num2);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				
				QnaBean qna2 = new QnaBean();
				qna2.setQNA_REPLY_NUM(rs.getInt("QNA_REPLY_NUM"));
				qna2.setQNA_REPLY_MEMBER_ID(rs.getString("QNA_REPLY_MEMBER_ID"));
				qna2.setQNA_REPLY_MEMBER_NAME(rs.getString("QNA_REPLY_MEMBER_NAME"));
			   	qna2.setQNA_REPLY_CONTENT(rs.getString("QNA_REPLY_CONTENT"));
				qna2.setQNA_REPLY_DATE(rs.getDate("QNA_REPLY_DATE"));
				qna2.setQNA_REPLY_SEQ(rs.getInt("QNA_REPLY_SEQ"));
				list.add(qna2);
				
			}
			
			return list;
		}catch(Exception e){
			System.out.println("getQnaReplyList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	

	public void setReadCountUpdate(int num) throws Exception{//qna 게시글 조회수 업데이트
		// TODO Auto-generated method stubqna_reply_seq.NEXTVAL	
		String sql = "update qna_board set qna_readcount = "+
		"qna_readcount+1 where qna_num = "+num;
		
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("setReadCountUpdate error : "+e);
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){}
		}
	}

	public QnaBean getDetail(int num) {//qna 게시글 상세보기
		// TODO Auto-generated method stub
		QnaBean qna = null;
		String sql = "select * from qna_board where qna_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				qna = new QnaBean();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQNA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQNA_DATE(rs.getDate("QNA_DATE"));
				qna.setQNA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQNA_READCOUNT(rs.getInt("QNA_READCOUNT"));
			} 
			return qna;
		}catch(Exception e){
			System.out.println("getDetail error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
		

	public boolean qnaInsert(QnaBean qnadata) {//qna 글쓰기 action
		// TODO Auto-generated method stub
		int num = 0;
		String sql = "";
		int result = 0;
		
		try{
			sql = "insert into qna_board (qna_NUM, qna_MEMBER_ID, QNA_MEMBER_NAME, qna_SUBJECT, qna_CONTENT, qna_READCOUNT, qna_DATE) values (qna_board_seq.nextval,?,?,?,?,?,sysdate)";
			
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnadata.getQNA_MEMBER_ID());
			pstmt.setString(2, qnadata.getQNA_MEMBER_NAME());
			pstmt.setString(3, qnadata.getQNA_SUBJECT());
			pstmt.setString(4, qnadata.getQNA_CONTENT());
			pstmt.setInt(5, qnadata.getQNA_READCOUNT());
			
			result = pstmt.executeUpdate();
			if(result==0){
				return false; //0이 실패
			}
			return true;
		}catch(Exception e){
			System.out.println("qnaInsert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public boolean qnaReplyInsert(QnaBean qnadata) {//qna 댓글 글쓰기 action
		// TODO Auto-generated method stub
		int num = 0;
		String sql = "";
		int result = 0;
		
		try{
			sql = "insert into qna_reply "
					+ "(QNA_REPLY_MEMBER_ID,QNA_REPLY_MEMBER_NAME, QNA_REPLY_CONTENT, QNA_REPLY_DATE, QNA_REPLY_NUM, QNA_REPLY_SEQ) "
					+ "values (?,?,?,sysdate,?,qna_reply_seq.NEXTVAL)";
			
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnadata.getQNA_REPLY_MEMBER_ID());
			pstmt.setString(2, qnadata.getQNA_REPLY_MEMBER_NAME());
			pstmt.setString(3, qnadata.getQNA_REPLY_CONTENT());
			pstmt.setInt(4, qnadata.getQNA_REPLY_NUM());
			
				
			result = pstmt.executeUpdate();
			if(result==0){
				return false; //0이 실패
			}
			return true;
		}catch(Exception e){
			System.out.println("qna reply Insert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	
	

	public QnaBean qnamodifyView(int num) {//qna 게시글 수정 페이지
		// TODO Auto-generated method stub
		QnaBean qna = null;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select * from qna_board where qna_num=?");
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				qna = new QnaBean();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQNA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				
				qna.setQNA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQNA_READCOUNT(rs.getInt("QNA_READCOUNT"));
				qna.setQNA_DATE(rs.getDate("QNA_DATE"));
			}
			return qna;
		}catch(Exception e){
			System.out.println("2");
			System.out.println("qnamodifyView error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean qnaModify(QnaBean qnadata) {//qna 게시글 수정 action
		// TODO Auto-generated method stub
		String sql = "update qna_board set qna_subject=?,";
		sql+="qna_content=? where qna_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, qnadata.getQNA_SUBJECT());
			pstmt.setString(2, qnadata.getQNA_CONTENT());
			pstmt.setInt(3, qnadata.getQNA_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e){
			System.out.println("qnaModify error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public boolean qnadelete(int num) {//qna 게시글 삭제 action
		// TODO Auto-generated method stub
		String sql = "delete from qna_board where qna_num=?";
		
		int result = 0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("qnadelete error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public boolean qnaReplydelete(int num) {//qna 게시글 삭제 action
		// TODO Auto-generated method stub
		String sql = "delete from qna_reply where qna_reply_seq=?";
		
		int result = 0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("qna reply delete error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//질문게시판 글에 달린 댓글 수 구하기
	public int getQnaReplyListCount() { 
		// TODO Auto-generated method stub
		int count=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from qna_reply");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("getQnaReplyListCount error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	
	
	
	//질문게시판 댓글 수정화면 보이게 하기
	public QnaBean qnareplymodifyview(int num1, int num2, HttpServletRequest request) {
		String sql = "select * from qna_board where qna_num=?";
		String sql_reply = "select * from qna_reply where qna_reply_num=? order by qna_reply_seq";
		String modify_reply = "select * from qna_reply where qna_reply_seq=?";
		int result = 0;
		int result_reply = 0;
		int qna_reply_seq = 0;
		QnaBean qna = null;
		QnaBean modify_re = null;
		List reply = new ArrayList<>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result =1;
				qna = new QnaBean();
				qna.setQNA_NUM(rs.getInt("QNA_NUM"));
				qna.setQNA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQNA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQNA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQNA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQNA_READCOUNT(rs.getInt("QNA_READCOUNT"));
				qna.setQNA_DATE(rs.getDate("QNA_DATE"));
				
			}
			
			//댓글 불러오기
			pstmt = con.prepareStatement(sql_reply);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result_reply =1;
				QnaBean qna2 = new QnaBean();
				qna2.setQNA_REPLY_NUM(rs.getInt("QNA_REPLY_NUM"));
				qna2.setQNA_REPLY_MEMBER_ID(rs.getString("QNA_REPLY_MEMBER_ID"));
				qna2.setQNA_REPLY_MEMBER_NAME(rs.getString("QNA_REPLY_MEMBER_NAME"));
				qna2.setQNA_REPLY_CONTENT(rs.getString("QNA_REPLY_CONTENT"));
				qna2.setQNA_REPLY_DATE(rs.getDate("QNA_REPLY_DATE"));
				qna2.setQNA_REPLY_SEQ(rs.getInt("QNA_REPLY_SEQ"));
				reply.add(qna2);
			}
			
			
			
			//수정할 댓글 불러오기
			pstmt = con.prepareStatement(modify_reply);
			pstmt.setInt(1, num2);
			rs = pstmt.executeQuery();
			while(rs.next()){
				modify_re = new QnaBean();
				modify_re.setQNA_REPLY_NUM(rs.getInt("QNA_REPLY_NUM"));
				modify_re.setQNA_REPLY_MEMBER_ID(rs.getString("QNA_REPLY_MEMBER_ID"));
				modify_re.setQNA_REPLY_MEMBER_NAME(rs.getString("QNA_REPLY_MEMBER_NAME"));
				modify_re.setQNA_REPLY_CONTENT(rs.getString("QNA_REPLY_CONTENT"));
				modify_re.setQNA_REPLY_DATE(rs.getDate("QNA_REPLY_DATE"));
				modify_re.setQNA_REPLY_SEQ(rs.getInt("QNA_REPLY_SEQ"));
			}
			if(result != 1 || result_reply !=1){
				System.out.println("질문게시판 수정할 댓글 보여주기 실패");
				return null;
			}
			System.out.println("질문게시판 수정할 댓글 보여주기 성공");
			
			request.setAttribute("replylist", reply);
			request.setAttribute("modify_re", modify_re);
			
			return qna;
			
		} catch (Exception e) {
			System.out.println("Show replies error : " + e);
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}
	
	
	//질문게시판 댓글 수정
	public boolean QnaModifyReply(QnaBean qnamodifyreply) {
	      String sql ="update qna_REPLY set qna_reply_member_id=?, qna_reply_content=?, qna_reply_date=sysdate where qna_reply_seq=? and qna_reply_num=? ";
	      QnaBean qna = null;
	      int result = 0;
	          
	      try{
	        con=ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, qnamodifyreply.getQNA_REPLY_MEMBER_ID());
	        pstmt.setString(2, qnamodifyreply.getQNA_REPLY_CONTENT());
	        pstmt.setInt(3, qnamodifyreply.getQNA_REPLY_SEQ());
	        pstmt.setInt(4, qnamodifyreply.getQNA_NUM());
	        
	        result = pstmt.executeUpdate();
	        
	        if(result != 1){
	          System.out.println("댓글수정 실패");
	          return false;
	        }
	        
	        return true;
	      }catch(Exception e){
	        System.out.println("qna reply modify error : "+e);
	      }finally{
	        if(rs!=null) try{rs.close();}catch(SQLException ex){}
	        if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
	        if(con!=null) try{con.close();}catch(SQLException ex){}
	      }
	      return false;
	    }
}
