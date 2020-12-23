
package etalenthunt.ser;

import java.io.File;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

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
@WebServlet("/UploadPic")
public class UploadPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPic() {
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
		  String ut=(String)hs.getAttribute("ut");
String table=null;		  
		String pro=null;
   if(ut.equalsIgnoreCase("candidate"))
			  {table="candidatesinfo"; pro="/Etalenthunt/jsp/candidate/candidate_home.jsp";}
   else	  if(ut.equalsIgnoreCase("professional"))
			  {table="companyprofessionals"; pro="/Etalenthunt/jsp/professional/professional_home.jsp";}
   else  if(ut.equalsIgnoreCase("user"))
			  {table="userinfo"; pro="/Etalenthunt/jsp/enduser/user_home.jsp";}
		  
		  
		  //MultipartRequest mpt=new MultipartRequest(request, null,6*1024*1024,new DefaultFileRenamePolicy()); //uploads any type of file
		  
		  //System.out.println("file:"+fl);
		  ServletContext sc=getServletContext();
		  String path=sc.getRealPath("/"); //gives server path
		  System.out.println(path);
		  String newpath=path+uid;
		  File f=new File(newpath); 
		  if(!f.exists())
		  {
			  f.mkdir(); //creates directory
			  
		  }
		  
		 //String vdpath=newpath+"\\videos";
		 String imgpath=newpath+"\\images";
		 
		 File f1=new File(imgpath);
		 
		 if(!f1.exists())
		  {
			  f1.mkdir(); //creates directory
			  
		  }
		  
		  System.out.println("img uploaded");
		MultipartRequest  mpt=new MultipartRequest(request, imgpath,6*1024*1024,new DefaultFileRenamePolicy()); //uploads any type of file
		  if(mpt!=null)
		  {
//		  String desc=mpt.getParameter("txtdesc");
		  //String fl=mpt.getParameter("file");
		  
		  
		  
		  File actualfileobj=null;
		  String picname=null,controlname;
		  if(mpt!=null)
		  {
			  Enumeration<String>e=mpt.getFileNames();
			  while(e.hasMoreElements())
			  {
				  controlname=e.nextElement();
				  actualfileobj=mpt.getFile(controlname);
				  picname=actualfileobj.getName();
				  
			  }
			  System.out.println(picname);
		  }
		  
		  //upload query

			Connection con=null;   
			PreparedStatement ps=null;   

		  
		  String strupdate="update "+table+" set pic=? where userid=?";
			con=CrudOperation.createConnection();
			try{
				
				ps=con.prepareStatement(strupdate);
				ps.setString(1, picname);
				ps.setString(2,uid);
			int rw=	ps.executeUpdate();
				if(rw>0)
				{
					response.sendRedirect(pro);
					
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
