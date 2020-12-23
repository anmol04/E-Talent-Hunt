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
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfileUser")
public class UpdateProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	Connection con=null;   
	PreparedStatement ps=null;   
	
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

    String ph=request.getParameter("txtuserphno");
	long phoneno=Long.parseLong(ph);
	String em=request.getParameter("txtuseremail");
	String ug=request.getParameter("rdos");
	HttpSession hs=request.getSession(false);
	String uid=(String)hs.getAttribute("userinfo");
	String strupdate="update userinfo set phoneno=?, email=?, gender=? where userid=?";
	con=CrudOperation.createConnection();
	try{
		
		ps=con.prepareStatement(strupdate);
		ps.setLong(1,phoneno);
		ps.setString(2,em);
		ps.setString(3,ug);
		ps.setString(4,uid);
		
		int rw=ps.executeUpdate();
		if(rw>0)
		{
			response.sendRedirect("/Etalenthunt/jsp/enduser/user_home.jsp");
			
		}
	}
	catch (SQLException e) {
		// TODO: handle exception
	System.out.println(e);
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
