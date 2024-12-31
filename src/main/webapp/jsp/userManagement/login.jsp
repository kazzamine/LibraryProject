<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f8fb;
      font-family: 'Arial', sans-serif;
    }
    .container {
      max-width: 400px;
      background: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-top: 80px;
    }
    h1 {
      color: #007bff;
      font-weight: bold;
      text-align: center;
    }
    .form-label {
      font-weight: bold;
    }
    .form-control {
      border-radius: 10px;
    }
    .btn-primary {
      background-color: #007bff;
      border: none;
      width: 100%;
    }
    .alert {
      text-align: center;
    }
    .icon-container {
      text-align: center;
      margin-bottom: 20px;
    }
    .icon-container i {
      font-size: 50px;
      color: #007bff;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="icon-container">
    <i class="fas fa-user-circle"></i>
  </div>
  <h1>Login</h1>
  <form action="login" method="post" class="mt-4">
    <div class="mb-3">
      <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label"><i class="fas fa-lock"></i> Password</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
    </div>
    <c:if test="${not empty error}">
      <div class="alert alert-danger mt-3">
        <i class="fas fa-exclamation-triangle"></i> ${error}
      </div>
    </c:if>
    <div class="text-center">
      <button type="submit" class="btn btn-primary mt-3">
        <i class="fas fa-sign-in-alt"></i> Login
      </button>
    </div>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
