package etalenthunt.ser;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalenthunt.dbinfo.CrudOperation;

/**
 * Servlet implementation class DeleteMsg
 */
@WebServlet("/DeleteMsg")
public class DeleteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

    Connection con=null;
    PreparedStatement ps=null;

    
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
		 String ut=(String)hs.getAttribute("ut");

		 String pagevar=request.getParameter("txtid");
		 String []arr=request.getParameterValues("chkdel");
		 String strsql=null,url=null;
	int flag=0;
	String pro=null;
	   if(ut.equalsIgnoreCase("candidate"))
				  { pro="/Etalenthunt/jsp/candidate/candidate_home.jsp";}
	   else	  if(ut.equalsIgnoreCase("professional"))
				  { pro="/Etalenthunt/jsp/professional/professional_home.jsp";}
	   else  if(ut.equalsIgnoreCase("user"))
				  { pro="/Etalenthunt/jsp/enduser/user_home.jsp";}
	   else  if(ut.equalsIgnoreCase("admin"))
	   { pro="/Etalenthunt/jsp/admin/admin_home.jsp";}
		 
		 if(pagevar.equals("sent"))
		 {
			 url="/Etalenthunt/jsp/sentitem.jsp";
			 strsql="delete from sentitems where msgid=?";
		 }
		
		 if(pagevar.equals("inbox"))
		 {
			 url="/Etalenthunt/jsp/inbox.jsp";
			 strsql="delete from inbox where msgid=?";
		 }
		
		 con=CrudOperation.createConnection();
			try {
				ps=con.prepareStatement(strsql);
				for(int i=0;i<arr.length;i++)
				{
					ps.setInt(1, Integer.parseInt(arr[i]));
					ps.addBatch();
					
				}
				
				int[] rows=ps.executeBatch();
				for(int j=0;j<rows.length;j++)
				{
					if(rows[j]<0)
					{
						flag=1;
						break;
					}
				}
				
				if(flag==0)
				{
					response.sendRedirect(pro);
				}
			} catch (SQLException e) {
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
