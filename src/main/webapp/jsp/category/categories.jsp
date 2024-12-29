<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Categories</h1>

    <!-- Add New Category Button -->
    <div class="text-end mb-3">
        <a href="categories?action=addForm" class="btn btn-primary">Add New Category</a>
    </div>

    <!-- Categories Table -->
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${categories}">
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>
                    <a href="categories?action=edit&id=${category.id}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="categories?action=delete&id=${category.id}"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this category?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
