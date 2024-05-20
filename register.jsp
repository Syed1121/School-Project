<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Database connection details
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/Vidhyardhi_Vidhyaniketan";
    String USER = "root";
    String PASS = "Pyari$$";

    // Retrieve form parameters
    String fullName = request.getParameter("full-name");
    String fatherName = request.getParameter("father-name");
    String motherName = request.getParameter("mother-name");
    String studentClass = request.getParameter("student-class");
    String oldSchool = request.getParameter("old-school");
    String phoneNumber = request.getParameter("phone-number");
    String address = request.getParameter("address");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement preparedStatement = null;

    try {
        // Register JDBC driver
        Class.forName(JDBC_DRIVER);

        // Open a connection
        conn = DriverManager.getConnection(DB_URL, USER, PASS);

        // Create SQL query to insert data into the database
        String sql = "INSERT INTO registration (full_name, father_name, mother_name, student_class, old_school, phone_number, address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, fullName);
        preparedStatement.setString(2, fatherName);
        preparedStatement.setString(3, motherName);
        preparedStatement.setString(4, studentClass);
        preparedStatement.setString(5, oldSchool);
        preparedStatement.setString(6, phoneNumber);
        preparedStatement.setString(7, address);
        preparedStatement.setString(8, username);
        preparedStatement.setString(9, password);

        // Execute the query
        int rowsInserted = preparedStatement.executeUpdate();

        if (rowsInserted > 0) {
            // Registration successful, redirect to home.html
            response.sendRedirect("home.html");
            return; // Stop further execution of the page
        } else {
            out.println("<h2>Error occurred during registration</h2>");
        }
    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        // Handle errors for Class.forName
        e.printStackTrace();
    } finally {
        // Finally block to close resources
        try {
            if (preparedStatement != null) preparedStatement.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
        try {
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>
