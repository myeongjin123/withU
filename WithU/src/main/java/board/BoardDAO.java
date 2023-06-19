package board;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;


public class BoardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public BoardDAO() {
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
	
	
	//하나의 게시글을 읽어들이는 메소드 작성
		public BoardBean getOneBoard(int num) {
			
			BoardBean bean = null;
			
			try {
				String countsql = "update board set readcount = readcount+1 where num=?";
				pstmt = con.prepareStatement(countsql);
				pstmt.setInt(1, num);
				//쿼리실행
				pstmt.executeUpdate();
				//한 게시글에 대한 정보를 리턴해주는 쿼리 작성
				String sql = "select * from board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				//쿼리실행 후 결과를 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {
					//데이터를 패키징 해줌
					bean = new BoardBean();
					bean.setNum(rs.getInt(1));
					bean.setSubject(rs.getString(2));
					bean.setWriter(rs.getString(3));
					bean.setWdate(rs.getString(4));
					bean.setUserid(rs.getString(5));
					bean.setUserpass(rs.getString(6));
					bean.setContent(rs.getString(7));
					bean.setReadcount(rs.getInt(8));
				}
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}
		
		
		
	//하나의 게시글을 저장하는 메소드 호출
		public void insertBoard(BoardBean bean) {
			
			try {
				String sql = "insert into board values(null,?,?,sysdate(),?,?,?,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString (1, bean.getSubject());
				pstmt.setString(2, bean.getWriter());
				pstmt.setString(3, bean.getUserid());
				pstmt.setString(4, bean.getUserpass());
				pstmt.setString(5, bean.getContent());
				
				pstmt.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	
	
		
		//전체 게시글의 갯수를 리턴하는 메소드
		public int getAllCount() {
			int count = 0;
			
			try {
				//쿼리 준비
				String spl = "select count(*) from board";
				pstmt = con.prepareStatement(spl);
				
				//쿼리실행 후 결과를 리턴
				rs = pstmt.executeQuery();
				if(rs.next()) {//데이터가 있다면
					count = rs.getInt(1);
				}
				con.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		
		
		//화면에 보여질 데이터를 10개씩 추출해서 리턴하는 메소드
		public Vector<BoardBean> getAllBoard(int startRow, int endRow){
			Vector<BoardBean> v = new Vector<>();
			
			try {
				//쿼리작성
				String sql = "SELECT * FROM board ORDER BY num DESC LIMIT ?, ?";
						
				//쿼리 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				//?값 대입
				
			        pstmt.setInt(1, startRow - 1);
			        pstmt.setInt(2, endRow - startRow + 1);
			        
				rs = pstmt.executeQuery();
				
				//데이터가 몇개인지 모르기에 반복문을 이용함
				while(rs.next()) {
					//데이터 패키징 가방 = BoardBean 클래스를 이용하여 패키징
					BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt(1));
					bean.setSubject(rs.getString(2));
					bean.setWriter(rs.getString(3));
					bean.setWdate(rs.getDate(4).toString());
					bean.setUserid(rs.getString(5));
					bean.setUserpass(rs.getString(6));
					bean.setContent(rs.getString(7));
					bean.setReadcount(rs.getInt(8));
					
					//패키징 한 데이터를 백터에 저장
					v.add(bean);
				}
				con.close();
		
			} catch (Exception e) {
				e.printStackTrace();
			}
			 return v;
		}
	
	
	
		// 모든 게시글을 리턴해주는 메소드 작성
				public Vector<BoardBean> allBoard() {
					// 리턴할 객체 선언
					Vector<BoardBean> v = new Vector<>();
					
					
					try {
						// 쿼리 준비
						String sql = "select * from board order by num desc";
						// 쿼리를 실행할 객체 선언
						pstmt = con.prepareStatement(sql);
						// 쿼리 실행 후 결과 저장
						rs = pstmt.executeQuery();
						// 데이터 개수를 모르기에 반복문으로 추출
						while (rs.next()) {
							// 데이터를 패키징
							BoardBean bean = new BoardBean();
							bean.setNum(rs.getInt(1));
							bean.setSubject(rs.getString(2));
							bean.setWriter(rs.getString(3));
							bean.setWdate(rs.getDate(4).toString());
							bean.setUserid(rs.getString(5));
							bean.setUserpass(rs.getString(6));
							bean.setContent(rs.getString(7));
							bean.setReadcount(rs.getInt(8));
							// 패키징 한 데이터를 백터에 저장
							v.add(bean);
						}
						
						con.close();
						
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					return v;
				}
	
		
				// 조회수를 증가하지 않는 하나의 게시글을 리턴하는 메소드
				public BoardBean getOneUpdateBoard(int num) {
					
					BoardBean bean = null;
					try {
						String sql = "select * from board where num = ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						// 쿼리 실행 후 결과 리턴
						rs = pstmt.executeQuery();
						if(rs.next()) {
							bean = new BoardBean();
							bean.setNum(rs.getInt(1));
							bean.setSubject(rs.getString(2));
							bean.setWriter(rs.getString(3));
							bean.setWdate(rs.getDate(4).toString());
							bean.setUserid(rs.getString(5));
							bean.setUserpass(rs.getString(6));
							bean.setContent(rs.getString(7));
							bean.setReadcount(rs.getInt(8));
						}
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
					return bean;
				}
				
				public void updateBoard(int num, String subject, String content) {
					
					
					try {
			            String sql = "update board set subject=?,content=? where num=?";
			            pstmt = con.prepareStatement(sql);
			            // ?에 값을 대입한다.
			            pstmt.setString(1, subject);
			            pstmt.setString(2, content);
			            pstmt.setInt(3, num);
			 
			            // 4. 쿼리를 실행한다.
			            pstmt.executeUpdate();
			            // insert, delete, update 쿼리 구문은 executeUpdate를 사용한다.
			            // 즉 DML(데이터조작어)를 사용할 때는 executeUpdate()를 사용한다.
			            // 5. 자원 반납
			            con.close();
			 
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
				}
				
				public void deleteBoard(int num) {
					
					try {
						String sql="delete from board where num=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				
				
				
				
				
			//list용
				public ArrayList<BoardBean> getSearch(String searchField, String searchText){
					
					ArrayList<BoardBean> search = new ArrayList<BoardBean>();
					String sql = "select * from board where "+searchField.trim();
					try {
						if(searchText != null && !searchText.equals("")) {
							sql +=" like '%"+searchText.trim()+ "%' order by num desc";
						}
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							BoardBean bean = new BoardBean();
							bean.setNum(rs.getInt(1));
							bean.setSubject(rs.getString(2));
							bean.setWriter(rs.getString(3));
							bean.setWdate(rs.getString(4));
							bean.setUserid(rs.getString(5));
							bean.setUserpass(rs.getString(6));
							bean.setContent(rs.getString(7));
							bean.setReadcount(rs.getInt(8));
							search.add(bean);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}
					return search;
				}
				
			
}
	
	

