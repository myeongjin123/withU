package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			String dbID = "withuxxtx";
	        String dbPassword = "Ezen123!!";
	        String dbURL = "jdbc:mysql://183.111.199.216:3306/withuxxtx";


			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("연결성공");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("연결실패");
		}
		return conn;
	}
	
	
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
}
