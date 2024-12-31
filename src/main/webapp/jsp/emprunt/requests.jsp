<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h1 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .table {
            border: 1px solid #dee2e6;
            border-radius: 5px;
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
        .btn-success {
            background-color: #28a745;
            border: none;
        }
        .btn-danger {
            background-color: #dc3545;
            border: none;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center"><i class="fas fa-envelope"></i> Borrow Requests</h1>

    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead>
            <tr>
                <th><i class="fas fa-book"></i> Book</th>
                <th><i class="fas fa-user"></i> User</th>
                <th><i class="fas fa-tools"></i> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="emprunt" items="${emprunts}">
                <tr>
                    <td>${emprunt.livre.titre}</td>
                    <td>${emprunt.user.nom}</td>
                    <td>
                        <a href="emprunts?action=approve&id=${emprunt.id}" class="btn btn-sm btn-success">
                            <i class="fas fa-check"></i> Approve
                        </a>
                        <a href="emprunts?action=reject&id=${emprunt.id}" class="btn btn-sm btn-danger">
                            <i class="fas fa-times"></i> Reject
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
