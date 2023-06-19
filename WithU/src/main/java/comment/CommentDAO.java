package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CommentDAO {
	private static CommentDAO dao = new CommentDAO();
	public static CommentDAO getInstance() {
		return dao;
	}
	
	
	
	private Connection con;
	public void setConnetction(Connection con) {
		this.con = con;
	}
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			String dbID = "withuxxtx";
	        String dbPassword = "Ezen123!!";
	        String dbURL = "jdbc:mysql://183.111.199.216:3306/withuxxtx";


			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("연결성공");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("연결실패");
		}
	}
	
	
	//comment 테이블의 num으로 데이터 한개 가져오기 : getOne()
	public CommentBean getOne(int num) throws SQLException{
		CommentBean bean = new CommentBean();
		String sql = "select * from comment where num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		rs.next();
		
		//rs 각 컬럼의 값을 bean 객체 프로퍼티로 설정
		bean.setNum(rs.getInt("num"));
		bean.setName(rs.getString("name"));
		bean.setPassword(rs.getString("password"));
		bean.setContent(rs.getString("content"));
		bean.setRdate(rs.getDate("rdate"));
		bean.setRef(rs.getInt("ref"));
		pstmt.close(); //pstmt가 null이면 exception
		
		 // bean 객체의 값을 출력하여 확인
	    System.out.println("Bean: " + bean);
	    
		return bean;
	} 
	
	
	
	//comment테이블 num 데이터 수정 : update()
	public void update(CommentBean bean) throws SQLException{
		String sql = "update comment set name=?, content=? where num=?";
		pstmt = con.prepareStatement(sql);
		//sql ?에 해당하는 파라미터 설정
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getContent());
		pstmt.setInt(3, bean.getNum());
		pstmt.execute();
		pstmt.close();	
	}
	
	
	//comment 테이블 num 데이터 삭제 : delete()
	public void delete(int num) throws SQLException{
		String sql = "delete from comment where num=?";
		pstmt = con.prepareStatement(sql);
		//sql 파라미터 설정
		pstmt.setInt(1,	num);
		pstmt.execute();
		pstmt.close();	
	}
	
	
	
	//댓글추가
	public void insert(CommentBean bean) throws SQLException{
		String sql = "insert into comment (name, password, content, ref) values (?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		
		//sql 파라미터 설정
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getContent());
		pstmt.setInt(4, bean.getRef());
		
		pstmt.execute();
		pstmt.close();	
	}
	
	
	//댓글의 갯수, 리스트 구하기 : 특정 ref 값을 조건으로 함.
	public int getCount(int num) throws SQLException{
		String sql = "select count(*) from comment where ref=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		pstmt.close();
		return cnt;
	}
	
	
	public ArrayList<CommentBean> getList(int ref) throws SQLException{
		ArrayList<CommentBean> list = new ArrayList<>();
		
		String sql = "select * from comment where ref = ?  order by num desc";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, ref);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			do {
				CommentBean bean = new CommentBean();
				bean.setNum(rs.getInt("num"));
				bean.setRef(rs.getInt("ref"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setContent(rs.getString("content"));
				bean.setRdate(rs.getDate("rdate"));
				list.add(bean);
			}while(rs.next());
		}
		pstmt.close();
		return list;
	}
		
}

