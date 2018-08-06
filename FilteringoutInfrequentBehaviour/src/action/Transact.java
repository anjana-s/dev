package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class Transact
 */
@WebServlet("/Transact")
public class Transact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String myid=session.getAttribute("myid").toString();
		int myid1=Integer.parseInt(myid);
		String itemid=request.getParameter("i");
		int itemid1=Integer.parseInt(itemid);
		String sprice=request.getParameter("p");
		float sprice1=Float.parseFloat(sprice);
		System.out.println();
		System.out.println(sprice1);
		float gp=35f;
		float p=sprice1*(gp/100);
		System.out.println(p);
		float cp=sprice1-p;
		try{
			Connection con=Db.getConnection();
			 String sql="insert into transact(userid, Productid, Profit) values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, myid1);
			ps.setInt(2, itemid1);
			ps.setFloat(3, p);
			int x=ps.executeUpdate();
		    if(x>0)
		    {
		    	response.sendRedirect("Thankyou.jsp");
		    }
		    else
		    {
		    	response.sendRedirect("Errorintrans.jsp");
		    }
		}
		catch(Exception e)
		{
			System.out.print(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
