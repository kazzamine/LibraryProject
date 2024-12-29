<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Books List</h1>

    <!-- Add New Book Button -->
    <div class="text-end mb-3">
        <a href="livres?action=addForm" class="btn btn-primary">Add New Book</a>
    </div>

    <!-- Books Table -->
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Availability</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="livre" items="${livres}">
            <tr>
                <td>${livre.id}</td>
                <td>${livre.titre}</td>
                <td>${livre.auteur}</td>
                <td>
                    <span class="badge ${livre.dispo ? 'bg-success' : 'bg-danger'}">
                            ${livre.dispo ? "Available" : "Unavailable"}
                    </span>
                </td>
                <td>
                    <a href="livres?action=edit&id=${livre.id}" class="btn btn-sm btn-warning">Edit</a>
                    <a href="livres?action=delete&id=${livre.id}"
                       class="btn btn-sm btn-danger"
                       onclick="return confirm('Are you sure you want to delete this book?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
