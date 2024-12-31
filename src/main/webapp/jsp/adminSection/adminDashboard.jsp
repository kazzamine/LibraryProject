<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }
    h1 {
      color: #343a40;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .list-group-item {
      font-size: 1.2rem;
      transition: transform 0.2s, background-color 0.3s;
    }
    .list-group-item:hover {
      transform: scale(1.02);
      background-color: #e9ecef;
    }
    .container {
      max-width: 600px;
    }
  </style>
</head>
<body>
<div class="container mt-5 shadow-lg p-4 bg-white rounded">
  <h1 class="text-center">Admin Dashboard</h1>

  <div class="list-group">
    <a href="users?action=list" class="list-group-item list-group-item-action">Manage Users</a>
    <a href="livres?action=list" class="list-group-item list-group-item-action">Manage Books</a>
    <a href="categories?action=list" class="list-group-item list-group-item-action">Manage Categories</a>
    <a href="emprunts?action=list" class="list-group-item list-group-item-action">View Borrowing Records</a>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
