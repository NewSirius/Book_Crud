<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>BOOK</title>

    <style>
        table {
            border-collapse: collapse;
        }
        th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
    </style>

</head>

<body>
<a href="<c:url value="/books"/>">BACK</a>

<h1>BOOK DETAILS</h1>
<table style="border: 1px solid black;">
    <tr>
        <th width="80">ID</th>
        <th width="120">Title</th>
        <th width="120">Description</th>
        <th width="120">Author</th>
        <th width="120">ISBN</th>
        <th width="120">Year</th>
        <th width="80">isRead</th>
    </tr>
    <tr>
        <th>${book.id}</th>
        <th>${book.title}</th>
        <th>${book.description}</th>
        <th>${book.author}</th>
        <th>${book.isbn}</th>
        <th>${book.printYear}</th>
        <th>${book.readAlready}</th>
    </tr>
</table>
</body>
</html>