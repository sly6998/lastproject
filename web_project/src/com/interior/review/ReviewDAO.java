package com.interior.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.interior.noti.NotiBean;

public class ReviewDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public ReviewDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}
	
	public boolean reviewdelete(int num) {// Review 게시글 삭제
		// TODO Auto-generated method stub
		String sql = "delete from review where review_num=?";
		
		int result = 0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("reviewdelete error : "+e);
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
		return false;		
	}

	public void setReadCountUpdate(int num) {// Review 게시글 조회 수 업데이트
		// TODO Auto-generated method stub
		String sql = "update review set review_readcount = review_readcount+1 where review_num = "+num;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
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

	public ReviewBean getDetail(int num) throws Exception{//Review 게시글 보기
		// TODO Auto-generated method stub
		ReviewBean review = null;
		String sql = "select * from review where review_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			}
			return review;
		}catch(Exception e){
			System.out.println("getReviewDetail error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public int getListCount() {//Review 게시글 총 수
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) from review";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
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

	public List getReviewList(int page, int limit) {//Review 게시글 리스트 보기
		// TODO Auto-generated method stub
		String sql = "select * from " +
		"(select rownum rnum, review_num, review_member_id, review_member_name," +
		"review_subject, review_content, review_readcount," +
		"review_date from " +
		"(select * from review order by review_date desc)) " +
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
				ReviewBean review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				list.add(review);
			}
			return list;
		}catch(Exception e){
			System.out.println("getReviewList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean reviewModify(ReviewBean reviewdata) {//Review 게시글 수정
		// TODO Auto-generated method stub
		String sql = "update review set review_subject=?,";
		sql+="review_content=? where review_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(2, reviewdata.getREVIEW_CONTENT());
			pstmt.setInt(3, reviewdata.getREVIEW_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e){
			System.out.println("reviewModify error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public ReviewBean reviewmodifyView(int num) {//Review 게시글 수정 페이지 보기
		// TODO Auto-generated method stub
		ReviewBean review = null;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement("select * from review where REVIEW_NUM=?");
			pstmt.setInt(1, num);
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			}
			return review;
		}catch(Exception e){
			System.out.println("reviewmodifyview error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean reviewInsert(ReviewBean reviewdata) {//Review 게시글 등록
		// TODO Auto-generated method stub
		int num=0;
		String sql="";
		int result=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select max(review_num) from review");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				num=rs.getInt(1)+1;
			}else{
				num=1;
			}
			
			sql="insert into review (review_num, review_member_id, review_member_name,";
			sql+="review_subject, review_content," +
				"review_readcount, review_date) values(review_seq.nextval,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_MEMBER_ID());
			pstmt.setString(2, reviewdata.getREVIEW_MEMBER_NAME());
			pstmt.setString(3, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());
			pstmt.setInt(5, reviewdata.getREVIEW_READCOUNT());
			
			result=pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("reviewInsert error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

}
