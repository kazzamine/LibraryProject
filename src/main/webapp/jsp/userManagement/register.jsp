<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Register</h1>
    <form action="register" method="post">
        <div class="mb-3">
            <label for="nom" class="form-label">Name</label>
            <input type="text" id="nom" name="nom" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="role" class="form-label">Role</label>
            <select id="role" name="role" class="form-select" required>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Register</button>
        </div>
    </form>
</div>
</body>
</html>
