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
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Add New Book</h1>

    <form action="livres?action=add" method="post">
        <div class="mb-3">
            <label for="titre" class="form-label">Title</label>
            <input type="text" id="titre" name="titre" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="auteur" class="form-label">Author</label>
            <input type="text" id="auteur" name="auteur" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="dispo" class="form-label">Availability</label>
            <select id="dispo" name="dispo" class="form-select">
                <option value="true">Available</option>
                <option value="false">Unavailable</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="categoryId" class="form-label">Category</label>
            <select id="categoryId" name="categoryId" class="form-select" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Add Book</button>
            <a href="livres" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
