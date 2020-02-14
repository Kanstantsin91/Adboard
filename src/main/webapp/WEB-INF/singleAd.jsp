<%--
  Created by IntelliJ IDEA.
  User: kanst
  Date: 28.01.2020
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="../styles/css/main.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>${ad.adTitle}</title>
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
            <div class="ad-page">
                <h1 class="ad-page-ad-title">${ad.adTitle}</h1>
                <br>
                <div class="messageSuccess">${messageSuccess}</div>
                <div class="message">${message}</div>
                <div><img class="ad-page-ad-img" src="data:image/jpg; base64, ${ad.imageName}" width="800" height="800" alt="cat.jpg"></div>
                <br>
                <p class="ad-page-ad-description">${ad.adDescription}</p>
                <c:if test="${userId == ad.user.userId}">
                    <div class="ad-page-user-data">
                        <div class="ad-page-user-button">
                            <button class="header-button-fullPage"><a href="/toEditAd/${ad.adId}"
                                                                      style="color: #333333">Edit</a>
                            </button>
                            <form action="/delete/${ad.adId}" method="post" style="margin-bottom: 0">
                                <button class="header-button-fullPage" type="submit"
                                        onclick="return window.confirm('Вы действительно хотите удалить объявление?')">
                                    Delete
                                </button>
                            </form>
                            <button class="header-button-fullPage"><a href="../" style="color: #333333">На главную</a>
                            </button>
                        </div>
                    </div>
                </c:if>
                <c:if test="${userId!=null&&userId!=ad.user.userId}">
                    <div>
                        <h3 class="ad-page-user-data">Имя пользователя: ${ad.user.name}</h3>
                        <h3 class="ad-page-user-data">E-mail автора: ${ad.user.mail}</h3>
                    </div>
                    <div>
                        <div class="ad-page-user-data">
                            <div class="ad-page-user-button">
                                <button class="header-button-fullPage"><a href="../" style="color: #333333">На
                                    главную</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${userId==null}">
                    <h5 class="should-be-logged-in">Вы должны <a href="../">войти</a> чтобы видеть контактную информацию
                        пользователя,
                        разместившего объявляние!</h5>
                </c:if>
                <%--                <button><a href="../">На главную</a></button>--%>
            </div>
        </div>
    </div>
</div>
</body>
<footer class="footer">
</footer>
</html>
<%session.removeAttribute("messageSuccess");%>
<%session.removeAttribute("message");%>
