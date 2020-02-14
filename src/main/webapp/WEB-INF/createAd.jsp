<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 05.01.2020
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<link href="styles/css/main.css" rel="stylesheet" type="text/css">
<html>
<head>
    <title>New Add</title>
</head>
<header>
    <div class="main-header">
        <img src="../images/adboard.png" width="314" height="125" alt="adBoard.png"/>
        <div class="login">
            <c:if test="${userId == null}">
                <jsp:include page="loginPage.jsp"/>
            </c:if>
            <c:if test="${userId != null}">
                <jsp:include page="userInfo.jsp"/>
            </c:if>
        </div>
    </div>
</header>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="create-ad-page">
                <h2 class="create-ad-page-title">Создание нового объявления:</h2>
                <div class="message">${message}</div>
                <div style="text-align: center">
                    <form action="createNewAd" method="post" enctype="multipart/form-data">
                        <table width="100%" cellspacing="0" cellpadding="4">
                            <tr>
                                <td align="right" width="100">Title:</td>
                                <td><label>
                                    <input type="text" name="title">
                                </label></td>
                            </tr>
                            <tr>
                                <td align="right">Description:</td>
                                <td><label>
                                    <textarea name="description" rows="5" cols="100"></textarea>
                                </label></td>
                            </tr>
                            <tr>
                                <td align="right" valign="top">Image</td>
                                <td>
                                    <input id="img-input" hidden type="file" size="25" name="image" required>
                                    <label for="img-input" class="header-button-fullPage">Выберите файл</label>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="left"><input class="header-button-fullPage" type="submit" value="Create">
                                    <button class="header-button-fullPage"><a href="../"
                                                                              style="color: #333333">Cancel</a>
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<footer class="footer"></footer>
</html>
<%session.removeAttribute("message");%>
