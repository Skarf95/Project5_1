<%--
  Created by IntelliJ IDEA.
  User: euninjun
  Date: 2022/12/05
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.uploadfile.FileUpload"%>
<%@ page import="com.example.dao.BoardDAO" %>
<%@ page import="com.example.bean.BoardVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
    <link rel=" :stylesheet" href="member.css">
</head>

<body>

    <%
    BoardDAO boardDAO = new BoardDAO();
    String id = request.getParameter("id");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("vo",u);

%>

<h1>Edit Form</h1>
<form id="boardVO" action="editpost.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="seq" value="${vo.getSeq()}"/>

    <table id = "edit">
        <tr><td>Category:</td><td><input type ="text" name = "category" value="${vo.getCategory()}"/></td></tr>
        <tr><td>Title:</td><td><input type="text" id="title" name="title"  value="${vo.getTitle()}"/></td></tr>
        <tr><td>Writer:</td><td><input type="text" id="writer" name="writer"  value="${vo.getWriter()}"/></td></tr>
        <tr><td>Content:</td>
            <td><textarea cols="50" rows="5" name="content"><${vo.getContent()}></textarea></td>
                    </tr>
        <tr>
            <td>Photo</td><td><input type= "file" name ="photo" value="${vo.getFileName()}" />
            <c:if test="${vo.getFileName() ne''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getFileName()}" class ="photo"></c:if> </td>
        </tr>
     </table>
    <button type="button" value="Cancel" onclick="history.back()"/>Cancel</button>

    <button type="submit">Edit Post</button>


</form>
</body>

</html>