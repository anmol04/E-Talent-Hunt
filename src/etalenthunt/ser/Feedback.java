package etalenthunt.ser;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etalenthunt.dbinfo.CrudOperation;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
Connection con=null;
PreparedStatement ps=null;

	public Feedback() {
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
	
		String un=request.getParameter("txtusername");
		String ue=request.getParameter("txtuseremail");
		String uf=request.getParameter("feedback");
		java.util.Date d=new java.util.Date();
        java.sql.Date sd=new java.sql.Date(d.getTime());

		
		   con=CrudOperation.createConnection();
	        String strinsert="insert into feedback(email,name,feedback,date) values(?,?,?,?)";
	        
	        try {
				
	       
	        	ps=con.prepareStatement(strinsert);
	        	ps.setString(1, ue);
	        	ps.setString(2, un);
	        	ps.setString(3, uf);  
	        	ps.setDate(4, sd);
	        	
	        	int row=ps.executeUpdate();
	        	
	        	
	        	if(row>0)
	        	{
	        		
	        		System.out.println("row inserted");
	    //    		response.sendRedirect("/Etalenthunt/html/msgfeedback.html");
	       String url="/Etalenthunt/jsp/index.jsp";
	        		String a="<a href="+url+">Home Page</a>";
	        		response.setContentType("text/html");
	        		PrintWriter pw=response.getWriter();
	        		pw.println("Hello "+un+"<br><br>Your feedback is : "+uf+"<br><br>Soon you will be contacted on : "+ue+"<br><br><br><br>"+a);
	        		
	        		
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
										con.close();
				}
			} catch (SQLException se) {
				// TODO: handle exception
				System.out.println(se);
			}
		}

			

		
		
	}

}
