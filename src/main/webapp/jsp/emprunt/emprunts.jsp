<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Transactions</title>
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
        }
        .btn-secondary {
            background-color: #6c757d;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-warning {
            background-color: #ffc107;
            color: #fff;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .table thead th {
            text-align: center;
        }
        .table tbody td {
            text-align: center;
        }
        .actions button {
            margin: 0 2px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center"><i class="fas fa-book"></i> Borrow Transactions</h1>

    <!-- Navigation Buttons -->
    <div class="text-center mb-4">
        <a href="emprunts?action=requests" class="btn btn-primary me-2">
            <i class="fas fa-envelope"></i> View Borrow Requests
        </a>
        <a href="emprunts?action=history" class="btn btn-secondary me-2">
            <i class="fas fa-history"></i> View Borrow History
        </a>
        <a href="emprunts?action=returns" class="btn btn-success">
            <i class="fas fa-undo"></i> View Return Requests
        </a>
    </div>

    <!-- Borrow Transactions Table -->
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
            <tr>
                <th><i class="fas fa-hashtag"></i> ID</th>
                <th><i class="fas fa-book"></i> Book Title</th>
                <th><i class="fas fa-user"></i> Borrower</th>
                <th><i class="fas fa-calendar-alt"></i> Start Date</th>
                <th><i class="fas fa-calendar-check"></i> Due Date</th>
                <th><i class="fas fa-info-circle"></i> Status</th>
                <th><i class="fas fa-tools"></i> Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="emprunt" items="${emprunts}">
                <tr>
                    <td>${emprunt.id}</td>
                    <td>${emprunt.livre.titre}</td>
                    <td>${emprunt.user.nom}</td>
                    <td>${emprunt.startDate}</td>
                    <td>${emprunt.dueDate}</td>
                    <td>
                        <span class="badge
                            <c:choose>
                                <c:when test="${emprunt.status == 'PENDING'}">bg-warning</c:when>
                                <c:when test="${emprunt.status == 'BORROWED'}">bg-primary</c:when>
                                <c:when test="${emprunt.status == 'RETURNED'}">bg-success</c:when>
                                <c:otherwise>bg-secondary</c:otherwise>
                            </c:choose>
                        ">
                                ${emprunt.status}
                        </span>
                    </td>
                    <td class="actions">
                        <c:if test="${emprunt.status == 'PENDING'}">
                            <form action="emprunts" method="post" class="d-inline">
                                <input type="hidden" name="action" value="approve">
                                <input type="hidden" name="empruntId" value="${emprunt.id}">
                                <button type="submit" class="btn btn-sm btn-success">
                                    <i class="fas fa-check"></i> Approve
                                </button>
                            </form>
                            <form action="emprunts" method="post" class="d-inline">
                                <input type="hidden" name="action" value="reject">
                                <input type="hidden" name="empruntId" value="${emprunt.id}">
                                <button type="submit" class="btn btn-sm btn-danger">
                                    <i class="fas fa-times"></i> Reject
                                </button>
                            </form>
                        </c:if>

                        <c:if test="${emprunt.status == 'BORROWED'}">
                            <form action="emprunts" method="post" class="d-inline">
                                <input type="hidden" name="action" value="return">
                                <input type="hidden" name="empruntId" value="${emprunt.id}">
                                <button type="submit" class="btn btn-sm btn-warning">
                                    <i class="fas fa-undo"></i> Return
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

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min
