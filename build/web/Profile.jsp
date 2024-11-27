<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Retrieve user session details
    String userId = (String) session.getAttribute("user_id");

//    if (userId == null) {
//        response.sendRedirect("Login.jsp");
//        return;
//    }

    // Database connection and user data retrieval
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String userName = "", email = "", joinDate = "", phone = "", profileImageUrl = "img/default_profile.png";

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver"); // Derby DB driver
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Record_021", "root", "root");
        
        // Fetch user details
        ps = conn.prepareStatement("SELECT first_name, last_name, email, phone, join_date, profile_image FROM user_detail WHERE user_id = ?");
        ps.setString(1, userId);
        rs = ps.executeQuery();

        if (rs.next()) {
            userName = rs.getString("first_name") + " " + rs.getString("last_name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            joinDate = rs.getString("join_date");
            
            Blob profileImageBlob = rs.getBlob("profile_image");
            if (profileImageBlob != null) {
                profileImageUrl = "HelperJSP/DisplayImage.jsp?user_id=" + userId;
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="static/css/profile.css">
</head>
<body>
<div class="profile-container">
    <img src="<%= profileImageUrl %>" alt="Profile Picture" id="profile-pic">
    <table>
        <tr>
            <td><strong>Full Name:</strong></td>
            <td><input type="text" value="<%= userName %>" class="profile-input" id="user-name" readonly></td>
        </tr>
        <tr>
            <td><strong>Email:</strong></td>
            <td><input type="text" value="<%= email %>" class="profile-input" readonly></td>
        </tr>
        <tr>
            <td><strong>Phone:</strong></td>
            <td><input type="text" value="<%= phone %>" class="profile-input" readonly></td>
        </tr>
        <tr>
            <td><strong>Joined Date:</strong></td>
            <td><input type="text" value="<%= joinDate %>" class="profile-input" readonly></td>
        </tr>
    </table>

    <div class="profile-buttons">
        <button onclick="enableEdit()">Edit Profile</button>
        <button onclick="saveProfile()">Save</button>
        <button onclick="logout()">Logout</button>
    </div>
</div>

<script>
    function enableEdit() {
        document.querySelectorAll(".profile-input").forEach(input => input.removeAttribute("readonly"));
        document.getElementById("profile-pic").addEventListener("click", () => {
            alert("Upload new profile picture functionality here.");
        });
    }

    function saveProfile() {
        alert("Save profile changes functionality here.");
        // Logic to send the updated data to the server
    }

    function logout() {
        window.location.href = "LogOut.jsp";
    }
</script>
</body>
</html>
