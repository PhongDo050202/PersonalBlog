<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
				
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    <meta name="description" content="Pinegrow Web Editor - Professional Services Bootstrap v5 Template">
                    <meta name="author" content="">
                    <title>Personal Blog</title>
                    <!-- Bootstrap core CSS -->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                    <link href="<c:url value='assets/css/theme.css' />" rel="stylesheet" type="text/css">
                    <link rel="stylesheet" href="<c:url value='assets/css/blocks.css' />" >
                    <!-- Custom styles for this template -->
                    <link href="<c:url value='assets/css/styles.css' />" rel="stylesheet">
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
                    <!-- Main jumbotron for a primary marketing message or call to action -->
                    <div class="jumbotron">
                        <div class="container">
                            <h1>Hello, world!</h1>
                            <p>Welcome to the Personal Blog, Find out what our current Users are Blogging About, or sign up for an account </p>
                        </div>
                    </div>
                    <div class="container">
                        <c:choose>
                            <c:when test="${not empty error}">
                                <div class="alert alert-danger" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> <span class="sr-only">Error:</span> No More Pages to be Displayed
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row bg-info">
                                    <c:forEach items="${temp1}" var="item">
                                        <div class="col-md-4" style="background-color: #fbf5f5; border-left-color: #0b0909; outline: 3px solid #cccccc;">
                                            <h2>${item.title}</h2>
                                            <p>${fn:substring(item.content, 0, 100)}...</p>
                                            <p> <a class="btn btn-default" href="<spring:url value='/${item.blogname}/${item.id}/${item.title}'/>" role="button">View Post &raquo;</a> </p>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row bg-info">
                                    <c:forEach items="${temp2}" var="item">
                                        <div class="col-md-4" style="background-color: #fcfcfc; border-bottom-color: #0e0d0d; outline: 3px solid #cccccc;">
                                            <h2>${item.title}</h2>
                                            <p>${fn:substring(item.content, 0, 100)}...</p>
                                            <p> <a class="btn btn-default" href="<spring:url value='/${item.blogname}/${item.id}/${item.title}'/>" role="button">View Post &raquo;</a> </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <c:if test="${previousPage != false}">
                        <a href="<spring:url value='/?pageNumber=${pageNumberPrevious}'/>" role="button" class="btn btn-primary">Previous</a>
                    </c:if>
                    <c:if test="${nomorepages != true}">
                        <a href="<spring:url value='/?pageNumber=${pageNumberNext}'/>" role="button" class="btn btn-primary">Next</a>
                    </c:if>
                    <hr>
                    
                </body>
				<footer class="py-5 bg-dark">
                    <div class="container">
                         <p class="m-0 text-center text-white">Copyright &copy; PhongdtBlog 2023</p>
                    </div>
                </footer>
                <script src="<c:url value='assets/js/popper.min.js' />"></script>
                <script src="<c:url value='assets/js/bootstrap.min.js' />"></script>
                </html>