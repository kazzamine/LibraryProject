<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Login</h1>
  <form action="login" method="post">
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" id="email" name="email" class="form-control" required>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Login</button>
    </div>
  </form>
</div>
</body>
</html>
