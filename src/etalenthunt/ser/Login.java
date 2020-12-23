package etalenthunt.ser;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etalenthunt.dbinfo.CrudOperation;

import java.sql.*;  //



/**
 * Servlet implementation class login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	Connection con=null;   //
	ResultSet rs=null;     //
	PreparedStatement ps=null;   //
	
	
	
    public Login() {
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

		String ui=request.getParameter("txtuserid");
		String upass=request.getParameter("txtuserpass");
		HttpSession hs=null;
//		String checkvalue=request.getParameter("chk");
		
	con=CrudOperation.createConnection();    //
	String strsql="select * from logininfo where userid=? and userpass=? and status=?";   //
		
/*	String cookieinfo="";
	cookieinfo=ui+"@"+upass;
	
	if(checkvalue!=null)
	{
		Cookie c=new Cookie("mycookie",cookieinfo );
		c.setMaxAge(24*60*60);
		URI u=
		c.setPath(uri);
		response.addCookie(c);
		System.out.println("cookiecreated");
		
		
	}
*/	
	
	/*String data=null;
		Cookie[] c=request.getCookies();
		for(int i=0;i<c.length;i++)
		{
			Cookie co=c[i];
			if(co.getName().equals("mycookie"))
			{
				data=co.getValue();
				break;
			}
		}
		String[]arr=data.split("@");
*/
		
	try{                             //
		
		ps=con.prepareStatement(strsql);//compiled
		ps.setString(1, ui);
		ps.setString(2, upass);
		ps.setString(3, "true");
		rs=ps.executeQuery();
	
		
	
		
//		if(ui.equals("scott") && upass.equals("1234567890"))
	if(rs.next()) //
	{
			hs=request.getSession();//create new session
			hs.setAttribute("userinfo", ui);//inside session
			
			String utype=rs.getString("usertype");
			hs.setAttribute("ut", utype);
				
			 //
			if(utype.equals("admin")) //
			{
				response.sendRedirect("/Etalenthunt/jsp/admin/admin_home.jsp");
			}
			
			if(utype.equals("user")) //
			{	
				response.sendRedirect("/Etalenthunt/jsp/enduser/user_home.jsp");
			}
	
			if(utype.equals("candidate")) //
			{	
				response.sendRedirect("/Etalenthunt/jsp/candidate/candidate_home.jsp");
			}
	
			if(utype.equals("professional")) //
			{	
				response.sendRedirect("/Etalenthunt/jsp/professional/professional_home.jsp");
			}
	}
		else
			
		{
			
			 request.setAttribute("msg", "invald user-name or pass");
			 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");//request scope
			 rd.forward(request, response);
			}
		} //
	catch (SQLException se) {    //
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
	}


