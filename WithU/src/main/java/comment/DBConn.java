package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

	
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			String dbURL = "jdbc:mysql://localhost:3306/withu?autoReconnect=true";
			String dbID = "root";  
			String dbPassword = "0731";
			//String dbPassword = "dkdls4862";


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
