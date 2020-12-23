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
@WebServlet("/RegistrationCandidate")
public class RegistrationCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
Connection con=null;
PreparedStatement pslogin=null,psuser=null,ps=null;
ResultSet rs=null;	
	public RegistrationCandidate() {
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
		String un=request.getParameter("txtusername");
		String ue=request.getParameter("txtuseremail");
		String upn=request.getParameter("txtuserphno");
		String ua=request.getParameter("txtuseradd");
		/*String us=request.getParameter("txtuserskills");*/

		String cmbskill=request.getParameter("cmbskills"); //checkbox,returns array
		/*String othrskill=request.getParameter("otherskill");*/
		/*if(othrskill==null)
			othrskill="";
		
		else
		{
			
			con=CrudOperation.createConnection();
	        String strinsert="insert into skills(skillname) values(?)";
	        try {
				
	            
	        	ps=con.prepareStatement(strinsert);
	        	ps.setString(1, othrskill);
	  
	        	int row=ps.executeUpdate();
	        	
	        	
	        	if(row>0)
	        	{
	        		
	        		System.out.println("row inserted:skill"+othrskill);
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
*/		
		/*String skill="";
		System.out.println("cmbskill.length"+cmbskill.length+"\nothrskill"+othrskill);
		for(int i=0;i<cmbskill.length;i++)
		{
			
			if(!cmbskill[i].equalsIgnoreCase("Other"))
			{skill=skill+cmbskill[i];
			System.out.println("skill:"+cmbskill[i]);
			
			if(i<cmbskill.length-1)
				skill+=",";
			}
		}
		if(othrskill!="")
	 skill=skill+","+othrskill;
		
*/		String ug=request.getParameter("rdos");
			
		
            java.util.Date d=new java.util.Date();
            java.sql.Date sd=new java.sql.Date(d.getTime());
            con=CrudOperation.createConnection();
            String strlogin="insert into logininfo values(?,?,?,?)";
            String struser="insert into candidatesinfo(userid,name,address,phoneno,skills,email,gender,dor) values(?,?,?,?,?,?,?,?)";
            try {
				
            	con.setAutoCommit(false);  //table-entry,not saved
            	pslogin=con.prepareStatement(strlogin);
            	pslogin.setString(1, ui);
            	pslogin.setString(2, up);
            	pslogin.setString(3, "candidate"); //usertype
            	pslogin.setString(4, "true"); //status
            	
            	int row=pslogin.executeUpdate();
            	
            	psuser=con.prepareStatement(struser);
            	psuser.setString(1, ui);
            	psuser.setString(2, un);
            	psuser.setString(3, ua);
            	psuser.setLong(4, Long.parseLong(upn));
            	psuser.setString(5, cmbskill);
              	psuser.setString(6, ue);
            	psuser.setString(7, ug);
            	psuser.setDate(8, sd);
         	
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
				if(pslogin!=null)
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
