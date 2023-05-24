package comment;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentService {
	private static CommentService service = new CommentService();
	private CommentService() {}
	public static CommentService getInstance() {
		return service;
	}
	
	
	public boolean update(CommentBean bean) {
		Connection con = DBConn.getMySqlConnection();
		CommentDAO dao = CommentDAO.getInstance();
		dao.setConnetction(con);
		
		boolean flag = false;
		try {
			CommentBean res = dao.getOne(bean.getNum()) ;//db테이블에서 num검색
			if(res.getPassword().equals(bean.getPassword())) {
				dao.update(bean);
				flag = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		DBConn.close(con);
		return flag;
	}
	
	
	
	public boolean delete(int num, String password) {
		Connection con = DBConn.getMySqlConnection();
		CommentDAO dao = CommentDAO.getInstance();
		dao.setConnetction(con);
		
		boolean flag = false;
		try {
			CommentBean res = dao.getOne(num);
			if(res.getPassword().equals(password)) {
				dao.delete(num);
				flag = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		DBConn.close(con);
		return flag;
	}
	
	
	
	 public boolean insert(CommentBean bean) {
	        Connection con = DBConn.getMySqlConnection();
	        CommentDAO dao = CommentDAO.getInstance();
	        dao.setConnetction(con);

	        try {
	            // 중복 댓글 확인
	            ArrayList<CommentBean> existingComments = dao.getList(bean.getRef());
	            for (CommentBean existingComment : existingComments) {
	                if (existingComment.getContent().equals(bean.getContent())) {
	                    // 중복 댓글이 이미 존재하는 경우
	                    return false;
	                }
	            }

	            // 중복되지 않는 경우 댓글 등록
	            dao.insert(bean);
	            return true;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            DBConn.close(con);
	        }
	        return false;
	    }

	
	public int getCount(int num) {
		Connection con = DBConn.getMySqlConnection();
		CommentDAO dao = CommentDAO.getInstance();
		dao.setConnetction(con);
		
		int cnt = 0;
		try {
			cnt = dao.getCount(num);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		DBConn.close(con);
		return cnt;
	}
	
	
	public ArrayList<CommentBean> getList(int ref){
		
		ArrayList<CommentBean> list = null;
		Connection con = DBConn.getMySqlConnection();
		CommentDAO dao = CommentDAO.getInstance();
		dao.setConnetction(con);
		
		try {
			list = dao.getList(ref);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		DBConn.close(con);
		return list;
	}
	
	
	
}
