<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        table { border-collapse: collapse; width: 400px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>
    <h2>Employee Details</h2>
    <table>
        <tr><th>Field</th><th>Value</th></tr>
        <tr><td>ID</td><td>${employee.id}</td></tr>
        <tr><td>Name</td><td>${employee.name}</td></tr>
        <tr><td>Department</td><td>${employee.department}</td></tr>
        <tr><td>Salary</td><td>${employee.salary}</td></tr>
    </table>
</body>
</html>