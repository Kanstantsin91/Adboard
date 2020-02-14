<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 01.02.2020
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<link href="../styles/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<html>
<head>
    <title>Редактирование объявления:</title>
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
                <h2 class="create-ad-page-title">Редактирование объявления:</h2>
                <div class="message">${message}</div>
                <div style="text-align: center">
                    <div><img src="data:image/jpg; base64, ${ad.imageName}" width="350" height="350" alt="cat.jpg"/>
                    </div>
                    <form action="/toEditAd/editAd/${ad.adId}" method="post" enctype="multipart/form-data">
                        <table width="100%" cellspacing="0" cellpadding="4">
                            <tr>
                                <td align="right" width="100">Title:</td>
                                <td><label>
                                    <input type="text" name="title" value="${ad.adTitle}">
                                </label></td>
                            </tr>
                            <tr>
                                <td align="right">Description:</td>
                                <td><label>
                                    <textarea name="description" rows="5" cols="100">${ad.adDescription}</textarea>
                                </label></td>
                            </tr>
                            <tr>
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
                                <td align="left"><input class="header-button-fullPage" type="submit" value="Update">
                                    <button class="header-button-fullPage"><a href="/ads/${ad.adId}"
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
