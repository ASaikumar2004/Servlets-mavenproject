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
@WebServlet("/delete")
public class deleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		try {
			PrintWriter pw=resp.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/swiggy","root","root");
			String sql="delete from login where email=?";
			PreparedStatement pmst=conn.prepareStatement(sql);
			pmst.setString(1, email);
			int i=pmst.executeUpdate();
			if(i == 0) {
				pw.println("deleted successful");		
			}
			else {
				pw.println("error");
			}
			pmst.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
