package in.upes.projectmanagement.Student;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class dashboardServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if("teamCreation".equals(action)){
            // response.sendRedirect(searchStudent.jsp);
        }


        //rest routing can be done here 
    }
}
