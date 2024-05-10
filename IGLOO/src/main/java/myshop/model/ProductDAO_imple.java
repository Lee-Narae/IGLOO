package myshop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import myshop.domain.ImageVO;

public class ProductDAO_imple implements ProductDAO {

	private DataSource ds;
	// DataSource ds는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductDAO_imple() {
		
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	   private void close() {
	      try {
	         if(rs != null)    {rs.close();    rs=null;}
	         if(pstmt != null) {pstmt.close(); pstmt=null;}
	         if(conn != null)  {conn.close();  conn=null;}
	      } catch(SQLException e) {
	         e.printStackTrace();
	      }
	   }
	
	
	
	   
	   
	   
	// 메인페이지에 보여지는 상품 이미지 파일명을 모두 조회(select)하는 메소드
	@Override
	public List<ImageVO> imgSelectAll() throws SQLException {
		
		List<ImageVO> imgList = new ArrayList<ImageVO>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select imgno, imgfilename "
					   + "from tbl_main_image "
					   + "order by imgno asc";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImageVO imgvo = new ImageVO();
				imgvo.setImgno(rs.getInt(1));
				imgvo.setImgfilename(rs.getString(2));
				
				imgList.add(imgvo);
			}
			
			
		} finally {
			close();
		}
		
		
		return imgList;
	}

}
