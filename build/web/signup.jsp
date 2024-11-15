<%-- 
    Document   : signup
    Created on : Nov 15, 2024, 12:52:52 PM
    Author     : SHERE
--%>

<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register Page</title>
  <link rel="stylesheet" href="static/css/signup.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
</head>
<body class="text-center">

<%
  String regEmail = request.getParameter("email");
  String regPassword = request.getParameter("password");
  String firstName = request.getParameter("first_name");
  String lastName = request.getParameter("last_name");
  String phone = request.getParameter("phone");
  String message = "";

  if (regEmail != null && regPassword != null && firstName != null && lastName != null && phone != null) {
      try {
          Class.forName("org.apache.derby.jdbc.ClientDriver"); // Derby DB driver
          Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Record_021", "root", "root");

          PreparedStatement ps = conn.prepareStatement(
              "INSERT INTO user_detail (email, password, first_name, last_name, phone) VALUES (?, ?, ?, ?, ?)"
          );
          ps.setString(1, regEmail);
          ps.setString(2, regPassword);
          ps.setString(3, firstName);
          ps.setString(4, lastName);
          ps.setString(5, phone);

          int result = ps.executeUpdate();

          if (result > 0) {
              // Registration successful
              response.sendRedirect("Login.jsp"); // Ensure Login.jsp is accessible
              return; // Stop further execution
          } else {
              message = "Registration failed. Try again.";
          }

          ps.close();
          conn.close();
      } catch (Exception e) {
          e.printStackTrace();
          message = "Error occurred during registration.";
      }
  }
%>

<main class="form-signin">
  <form method="POST" action="signup.jsp">
    <!--<img class="mb-4" src="https://getbootstrap.com/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
    <h1 class="h3 mb-3 fw-normal form-elm">Register</h1>

    <div class="form-floating form-elm">
      <label for="floatingFirstName">First Name</label>
      <input type="text" class="form-control" id="floatingFirstName" placeholder="First Name" name="first_name" required>
    </div>
    <div class="form-floating form-elm">
      <label for="floatingLastName">Last Name</label>
      <input type="text" class="form-control" id="floatingLastName" placeholder="Last Name" name="last_name" required>
    </div>
    <div class="form-floating form-elm">
      <label for="floatingInput">Email address</label>
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="email" required>
    </div>
    <div class="form-floating form-elm">
      <label for="floatingPhone">Phone</label>
      <input type="text" class="form-control" id="floatingPhone" placeholder="Phone Number" name="phone" required>
    </div>
    <div class="form-floating form-elm">
      <label for="floatingPassword">Password</label>
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
    </div>

    <button class="w-100 btn btn-lg btn-primary " type="submit">Register</button>
    
  </form>
  <p><%= message %></p>
</main>

</body>
</html>
