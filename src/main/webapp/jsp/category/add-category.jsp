<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Category</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Add New Category</h1>

  <form action="categories?action=add" method="post">
    <div class="mb-3">
      <label for="name" class="form-label">Category Name</label>
      <input type="text" id="name" name="name" class="form-control" required>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Add Category</button>
      <a href="categories" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>
