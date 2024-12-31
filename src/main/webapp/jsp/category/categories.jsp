<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
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
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-warning {
            color: #ffffff;
        }
        table {
            border-radius: 10px;
            overflow: hidden;
        }
    </style>
</head>
<body>
<%@ include file="../sidebar.jsp" %>

<div class="container mt-5">
    <h1 class="text-center"><i class="fas fa-list-alt"></i> Categories</h1>

    <!-- Add New Category Button -->
    <div class="text-end mb-3">
        <a href="categories?action=addForm" class="btn btn-primary">
            <i class="fas fa-plus-circle"></i> Add New Category
        </a>
    </div>

    <!-- Categories Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
            <tr>
                <th><i class="fas fa-hashtag"></i> ID</th>
                <th><i class="fas fa-tag"></i> Name</th>
                <th><i class="fas fa-cogs"></i> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                        <a href="categories?action=edit&id=${category.id}" class="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="categories?action=delete&id=${category.id}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this category?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
