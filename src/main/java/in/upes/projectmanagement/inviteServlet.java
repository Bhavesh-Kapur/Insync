package in.upes.projectmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;



import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class inviteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Retrieve the student details from the form (sent via POST)
        int sapid = Integer.parseInt("sapid");
        String name = request.getParameter("name");
        int semester = Integer.parseInt("semester");
        String program = request.getParameter("program");
        HttpSession session = request.getSession(false);
        String invitedBy = "Admin"; 
        if (session != null && session.getAttribute("name") != null) {
            invitedBy = (String) session.getAttribute("name");  
        }
        
        try {
            Connection con = databaseConnection.initializeDatabase(); 

            String query = "INSERT INTO invites (sap_id, name, semester, program, invite_status, invited_by) " +
                           "VALUES (?, ?, ?, ?, 'pending', ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, sapid);
            ps.setString(2, name);
            ps.setInt(3, semester);
            ps.setString(4, program);
            ps.setString(5, invitedBy);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Invitation successfully added to the database.");
                
                sendEmailInvite(name, sapid);
                
                //redirect page requried frontend request
                // response.sendRedirect("output.jsp?invite=success");
            } else {
                System.out.println("Failed to add invitation.");
                response.sendRedirect("output.jsp?invite=failure");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // Step 4: Method to send an email invite using JavaMail API
    private void sendEmailInvite(String name, int sapid) {
        // Set up email properties
        String to = "";  // The email address of the invitee (replace this with actual logic to fetch email)
        String from = "";  // The sender's email address
        String host = "";   // Your SMTP server (replace with actual server)
        
        // Set up mail server properties
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.port", "587");  // Default SMTP port
        properties.put("mail.smtp.auth", "true");         // SMTP authentication required
        properties.put("mail.smtp.starttls.enable", "true");  // Enable TLS

        // Step 5: Authenticate the session with the SMTP server
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("", "");
            }
        });

        try {
            // Step 6: Create a default MimeMessage object
            MimeMessage message = new MimeMessage(session);

            // Set the From, To, and Subject fields
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Invitation to Join");

            // Set the email body
            message.setText("Hello " + name + ",\n\nYou have been invited to the program.\n\n" +
                    "Your SAP ID: " + sapid + "\n" +
                    "Please visit the portal to accept the invitation.\n\nRegards,\nAdmin Team");

            // Step 7: Send the email
            Transport.send(message);
            System.out.println("Sent invitation email successfully to: " + name);

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
}