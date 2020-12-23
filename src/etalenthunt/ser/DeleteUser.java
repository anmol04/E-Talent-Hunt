package etalenthunt.ser;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etalenthunt.dbinfo.CrudOperation;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
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
	int flag=0;
	String[] arr=request.getParameterValues("chkdel");
	String strdelete="delete from logininfo where userid=?";
	con=CrudOperation.createConnection();
	try {
		con.setAutoCommit(false);
		ps=con.prepareStatement(strdelete);
		for(int i=0;i<arr.length;i++)
		{
			ps.setString(1, arr[i]);
			ps.addBatch();//batch
			
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
			con.commit();
		/*	response.sendRedirect("/Etalenthunt/jsp/admin/admin_home.jsp");*/
			
			/*response.sendRedirect("/Etalenthunt/jsp/admin/admin_home.jsp?msg1=deleteusers.jsp");*/


			request.setAttribute("msg1", "deleteusers.jsp");
			 RequestDispatcher rd=request.getRequestDispatcher("/jsp/admin/admin_home.jsp");//request scope
			 rd.forward(request, response);
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
