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
			String dbID = "withuxxtx";
	        String dbPassword = "Ezen123!!";
	        String dbURL = "jdbc:mysql://183.111.199.216:3306/withuxxtx";

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("실패");
		}
	}

//		
	// ���� ���� ����, ����
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

			// ������ �����Ͻÿ�
			pstmt.executeUpdate();
			// �ڿ��ݳ�
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int idCheck(UserBean bean) {
		getCon();
		String sql = "select * from user where userid =?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUserid());
			rs = pstmt.executeQuery();

			// 중복아이디가 있으면
			if (rs.next()) {
				return 1;
			} else {
				System.out.println("리턴0");
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return -1; // 오류시
	}

	// 로그인 처리
	public boolean isRightUser(UserBean userbean) {
		getCon();
		boolean isLoginSuccess = false;

		try {
			String sql = "select * from user where userid = ? and userpass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userbean.getUserid());
			pstmt.setString(2, userbean.getUserpass());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				isLoginSuccess = true;
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sql 오류 - isRightUser(로그인 처리)");
		}

		return isLoginSuccess;

	}

	// 아이디 찾기
	public String findId(String username, String tell) {
		getCon();
		String userid = null;

		try {
			String sql = "select userid from user where username = ? and tel = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, tell);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userid = rs.getString("userid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userid;
	}

	// 비번 찾기
	public String findPw(String username, String tell) {
		getCon();
		String userpass = null;

		try {
			String sql = "select userpass from user where username = ? and tel = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, tell);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				userpass = rs.getString("userpass");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userpass;
	}

}
