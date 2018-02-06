<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>
</head>

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

<body>

<br/>

<c:url var="addAction" value="/books/search"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <tr>
            <input type="text" name="title" id="title"
                   placeholder="Input title"/>

            <input type="submit"
                   value="<spring:message text="SEARCH"/>"/>
        </tr>
    </table>
</form:form>

<h1>BOOK LIST</h1>

<c:if test="${!empty listBooks}">
    <table style="border: 1px solid black;">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="120">Description</th>
            <th width="120">Author</th>
            <th width="120">ISBN</th>
            <th width="120">Year</th>
            <th width="80">isRead</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <th>${book.id}</th>
                <th><a href="/bookdata/${book.id}">${book.title}</a></th>
                <th>${book.description}</th>
                <th>${book.author}</th>
                <th>${book.isbn}</th>
                <th>${book.printYear}</th>
                <th>${book.readAlready}</th>
                <th><a href="<c:url value='/edit/${book.id}'/>">EDIT</a></th>
                <th><a href="<c:url value='/remove/${book.id}'/>">DELETE</a></th>
            </tr>
        </c:forEach>
    </table>
</c:if>

<div id="pagination">
    <c:url value="/books" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/books" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/books" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>


<h1>ADD</h1>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table>
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
                <form:input path="author"/>
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
                    <input type="submit"
                           value="<spring:message text="Add Book"/>"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
