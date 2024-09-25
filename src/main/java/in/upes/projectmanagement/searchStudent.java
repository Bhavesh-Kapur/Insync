package in.upes.projectmanagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class searchStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

   // Database credentials
   private static final String DB_URL = "jdbc:mysql://localhost:3306/insync";
   private static final String DB_USER = "root";     //enter your username 
   private static final String DB_PASSWORD = "rootbhavesh";   //enter your password 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String sapid = request.getParameter("sapid");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT * FROM student WHERE sapid = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, sapid);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                String name = rs.getString("name");
                int sapId = rs.getInt("sapid");
                int sem = rs.getInt("semester");
                String program = rs.getString("program");

                HttpSession session = request.getSession();
                System.out.println(session);       //to check if this is creating a new session everytime or not whenever a search student request is raised 
                
                session.setAttribute("name", name);
                session.setAttribute("program", program);
                session.setAttribute("sapid", sapId);
                session.setAttribute("semester", sem);
                response.sendRedirect("searchStudent.jsp"); 
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}