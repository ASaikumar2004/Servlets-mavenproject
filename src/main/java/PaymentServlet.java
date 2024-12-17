import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/payment")
public class PaymentServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String c=req.getParameter("cardnumber");
		String ed=req.getParameter("expirydate");
		String cv=req.getParameter("cvv");
		String n=req.getParameter("nameoncard");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/swiggy", "root", "root");
			String sql="insert into paymentdetails(cardnumber,expirydate,cvv,nameoncard) values(?,?,?,?)";
			PreparedStatement pmst=conn.prepareStatement(sql);
			pmst.setString(1, c);
			pmst.setString(2, ed);
			pmst.setString(3, cv);
			pmst.setString(4, n);
			int i=pmst.executeUpdate();
			if(i > 0) {
				resp.sendRedirect("welcome.jsp");
			}
			else {
				resp.sendRedirect("payment.jsp");
			}
			pmst.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
