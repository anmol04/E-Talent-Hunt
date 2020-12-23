package etalenthunt.list;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionList
 *
 */
@WebListener
public class SessionList implements HttpSessionListener {

    
	HttpSession hs=null;
	static int count=0;
	ServletContext sc=null;
	/**
     * Default constructor. 
     */
    public SessionList() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
    hs=se.getSession();
    count++;
    sc=hs.getServletContext();//session specific context
    sc.setAttribute("count", count);
    System.out.println("loginedUsers:"+count);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	 //hs=se.getSession();  
    	  count--;
    	  sc=hs.getServletContext();
    	  sc.setAttribute("count", count);
    	    System.out.println("session destroyedUsers:"+count);
    }
	
}
