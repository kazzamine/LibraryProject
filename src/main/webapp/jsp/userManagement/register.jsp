<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f4f8fb;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 500px;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h1 {
            color: #007bff;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control, .form-select {
            border-radius: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            width: 100%;
        }
        .btn {
            border-radius: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><i class="fas fa-user-plus"></i> Register</h1>
    <form action="register" method="post">
        <div class="mb-3">
            <label for="nom" class="form-label"><i class="fas fa-user"></i> Name</label>
            <input type="text" id="nom" name="nom" class="form-control" placeholder="Enter your name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label"><i class="fas fa-user-tag"></i> Role</label>
            <select id="role" name="role" class="form-select" required>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-user-check"></i> Register
            </button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
