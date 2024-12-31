<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f8fb;
      font-family: 'Arial', sans-serif;
    }
    .container {
      max-width: 600px;
      background: #ffffff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
    }
    h1 {
      color: #007bff;
      font-weight: bold;
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
    }
    .btn-secondary {
      background-color: #6c757d;
      border: none;
    }
    .btn {
      border-radius: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <h1 class="text-center"><i class="fas fa-user-plus"></i> Add User</h1>
  <form action="users?action=add" method="post">
    <div class="mb-3">
      <label for="nom" class="form-label"><i class="fas fa-user"></i> Name</label>
      <input type="text" id="nom" name="nom" class="form-control" placeholder="Enter user name" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="Enter email address" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label"><i class="fas fa-lock"></i> Password</label>
      <input type="password" id="password" name="password" class="form-control" placeholder="Enter password" required>
    </div>
    <div class="mb-3">
      <label for="role" class="form-label"><i class="fas fa-user-tag"></i> Role</label>
      <select id="role" name="role" class="form-select">
        <option value="USER">User</option>
        <option value="ADMIN">Admin</option>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">
        <i class="fas fa-plus-circle"></i> Add User
      </button>
      <a href="users" class="btn btn-secondary">
        <i class="fas fa-times-circle"></i> Cancel
      </a>
    </div>
  </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
