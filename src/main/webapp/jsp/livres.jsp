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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f4f8fb;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        h1 {
            color: #007bff;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 10px;
        }
        .table {
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        .table th {
            background-color: #343a40;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .badge {
            font-size: 0.9rem;
            padding: 5px 10px;
        }
        .btn-sm {
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1><i class="fas fa-book"></i> Books List</h1>

    <!-- Add New Book Button -->
    <div class="text-end mb-3">
        <a href="livres?action=addForm" class="btn btn-primary">
            <i class="fas fa-plus-circle"></i> Add New Book
        </a>
    </div>

    <!-- Books Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead>
            <tr>
                <th><i class="fas fa-id-badge"></i> ID</th>
                <th><i class="fas fa-heading"></i> Title</th>
                <th><i class="fas fa-user"></i> Author</th>
                <th><i class="fas fa-check-circle"></i> Availability</th>
                <th><i class="fas fa-tools"></i> Actions</th>
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
                        <a href="livres?action=edit&id=${livre.id}" class="btn btn-sm btn-warning">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="livres?action=delete&id=${livre.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this book?');">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                        <c:if test="${livre.dispo}">
                            <form action="emprunts" method="post" class="d-inline">
                                <input type="hidden" name="action" value="borrow">
                                <input type="hidden" name="livreId" value="${livre.id}">
                                <button type="submit" class="btn btn-sm btn-primary">
                                    <i class="fas fa-book-reader"></i> Borrow
                                </button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
