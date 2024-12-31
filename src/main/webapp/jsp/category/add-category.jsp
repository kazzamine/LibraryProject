<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Category</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    h1 {
      color: #007bff;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .form-label {
      font-weight: bold;
    }
    .form-control {
      border: 1px solid #ced4da;
      border-radius: 0.5rem;
      box-shadow: none;
      transition: border-color 0.3s, box-shadow 0.3s;
    }
    .form-control:focus {
      border-color: #007bff;
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }
    .shadow-container {
      background: white;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
<%@ include file="../sidebar.jsp" %>

<div class="container mt-5">
  <div class="shadow-container">
    <h1 class="text-center"><i class="fas fa-plus-circle"></i> Add New Category</h1>

    <form action="categories?action=add" method="post">
      <div class="mb-3">
        <label for="name" class="form-label">
          <i class="fas fa-tag"></i> Category Name
        </label>
        <input type="text" id="name" name="name" class="form-control" placeholder="Enter category name" required>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-primary">
          <i class="fas fa-save"></i> Add Category
        </button>
        <a href="categories" class="btn btn-secondary">
          <i class="fas fa-times"></i> Cancel
        </a>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
