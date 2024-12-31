<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrow Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Borrow Requests</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Book</th>
            <th>User</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="emprunt" items="${emprunts}">
            <tr>
                <td>${emprunt.livre.titre}</td>
                <td>${emprunt.user.nom}</td>
                <td>
                    <a href="emprunts?action=approve&id=${emprunt.id}" class="btn btn-success">Approve</a>
                    <a href="emprunts?action=reject&id=${emprunt.id}" class="btn btn-danger">Reject</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
