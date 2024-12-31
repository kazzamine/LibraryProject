<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f4f8fb;
    }
    h1 {
      color: #007bff;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .list-group-item {
      font-size: 1.2rem;
      transition: transform 0.2s, background-color 0.3s;
      display: flex;
      align-items: center;
    }
    .list-group-item:hover {
      transform: scale(1.02);
      background-color: #e7f3ff;
    }
    .icon {
      margin-right: 15px;
      color: #007bff;
    }
    .container {
      max-width: 600px;
    }
    .shadow-container {
      background: white;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <div class="shadow-container">
    <h1 class="text-center"><i class="fas fa-tachometer-alt icon"></i>Admin Dashboard</h1>

    <div class="list-group">
      <a href="users?action=list" class="list-group-item list-group-item-action">
        <i class="fas fa-users icon"></i> Manage Users
      </a>
      <a href="livres?action=list" class="list-group-item list-group-item-action">
        <i class="fas fa-book icon"></i> Manage Books
      </a>
      <a href="categories?action=list" class="list-group-item list-group-item-action">
        <i class="fas fa-tags icon"></i> Manage Categories
      </a>
      <a href="emprunts?action=list" class="list-group-item list-group-item-action">
        <i class="fas fa-history icon"></i> View Borrowing Records
      </a>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
