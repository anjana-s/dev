package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class Additem
 */
@WebServlet("/Additem")
public class Additem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Additem() {
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
		
        System.out.println("upload");
		
		PrintWriter out=response.getWriter();
		
		
		String shopname=null,productname=null,category=null, price=null,url=null,image=null;
		int imageNum=0;
		String []arr;
	//	String passigndname=request.getParameter("dname");
		
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.print("isMulitipart "+isMultipart);
		 if (isMultipart)
		 {
             FileItemFactory factory = new DiskFileItemFactory();
             ServletFileUpload upload = new ServletFileUpload(factory);
		             try
		             {
		            	// Parse the request
		 				List items = upload.parseRequest(request);
		 				Iterator iterator = items.iterator();
		 				while (iterator.hasNext()) 
					 	  {
					
					 					FileItem item = (FileItem) iterator.next();
					 				 	//System.out.println("Item="+item);
						 				 	if (!item.isFormField()) 
						 				 	{
						 				 		System.out.println("upload form");
						 				 		String name = item.getName();
						 		                System.out.println("FileName "+name);
						 		                 
						 		                String root = getServletContext().getRealPath("/");
						 		                System.out.println(root);
						 		                File path = new File(Myimagepath.mypath+"/itempic/"+productname+"/");
								 		                if (!path.exists()) 
								 		                {
								 		                 	 boolean status = path.mkdirs();
								 		                }
						 		               
						 		                
						 		                String imgfilename=name;
						 		                
						 		                File uploadedFile = new File(path + "/"+imgfilename);
						 		                
								 		                if(!uploadedFile.exists())
								 						{
								 							imageNum++;
								 							uploadedFile = new File(path + "/"+imgfilename);
								 						}
						 		                
						 		                String dbpath="itempic/"+productname+"/"+imgfilename;
								               
						 		                System.out.println("dbpath::"+dbpath);	
						 		                	 
						 		                String sql="insert into itemadd(Shopname, Productname, Category, Url, Price,image) values('"+shopname+"','"+productname+"','"+category+"','"+url+"','"+price+"','"+dbpath+"') ";
						 		                Connection con=Db.getConnection();
						 		                Statement st=con.createStatement();
						 		                int y=st.executeUpdate(sql);
								 		                if(y>0)
								 		                {
								 		               item.write(uploadedFile);
								 		              response.sendRedirect("Additem.jsp");	
								 		                }
								 		                else
								 		                {
								 		                	System.out.println("unable to upload");
								 		                	response.sendRedirect("ErrorInAdding.jsp");	
								 		                }
								 		              
						 				 	 }
						 				 	 else
						 				 	 {
						 				 		if(item.getFieldName().equals("url"))
												{   
													url=item.getString();
													System.out.println(url);
													//response.sendRedirect("HostingADomain.jsp");	
						                            
												}
						 				 		else if(item.getFieldName().equals("shopname"))
												{   
													shopname=item.getString();
													System.out.println(shopname);
													//response.sendRedirect("HostingADomain.jsp");	
						                            
												}
						 				 		else if(item.getFieldName().equals("productname"))
												{   
													productname=item.getString();
													System.out.println(productname);
													//response.sendRedirect("HostingADomain.jsp");	
						                            
												}
						 				 		else if(item.getFieldName().equals("category"))
												{   
													category=item.getString();
													System.out.println(category);
													//response.sendRedirect("HostingADomain.jsp");	
						                            
												}
						 				 		else if(item.getFieldName().equals("price"))
												{   
													price=item.getString();
													System.out.println(price);
													//response.sendRedirect("HostingADomain.jsp");	
						                            
												}
						 				 		
						 				 		//else
						 				 		//{
						 				 			//response.sendRedirect("HostingError.jsp");	
						 				 		//}
						 				 		
						 				 	 }
						                
					     }
		 				
		 				
			          }
			          catch(Exception e)
			          {
			            	 System.out.println(e);
			          }
             
        
         	
		 }
		
		
		
	}

}
