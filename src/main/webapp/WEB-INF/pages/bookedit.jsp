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

<br>

<h1>Change Book State</h1>

<c:url var="makeReadBookAction" value="/makeReadBook/${book.id}"/>

<form:form action="${makeReadBookAction}" commandName="book">
<table>
    <tr>
        <c:choose>
            <c:when test="${book.readAlready}">
                <input type="submit" value="Already read!" disabled="disabled" >
            </c:when>
            <c:otherwise>
                <input type="submit" value="I read it!" >
            </c:otherwise>
        </c:choose>

    </tr>
</table>
</form:form>


<h1>EDIT</h1>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table>
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        <tr>
            <td>
                <form:label path="title">
                    <spring:message text="Title"/>
                </form:label>
            </td>
            <td>
                <form:input path="title"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">
                    <spring:message text="Description"/>
                </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="author">
                    <spring:message text="Author"/>
                </form:label>
            </td>
            <td>
                    <form:input path="author" readonly="true" disabled="true"/>
                    <form:hidden path="author"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isbn">
                    <spring:message text="ISBN"/>
                </form:label>
            </td>
            <td>
                <form:input path="isbn"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="printYear">
                    <spring:message text="Year"/>
                </form:label>
            </td>
            <td>
                <form:input path="printYear"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty book.title}">
                    <input type="submit"
                           value="<spring:message text="Edit Book"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>