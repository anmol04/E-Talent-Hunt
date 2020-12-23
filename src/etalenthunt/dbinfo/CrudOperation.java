package etalenthunt.dbinfo;
import java.sql.*;
public class CrudOperation {

	private static Connection cn=null;
	
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	
	public static Connection createConnection()
	{
		try{
			
			Class.forName("com.mysql.jdbc.Driver");   //forName-factory method,creates object of driver class;classnotfoundexception
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/etalenthunt","root","root");
			
		}
		catch (ClassNotFoundException|SQLException cse) {
			
			// TODO: handle exception
		
		System.out.println(cse);
		}
		return cn;
	}
	
	
	public static ResultSet getData(String sql,String info)
	{
		
		cn=createConnection();
		try {
			ps=cn.prepareStatement(sql);
			ps.setString(1, info);
			System.out.println(ps);
			rs=ps.executeQuery();
			
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}
		

		return rs;
	}

	public static ResultSet getData(String sql)
	{

		cn=createConnection();
		try {
			ps=cn.prepareStatement(sql);
			rs=ps.executeQuery();
			
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}

		
		return rs;
			}

	public static ResultSet getData(String sql,int info)
	{
		
		cn=createConnection();
		try {
			ps=cn.prepareStatement(sql);
			ps.setInt(1, info);
			rs=ps.executeQuery();
			
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}
		

		return rs;
	}

	
}
