<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book</title>
    <!-- Bootstrap CSS -->
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
            text-align: center;
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
            width: 100%;
            margin-bottom: 10px;
        }
        .btn-secondary {
            width: 100%;
        }
    </style>
</head>
<body>
<%@ include file="./sidebar.jsp" %>

<div class="container">
    <h1><i class="fas fa-book"></i> Add New Book</h1>

    <form action="livres?action=add" method="post">
        <div class="mb-3">
            <label for="titre" class="form-label"><i class="fas fa-heading"></i> Title</label>
            <input type="text" id="titre" name="titre" class="form-control" placeholder="Enter book title" required>
        </div>

        <div class="mb-3">
            <label for="auteur" class="form-label"><i class="fas fa-user"></i> Author</label>
            <input type="text" id="auteur" name="auteur" class="form-control" placeholder="Enter author's name" required>
        </div>

        <div class="mb-3">
            <label for="dispo" class="form-label"><i class="fas fa-check-circle"></i> Availability</label>
            <select id="dispo" name="dispo" class="form-select">
                <option value="true">Available</option>
                <option value="false">Unavailable</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="categoryId" class="form-label"><i class="fas fa-tags"></i> Category</label>
            <select id="categoryId" name="categoryId" class="form-select" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-plus-circle"></i> Add Book
            </button>
            <a href="livres" class="btn btn-secondary">
                <i class="fas fa-times-circle"></i> Cancel
            </a>
        </div>
    </form>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
