<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html style="background-color: #d7f1f0;">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <title>User Creation</title>
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
                    <link href="<c:url value=" assets/css/theme.css" />" rel="stylesheet" type="text/css">
                    <link rel="stylesheet" href="<c:url value=" assets/css/blocks.css" />">
                    <!-- Custom styles for this template -->
                    <link href="<c:url value=" assets/css/styles.css" />" rel="stylesheet">
            </head>

			<body style="background-color: #d7f1f0;">
					<nav class="navbar navbar-inverse navbar-fixed-top"
						style="color: #f6eded;">
						<div class="container"
							style="color: #f8f3f3; background-color: #120909;">
							<div class="navbar-header">
								<a class="navbar-brand" style="color: #f3eaea;">Phongdt | Create User</a>
							</div>
						</div>
					</nav>
					<div class="container" style="background-color: #e1f6d5; font-size: 20px;">
                    <h2>
                        <label>Create Account</label>
                    </h2>
                    <form:form modelAttribute="user" method="post" >
                        <c:if test="${error == 1}">
                            <div class="alert alert-danger" role="alert">
                                <form:errors path="*" />
                            </div>
                        </c:if>
                        <div class="form-group" style="background-color: #c3eef6;">
                            <label for="username">Enter User Name</label>
                            <form:input path="username" cssClass="form-control" placeholder="User Name"
                                pattern="^[a-zA-Z0-9]+$" required="true" />
                        </div>
                        <div class="form-group" style="background-color: #81c8d6;">
                            <label for="password">Enter Password</label>
                            <form:input path="password" cssClass="form-control" placeholder="Password"
                                pattern="^[a-zA-Z0-9]+$" required="true" />
                        </div>
                        <div class="form-group" style="background-color: #75a1ad;">
                            <label for="userdomain">Enter Domain</label>
                            <form:input path="userdomain" cssClass="form-control" placeholder="Domain"
                                required="true" />
                        </div>
                        <button type="submit" class="btn btn-default" style="background-color: #60e018;">Submit</button>
                    </form:form>
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