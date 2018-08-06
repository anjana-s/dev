package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
       PrintWriter out=response.getWriter();
		
		try{
			
				String user=null,pass=null,email=null,addr=null,phno=null;
				
	            user=request.getParameter("uname");
	            pass=request.getParameter("pass");
	            email=request.getParameter("email");
	            addr=request.getParameter("address");
	            phno=request.getParameter("phone");
	            
	            
	            
	            
				Connection connection=Db.getConnection();
			
				PreparedStatement ps=connection.prepareStatement("insert into register(Username, Pass, Email, Address, Mob) values(?,?,?,?,?)");
			    
				ps.setString(1,user);
			    ps.setString(2,pass);
				ps.setString(3,email);
				ps.setString(4,addr);	
				ps.setString(5,phno); 
				
				
				int x=ps.executeUpdate();
						if(x>0)
						{
							out.println("<script type=\"text/javascript\">");
						    out.println("alert('Registration Successful');");
						    out.println("</script>");
						   response.sendRedirect("userlogin.jsp");	
						}
						else
						{
							out.println("<script type=\"text/javascript\">");
						    out.println("alert('Failed to Register');");
						    out.println("</script>");
							response.sendRedirect("registererror.jsp");	
						}
			}
			catch (Exception e) 
			{
				out.println(e.getMessage());
			}
	}

}
