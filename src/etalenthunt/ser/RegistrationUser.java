package etalenthunt.ser;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etalenthunt.dbinfo.CrudOperation;

import java.sql.*
;/**
 * Servlet implementation class registration
 */
@WebServlet("/RegistrationUser")
public class RegistrationUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
Connection con=null;
PreparedStatement pslogin=null,psuser=null,ps=null;
ResultSet rs=null;
	
	public RegistrationUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ui=request.getParameter("userid");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		   con=CrudOperation.createConnection();
		String strsql="select * from logininfo where userid=?";
		try{
		ps=con.prepareStatement(strsql);
		ps.setString(1, ui);
		rs=ps.executeQuery();
		
		
		if(rs.next())
		{
			
			  out.println("User ID already exists!!");	
		}
		
		}
		catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}

	finally {
		
		try {
			if(ps!=null)
			{
				rs.close();
				ps.close();
				con.close();
			}
		} catch (SQLException se) {
			// TODO: handle exception
			System.out.println(se);
		}
	}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ui=request.getParameter("txtuserid");
		String up=request.getParameter("txtuserpass");
		String ue=request.getParameter("txtuseremail");
		String upn=request.getParameter("txtuserphno");
		String ug=request.getParameter("rdos");
		
			
		
            java.util.Date d=new java.util.Date();
            java.sql.Date sd=new java.sql.Date(d.getTime());
            con=CrudOperation.createConnection();
            String strlogin="insert into logininfo values(?,?,?,?)";
            String struser="insert into userinfo(userid,phoneno,email,gender,dor) values(?,?,?,?,?)";
            try {
				
            	con.setAutoCommit(false);  //table-entry,not saved
            	pslogin=con.prepareStatement(strlogin);
            	System.out.println(pslogin);
            	pslogin.setString(1, ui);
            	pslogin.setString(2, up);
            	pslogin.setString(3, "user"); //usertype
            	pslogin.setString(4, "true"); //status
            	
            	int row=pslogin.executeUpdate();
            	
            	psuser=con.prepareStatement(struser);
            	System.out.println(psuser);
            	psuser.setString(1, ui);
            	psuser.setLong(2, Long.parseLong(upn));
            	psuser.setString(3, ue);
            	psuser.setString(4, ug);
            	psuser.setDate(5, sd);
            	int row1=psuser.executeUpdate();
            	if(row>0 && row1>0)
            	{
            		
            		con.commit(); //con.setAutoCommit(true);
            		System.out.println("row inserted");
            		response.sendRedirect("/Etalenthunt/html/msg.html");
            	}
            	
            	
            	
			} catch (SQLException se) {
				// TODO: handle exception
				System.out.println(se);
			}

		finally {
			
			try {
				if(pslogin!=null && psuser!=null)
				{
					pslogin.close();
					psuser.close();
					con.close();
				}
			} catch (SQLException se) {
				// TODO: handle exception
				System.out.println(se);
			}
		}
	}

}
