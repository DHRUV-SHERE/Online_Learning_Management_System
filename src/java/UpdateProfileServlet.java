
import jakarta.resource.cci.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String phone = request.getParameter("phone");

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Record_021", "root", "root")) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE user_detail SET first_name = ?, last_name = ?, phone = ? WHERE email = ?"
            );
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, phone);
            stmt.setString(4, email);

            int updated = stmt.executeUpdate();
            if (updated > 0) {
                response.sendRedirect("profile");
            } else {
                request.setAttribute("error", "Profile update failed.");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
