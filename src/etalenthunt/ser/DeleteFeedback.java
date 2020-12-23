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
 * Servlet implementation class DeleteFeedback
 */
@WebServlet("/DeleteFeedback")
public class DeleteFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */


    Connection con=null;
    PreparedStatement ps=null;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession hs=request.getSession(false);//existing session
		 

	
		 String []arr=request.getParameterValues("chkdel");
		 String strsql=null;
		 int flag=0;
		
		 strsql="delete from feedback where id=?";
		
		
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
					response.sendRedirect("/Etalenthunt/jsp/admin/admin_home.jsp");
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
