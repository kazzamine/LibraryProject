<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Transactions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Borrow Transactions</h1>

    <!-- Navigation Buttons -->
    <div class="mb-3">
        <a href="emprunts?action=requests" class="btn btn-primary">View Borrow Requests</a>
        <a href="emprunts?action=history" class="btn btn-secondary">View Borrow History</a>
        <a href="emprunts?action=returns" class="btn btn-success">View Return Requests</a>
    </div>

    <!-- Borrow Transactions Table -->
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Book Title</th>
            <th>Borrower</th>
            <th>Start Date</th>
            <th>Due Date</th>
            <th>Status</th>
            <th>Actions</th>
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
                <td>${emprunt.status}</td>
                <td>
                    <!-- Button to Approve Borrow Requests -->
                    <c:if test="${emprunt.status == 'PENDING'}">
                        <form action="emprunts" method="post" class="d-inline">
                            <input type="hidden" name="action" value="approve">
                            <input type="hidden" name="empruntId" value="${emprunt.id}">
                            <button type="submit" class="btn btn-sm btn-success">Approve</button>
                        </form>
                        <form action="emprunts" method="post" class="d-inline">
                            <input type="hidden" name="action" value="reject">
                            <input type="hidden" name="empruntId" value="${emprunt.id}">
                            <button type="submit" class="btn btn-sm btn-danger">Reject</button>
                        </form>
                    </c:if>

                    <!-- Button to Return Books -->
                    <c:if test="${emprunt.status == 'BORROWED'}">
                        <form action="emprunts" method="post" class="d-inline">
                            <input type="hidden" name="action" value="return">
                            <input type="hidden" name="empruntId" value="${emprunt.id}">
                            <button type="submit" class="btn btn-sm btn-warning">Return</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
