
package etalenthunt.ser;

import java.io.File;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import etalenthunt.dbinfo.CrudOperation;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/UploadVideo")
public class UploadVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection con=null;   
	PreparedStatement ps=null;   
ResultSet rs=null;
	
	public UploadVideo() {
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
		  String uid=(String)hs.getAttribute("userinfo");
		  ServletContext sc=getServletContext();
		  String path=sc.getRealPath("/"); //gives server path
		  System.out.println(path);
		  String newpath=path+uid;
		  File f=new File(newpath); 
		  if(!f.exists())
		  {
			  f.mkdir(); //creates directory
			  
		  }
		  
		 String vdpath=newpath+"\\videos";
		 
		 File f1=new File(vdpath);
		 
		 if(!f1.exists())
		  {
			  f1.mkdir(); //creates directory
			  
		  }
		  
		  System.out.println("video uploaded");
		MultipartRequest  mpt=new MultipartRequest(request, vdpath,100*1024*1024,new DefaultFileRenamePolicy()); //uploads any type of file
		  if(mpt!=null)
		  {
		  /*String desc=mpt.getParameter("txtdesc");
		  String fl=mpt.getParameter("file");
		  */
		  
		  
		  File actualfileobj=null;
		  String vdname=null,controlname;
		  if(mpt!=null)
		  {
			  Enumeration<String>e=mpt.getFileNames();
			  while(e.hasMoreElements())
			  {
				  controlname=e.nextElement();
				  actualfileobj=mpt.getFile(controlname);
				  vdname=actualfileobj.getName();
				  
			  }
			  System.out.println(vdname);
		  }
		  
		  String vd=null;
		  con=CrudOperation.createConnection();    //
			String strsql="select video from candidatesinfo where userid=?";   //
				
			
				
			try{                             //
				
				ps=con.prepareStatement(strsql);//compiled
				ps.setString(1, uid);
				rs=ps.executeQuery();
			
				if(rs.next())
				{ vd=rs.getString("video");
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
			
		  
			if(vd!=null)
				vd=vd+","+vdname;
			else
				vd=vdname;
		  System.out.println("VD:"+vd);

			
		  
		  String strupdate="update candidatesinfo set video=? where userid=?";
			con=CrudOperation.createConnection();
			try{
				
				ps=con.prepareStatement(strupdate);
				ps.setString(1, vd);
				ps.setString(2,uid);
				int rw=	ps.executeUpdate();
				if(rw>0)
				{
					response.sendRedirect("/Etalenthunt/jsp/candidate/candidate_home.jsp");
					
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

}
