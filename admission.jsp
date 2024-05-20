<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vidhyardhi Vidhyaniketan</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('schoolbg.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: rgba(0,0,0,0.7);
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff;
            font-weight: bold;
        }
        .navbar-nav .nav-link:hover {
            color: blue !important; 
        }
        .navbar-brand:hover {
            color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
            max-width: 600px; /* Reduced container width */
        }
        /* Form Container */
        .form-container {
            background-color: rgba(255, 255, 255, 0.3);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
        }
        /* Jumbotron */
        .jumbotron {
            background-color: rgba(0,0,0,0.4);
            color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
            text-align: center;
        }
        .jumbotron h2 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
        }
        /* Form Inputs */
        .form-control {
            border-radius: 5px;
            margin-bottom: 10px;
        }
        /* Button */
        .btn {
            text-decoration: none;
            color: black;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Vidhyardhi Vidhyaniketan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home.html">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/school/about.html">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/school/contact.html">Contact Us</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <h2>Student Registration</h2>
    </div>
    <div class="form-container">
        <form action="/school/register.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="full-name">Full Name:</label>
                <input type="text" class="form-control" id="full-name" name="full-name">
            </div>
            <div class="form-group">
                <label for="father-name">Father's Name:</label>
                <input type="text" class="form-control" id="father-name" name="father-name">
            </div>
            <div class="form-group">
                <label for="mother-name">Mother's Name:</label>
                <input type="text" class="form-control" id="mother-name" name="mother-name">
            </div>
            <div class="form-group">
                <label for="student-class">Class:</label>
                <input type="text" class="form-control" id="student-class" name="student-class">
            </div>
            <div class="form-group">
                <label for="old-school">Old School:</label>
                <input type="text" class="form-control" id="old-school" name="old-school">
            </div>
            <div class="form-group">
                <label for="phone-number">Phone Number:</label>
                <input type="tel" class="form-control" id="phone-number" name="phone-number">
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" class="form-control" id="confirm-password" name="confirm-password">
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Client-side form validation -->
<script>
    function validateForm() {
        var fullName = document.getElementById("full-name").value;
        var fatherName = document.getElementById("father-name").value;
        var motherName = document.getElementById("mother-name").value;
        var studentClass = document.getElementById("student-class").value;
        var oldSchool = document.getElementById("old-school").value;
        var phoneNumber = document.getElementById("phone-number").value;
        var address = document.getElementById("address").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm-password").value;

        if (fullName === "" || fatherName === "" || motherName === "" || studentClass === "" || oldSchool === "" || phoneNumber === "" || address === "" || username === "" || password === "" || confirmPassword === "") {
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
</body>
</html>
