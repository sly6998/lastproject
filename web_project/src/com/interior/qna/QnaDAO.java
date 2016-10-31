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
import javax.sql.DataSource;

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

	public int getListCount() {//qna 게시판 리스트의 총 게시글 수 구하기 
		// TODO Auto-generated method stub
		int count=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from qna_board");
			rs=pstmt.executeQuery();
			
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
	
	
	public int getReplyListCount() {//qna 댓글 리스트의  수 구하기 
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
			System.out.println("getReplyListCount error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	

	public List getQnaList(int page, int limit) {//qna 게시글 목록 불러오기
		// TODO Auto-generated method stub
		String sql = "select * from " +
		"(select rownum rnum, qna_num, qna_member_ID, qna_member_name," +
		"qna_subject, qna_content, qna_date, qna_seq, qna_ref, qna_lev," +
		"qna_readcount from " +
		"(select * from qna_board order by " +
		"qna_date desc))" +
		"where rnum>=? and rnum<=?";
		
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
				qna.setQnA_NUM(rs.getInt("QNA_NUM"));
				qna.setQnA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQnA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQnA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQnA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQnA_DATE(rs.getDate("QNA_DATE"));
				qna.setQnA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQnA_REF(rs.getInt("qnA_REF"));
				qna.setQnA_LEV(rs.getInt("qnA_LEV"));
				qna.setQnA_READCOUNT(rs.getInt("qnA_READCOUNT"));
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
				qna2.setQnA_REPLY_NUM(rs.getInt("QNA_REPLY_NUM"));
				qna2.setQnA_REPLY_MEMBER_ID(rs.getString("QNA_REPLY_MEMBER_ID"));
				qna2.setQnA_REPLY_MEMBER_NAME(rs.getString("QNA_REPLY_MEMBER_NAME"));
			   	qna2.setQnA_REPLY_CONTENT(rs.getString("QNA_REPLY_CONTENT"));
				qna2.setQnA_REPLY_DATE(rs.getDate("QNA_REPLY_DATE"));
				qna2.setQnA_REPLY_SEQ(rs.getInt("QNA_REPLY_SEQ"));
				qna2.setQnA_REPLY_REF(rs.getInt("QNA_REPLY_REF"));
				qna2.setQnA_REPLY_LEV(rs.getInt("QNA_REPLY_LEV"));
				list.add(qna2);
				
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
	
	

	public void setReadCountUpdate(int num) throws Exception{//qna 게시글 조회수 업데이트
		// TODO Auto-generated method stub
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
				qna.setQnA_NUM(rs.getInt("QNA_NUM"));
				qna.setQnA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQnA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQnA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQnA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQnA_DATE(rs.getDate("QNA_DATE"));
				qna.setQnA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQnA_REF(rs.getInt("QNA_REF"));
				qna.setQnA_LEV(rs.getInt("QNA_LEV"));
				qna.setQnA_READCOUNT(rs.getInt("QNA_READCOUNT"));
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
			sql = "insert into qna_board (qna_NUM, qna_MEMBER_ID, qna_SUBJECT, qna_CONTENT, qna_READCOUNT, qna_DATE) values (qna_board_seq.nextval,?,?,?,?,sysdate)";
			
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnadata.getQnA_MEMBER_ID());
			pstmt.setString(2, qnadata.getQnA_SUBJECT());
			pstmt.setString(3, qnadata.getQnA_CONTENT());
			pstmt.setInt(4, qnadata.getQnA_READCOUNT());
			
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
					+ "(QNA_REPLY_MEMBER_NAME, QNA_REPLY_MEMBER_ID, QNA_REPLY_CONTENT, "
					+ " QNA_REPLY_DATE, QNA_REPLY_NUM) "
					+ "values (?,?,?,sysdate,?)";
			
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qnadata.getQnA_MEMBER_ID());
			pstmt.setString(2, qnadata.getQnA_SUBJECT());
			pstmt.setString(3, qnadata.getQnA_CONTENT());
			pstmt.setInt(4, qnadata.getQnA_READCOUNT());
			
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
				qna.setQnA_NUM(rs.getInt("QNA_NUM"));
				qna.setQnA_MEMBER_ID(rs.getString("QNA_MEMBER_ID"));
				qna.setQnA_MEMBER_NAME(rs.getString("QNA_MEMBER_NAME"));
				qna.setQnA_SUBJECT(rs.getString("QNA_SUBJECT"));
				qna.setQnA_CONTENT(rs.getString("QNA_CONTENT"));
				qna.setQnA_REF(rs.getInt("QNA_REF"));
				qna.setQnA_LEV(rs.getInt("QNA_LEV"));
				qna.setQnA_SEQ(rs.getInt("QNA_SEQ"));
				qna.setQnA_READCOUNT(rs.getInt("QNA_READCOUNT"));
				qna.setQnA_DATE(rs.getDate("QNA_DATE"));
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
			pstmt.setString(1, qnadata.getQnA_SUBJECT());
			pstmt.setString(2, qnadata.getQnA_CONTENT());
			pstmt.setInt(3, qnadata.getQnA_NUM());
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
}
