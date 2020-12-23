package etalenthunt.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalenthunt.dbinfo.CrudOperation;

/**
 * Servlet implementation class Compose
 */
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	
	Connection con=null;
	PreparedStatement ps=null;
		
	
	public Post() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 HttpSession hs=request.getSession(false);//existing session
		  String id=(String)hs.getAttribute("userinfo");

		
		
		String sub=request.getParameter("txtsub");
		String ta=request.getParameter("txtarea");
		
	    java.util.Date d=new java.util.Date();
        java.sql.Date sd=new java.sql.Date(d.getTime());

        con=CrudOperation.createConnection();
        String str="insert into postnews(subject,news,date) values(?,?,?)";
      
        try {
			
       
        	ps=con.prepareStatement(str);
        	ps.setString(1, sub);
        	ps.setString(2, ta);
        	ps.setDate(3, sd);
        	
        	int row=ps.executeUpdate();
        	
        	
        	if(row>0)
        	{
        		
        		System.out.println("row inserted");
        		response.sendRedirect("/Etalenthunt/jsp/admin/admin_home.jsp");
        	}
        	
        	
        	
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}

	finally {
		
		try {
			if(ps!=null)
			{
				ps.close();
				ps.close();
				con.close();
			}
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}
	}

		
		
		
	}

}
