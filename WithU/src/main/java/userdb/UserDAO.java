package userdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


	
public class UserDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		try {
			String id = "root";
			String pass = "qwer7878";
			String url = "jdbc:mysql://localhost:3306/withU";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pass);
			System.out.println("성공");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("실패");
		}
	}

	
	
//		
		//���� ���� ����, ���� 
		public void insert(UserBean bean) {
			getCon();
			try {
				String query = "insert into user values (num,?,?,?,?,?,?,?,?,?, sysdate())";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, bean.getUsername());
				pstmt.setString(2, bean.getUserid());
				pstmt.setString(3, bean.getUserpass());
				pstmt.setString(4, bean.getUseremail());
				pstmt.setString(5, bean.getTel());
				pstmt.setString(6, bean.getAddress());
				pstmt.setString(7, bean.getDetailaddr());
				pstmt.setInt(8, bean.getPostcode());
				pstmt.setInt(9, bean.getBirth());

			
				//������ �����Ͻÿ�
				pstmt.executeUpdate();
				//�ڿ��ݳ�
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public int idCheck(UserBean bean) {
			String sql = "select * from user where userid =?";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bean.getUserid());
				rs = pstmt.executeQuery();
				
				//중복아이디가 있으면
				if(rs.next()) {
					return 1;
				}else {
					return 0;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //오류시
		}
}

