<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                    <title>Admin Panel</title>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                    <link href="<c:url value=" assets/css/theme.css "/>" rel="stylesheet" type="text/css">
                    <link rel="stylesheet" href="<c:url value="assets/css/blocks.css"/> ">
                    <!-- Custom styles for this template -->
                    <link href="<c:url value=" assets/css/styles.css "/>" rel="stylesheet">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
                </head>
 
                <body style="background-color: #d3f1e1;">
                   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
						    <div class="container">
						        <a class="navbar-brand">Phongdt<c:if test="${not empty username}"> | Welcome ${username}</c:if></a>
						        <div class="collapse navbar-collapse" id="navbarSupportedContent">
						            <ul class="navbar-nav ms-auto">
						                <sec:authorize access="hasRole('ROLE_ADMIN')">
						                    <c:url var="logoutUrl" value="j_spring_security_logout" />
						                    <a href="<spring:url value='admin'/>" role="button" class="btn btn-primary">Admin Panel</a>
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
						</nav><br> <br> <br>
	                    <nav class="navbar navbar-inverse navbar-fixed-top">
	                        <div class="container" style="text-align: center;">
	                            <div class="navbar-header"><a class="navbar-brand" style="text-align: center; background-color: #63e8dc;">Admin Panel</a> </div>
	                        </div>
	                    </nav>
	                    <div class="container" style="vertical-align: middle; text-align: center; font-size: 25px; background-color: #9dda98;">
	                        <table class="table">
	                            <thead>
	                                <tr>
	                                    <th style="vertical-align: middle; text-align: center; font-size: 25px;">User Name</th>
	                                    <th style="vertical-align: middle; text-align: center; font-size: 25px;">Blog Domain</th>
	                                    <th style="vertical-align: middle; text-align: center; font-size: 25px;">Enabled</th>
	                                    <th style="vertical-align: middle; text-align: center; font-size: 25px;">Action</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach items="${users}" var="user">
	                                    <tr>
	                                        <td style="vertical-align: middle; text-align: center; font-size: 25px;">${user.username }</td>
	                                        <td style="vertical-align: middle; text-align: center; font-size: 25px;">${user.userdomain }</td>
	                                        <td style="vertical-align: middle; text-align: center; font-size: 25px;">${user.enabled }</td>
	                                        <td style="background-color: #e1e879;">
	                                            <c:choose>
	                                                <c:when test="${user.enabled}"><a href="<spring:url value='/suspend/${user.username}'/>" style="vertical-align: middle; text-align: center; font-size: 25px;">Suspend User</a>
	                                                </c:when>
	                                                <c:otherwise><a href="<spring:url value='/enable/${user.username}'/>" style="vertical-align: middle; text-align: center; font-size: 25px;">Enable User</a>
	                                                </c:otherwise>
	                                            </c:choose>
	                                        </td>
	                                    </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                </body>
	                <footer class="py-5 bg-dark" id="myFooter">
	            		<div class="container">
	                		<p class="m-0 text-center text-white">Copyright &copy; PhongdtBlog 2023</p>
	            		</div>
	        		</footer>
	        		<!-- Bootstrap core JavaScript -->
	        		<!-- Placed at the end of the document so the pages load faster -->
	        		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	        		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>		


                </html>