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
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	
	Connection con=null;
	PreparedStatement pssent=null,psinbox=null;
		
	
	public Compose() {
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
		  String sid=(String)hs.getAttribute("userinfo");
		  String ut=(String)hs.getAttribute("ut");
		  String pro=null;
		   if(ut.equalsIgnoreCase("candidate"))
					  { pro="/Etalenthunt/jsp/candidate/candidate_home.jsp";}
		   else	  if(ut.equalsIgnoreCase("professional"))
					  { pro="/Etalenthunt/jsp/professional/professional_home.jsp";}
		   else  if(ut.equalsIgnoreCase("user"))
					  { pro="/Etalenthunt/jsp/enduser/user_home.jsp";}
		   else  if(ut.equalsIgnoreCase("admin"))
		   { pro="/Etalenthunt/jsp/admin/admin_home.jsp";}
					
		  
		String rid=request.getParameter("txtrecid");
		String sub=request.getParameter("txtsub");
		String ta=request.getParameter("txtarea");
		
	    java.util.Date d=new java.util.Date();
        java.sql.Date sd=new java.sql.Date(d.getTime());

        con=CrudOperation.createConnection();
        String strsent="insert into sentitems(senderid,receiverid,msgtxt,subject,date) values(?,?,?,?,?)";
        String strinbox="insert into inbox(senderid,receiverid,msgtxt,subject,date) values(?,?,?,?,?)";
        try {
			
       
        	pssent=con.prepareStatement(strsent);
        	pssent.setString(1, sid);
        	pssent.setString(2, rid);
        	pssent.setString(3, ta); 
        	pssent.setString(4, sub); 
        	pssent.setDate(5, sd);
        	
        	int row=pssent.executeUpdate();
        	
        	
        	psinbox=con.prepareStatement(strinbox);
        	psinbox.setString(1, sid);
        	psinbox.setString(2, rid);
        	psinbox.setString(3, ta);
            psinbox.setString(4, sub);
        	psinbox.setDate(5, sd);
        	
        	int row1=psinbox.executeUpdate();
        	
        	if(row>0 && row1>0)
        	{
        		
        		System.out.println("row inserted");
        		response.sendRedirect(pro);
        	}
        	
        	
        	
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}

	finally {
		
		try {
			if(pssent!=null && psinbox!=null)
			{
				pssent.close();
				psinbox.close();
				con.close();
			}
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}
	}

		
		
		
	}

}
