<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>Personal Blog | Profile</title>
                    <link href="<c:url value=" /assets/css/theme.css" />" rel="stylesheet" type="text/css">
                    <link href="<c:url value=" /assets/css/bootstrap.min.css" />" rel="stylesheet">
                    <link rel="stylesheet" href="<c:url value=" /assets/css/blocks.css" />">
                    <!-- Custom styles for this template -->
                    <link href="<c:url value=" /assets/css/styles.css" />" rel="stylesheet">
                </head>

                <body style="background-color: #d3f1e1;">
                    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
						    <div class="container">
						        <a class="navbar-brand">Phongdt<c:if test="${not empty username}"> | Welcome ${username}</c:if></a>
						        <div class="collapse navbar-collapse" id="navbarSupportedContent">
						            <ul class="navbar-nav ms-auto">
						                <sec:authorize access="hasRole('ROLE_ADMIN')">
						                    <c:url var="logoutUrl" value="j_spring_security_logout" />
						                    <a href="<spring:url value='admin' />" role="button" class="btn btn-primary">Admin Panel</a>
						                </sec:authorize>
						                <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')">
						                    <a href="<spring:url value='blogpost' />" role="button" class="btn btn-primary">Create Post</a>
						                    <a href="<spring:url value='${blogname}' />" role="button" class="btn btn-primary">My Profile</a>
						                    <form class="navbar-form navbar-right" method="post">
						                        <button type="submit" role="button" class="btn btn-primary" >Log Out</button>
						                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						                    </form>
						                </sec:authorize>
						                <sec:authorize access="hasRole('ROLE_ANONYMOUS')">
						                    <form class="navbar-form navbar-right">
						                        <a href="<spring:url value='login' />" role="button" class="btn btn-primary">Sign In</a>
						                        <a href="<spring:url value='createUser' />" role="button" class="btn btn-primary">Create Account</a>
						                    </form>
						                </sec:authorize>
						            </ul>
						        </div>
						    </div>
						</nav>
                    <br>
                    <br>
                    <br>
                    <div class="container">
                        <c:forEach items="${blogs}" var="blog">
                            <div class="list-group-item" style="background-color: #d3f1e8;">
                                <h4 class="list-group-item-heading">${blog.title}</h4>
                                <p class="list-group-item-text">${blog.content}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <footer class="py-5 bg-dark" id="myFooter">
                        <div class="container">
                            <p class="m-0 text-center text-white">Copyright &copy;
                                PhongdtBlog 2023</p>
                        </div>
                    </footer>
                    <!-- Bootstrap core JavaScript -->
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
			</body>
			</html>