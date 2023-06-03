package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import util.DatabaseUtil;

public class BoardDAO {

	//게시물 조회
	public Vector<BoardDTO> getBoardList() {
		String SQL = "SELECT num, title, userId, postdate, visitcount FROM BOARD";
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;//결과값을 처리
		Vector<BoardDTO> v = new Vector<>();
		
		try {
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setUserId(rs.getString("userId"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				v.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return v;
	}
	
}
