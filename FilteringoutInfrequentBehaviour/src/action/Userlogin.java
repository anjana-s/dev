package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import java.sql.*;

/**
 * Servlet implementation class Userlogin
 */
@WebServlet("/Userlogin")
public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userlogin() {
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
		String  uname=request.getParameter("uname");
		String  upasss=request.getParameter("pass");
		try
		{
			
		String sql="select id from register where username=? and pass=?";
		Connection con=Db.getConnection();
		PreparedStatement st=con.prepareStatement(sql);
		st.setString(1,uname);
		st.setString(2,upasss);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			String i=rs.getString(1);
			HttpSession s=request.getSession();
			s.setAttribute("myid", i);
			response.sendRedirect("userpage.jsp");
		}
		else
		{
			response.sendRedirect("wronguser.jsp");
		}
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

}
