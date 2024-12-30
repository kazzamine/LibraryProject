<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit User</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h1 class="text-center">Edit User</h1>
  <form action="users?action=update&id=${user.id}" method="post">
    <div class="mb-3">
      <label for="nom" class="form-label">Name</label>
      <input type="text" id="nom" name="nom" value="${user.nom}" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" id="email" name="email" value="${user.email}" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" id="password" name="password" value="${user.password}" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="role" class="form-label">Role</label>
      <select id="role" name="role" class="form-select">
        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
      </select>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">Update User</button>
      <a href="users" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>
