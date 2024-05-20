<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration/Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('background.jpg'); 
            background-size: cover;
            background-position: center;
        }

        .container {
            width: 300px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.5); 
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .form-section {
            display: none;
            margin-bottom: 20px;
        }

        .active {
            display: block;
        }

        #signup-button {
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #signup-button:hover {
            background-color: #218838;

    </style>
    <script>
        function showLoginForm() {
            document.getElementById('login-form').style.display = 'block';
            document.getElementById('signup-form').style.display = 'none';
        }

        function showSignupForm() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('signup-form').style.display = 'block';
        }

        function validateLoginForm() {
            var username = document.getElementById("login-username").value;
            var password = document.getElementById("login-password").value;
            if (username === "" || password === "") {
                alert("Username and password are required.");
                return false;
            }
            return true;
        }

        function validateSignupForm() {
            var username = document.getElementById("signup-username").value;
            var password = document.getElementById("signup-password").value;
            var confirmPassword = document.getElementById("confirm-password").value;
            var fullName = document.getElementById("full-name").value;
            if (username === "" || password === "" || confirmPassword === "" || fullName === "") {
                alert("All fields are required.");
                return false;
            }
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/Vidhyardhi_Vidhyaniketan";
    String USER = "root";
    String PASS = "Pyari$$";

    Connection conn = null;
    Statement stmt = null;

    try {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        if (request.getParameter("login-submit") != null) {
            String username = request.getParameter("login-username");
            String password = request.getParameter("login-password");
            String sql = "SELECT * FROM students WHERE username=? AND password=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                response.sendRedirect("/school/home.html");
            } else {
                out.println("<p class='error-message'>Invalid username or password.</p>");
            }
            rs.close();
            preparedStatement.close();
        }

        if (request.getParameter("signup-submit") != null) {
            String username = request.getParameter("signup-username");
            String password = request.getParameter("signup-password");
            String fullName = request.getParameter("full-name");
            String sql = "INSERT INTO students (username, password, full_name) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, fullName);
            preparedStatement.executeUpdate();

            out.println("<p class='error-message'>Signup successful. You can now login.</p>");
            preparedStatement.close();
        }
    } catch (SQLException se) {
        se.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException se2) {
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

<div class="container">
    <h2>Student Registration/Login</h2>
    
    
    <div id="login-form" class="form-section active">
        <form action="" method="post" onsubmit="return validateLoginForm()">
            Username: <input type="text" id="login-username" name="login-username"><br>
            Password: <input type="password" id="login-password" name="login-password"><br>
            <input type="submit" name="login-submit" value="Login">
            
        </form>
        <br/>
        <button id="signup-button" onclick="showSignupForm()">Sign Up</button>
    </div>
    
    <div id="signup-form" class="form-section">
        <form action="" method="post" onsubmit="return validateSignupForm()">
            Full Name: <input type="text" id="full-name" name="full-name"><br>
            Username: <input type="text" id="signup-username" name="signup-username"><br>
            Password: <input type="password" id="signup-password" name="signup-password"><br>
            Confirm Password: <input type="password" id="confirm-password" name="confirm-password"><br>
            <input type="submit" name="signup-submit" value="Signup">
        </form>
    </div>
</div>

</body>
</html>
