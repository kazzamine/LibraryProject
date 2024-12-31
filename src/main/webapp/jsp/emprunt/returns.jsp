<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #edf2f7;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 900px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 40px;
        }
        h1 {
            color: #333;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .table {
            margin-top: 20px;
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table tbody tr {
            background-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: #e2e6ea;
        }
        .btn {
            border-radius: 20px;
            padding: 5px 15px;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }
        .alert {
            text-align: center;
            font-weight: bold;
        }
        .alert i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<%@ include file="../sidebar.jsp" %>

<div class="container">
    <h1><i class="fas fa-undo-alt"></i> Return Borrowed Books</h1>

    <!-- Table -->
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
            <tr>
                <th><i class="fas fa-book"></i> Book</th>
                <th><i class="fas fa-user"></i> User</th>
                <th><i class="fas fa-cogs"></i> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="emprunt" items="${emprunts}">
                <tr>
                    <td>${emprunt.livre.titre}</td>
                    <td>${emprunt.user.nom}</td>
                    <td>
                        <a href="emprunts?action=return&id=${emprunt.id}" class="btn btn-success btn-sm">
                            <i class="fas fa-check-circle"></i> Mark as Returned
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Feedback Messages -->
    <c:if test="${param.success != null}">
        <div class="alert alert-success mt-3">
            <i class="fas fa-check-circle"></i> ${param.success}
        </div>
    </c:if>
    <c:if test="${param.error != null}">
        <div class="alert alert-danger mt-3">
            <i class="fas fa-exclamation-triangle"></i> ${param.error}
        </div>
    </c:if>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
</body>
</html>
