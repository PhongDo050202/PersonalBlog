<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Blog | Login</title>
<link href="<c:url value=" /assets/css/theme.css" />" rel="stylesheet" type="text/css">
<link href="<c:url value=" /assets/css/bootstrap.min.css" />" rel="stylesheet">
<link rel="stylesheet" href="<c:url value=" /assets/css/blocks.css" />" >
<!-- Custom styles for this template -->
<link href="<c:url value=" /assets/css/styles.css" />" rel="stylesheet">
</head>
<body onload='document.f.j_username.focus();'>
	<br>
	<br>
	<br>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container" style="background-color: #020101;">
			<div class="navbar-header">
				<a class="navbar-brand" style="color: #f5eded;">Personal Blog | Login</a>
			</div>
		</div>
	</nav>
	<div class="container" style="background-color: #6c8bf5;">
		<h1>Please Log In</h1>
		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">
				<span class="glyphicon glyphicon-exclamation-sign"
					aria-hidden="true"></span> <span class="sr-only">Error:</span> Your login was unsuccessful <br> Caused:${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }
			</div>
		</c:if>
		<form action="<c:url value='/j_spring_security_check'/>" name="f" method="post" style="font-size: 20px;">
			<div class="form-group"
				style="background-color: #62c576; font-size: 25px;">
				<label for="username">Enter User Name</label> <input type="text"
					class="form-control" name="j_username" id="username"
					placeholder="User Name">
			</div>
			<div class="form-group" style="background-color: #58b976;">
				<label for="password">Password</label> <input type="password"
					class="form-control" name="j_password" id="password"
					placeholder="Password" style="background-color: #f8f7f8;">
			</div>
			<button type="submit" class="btn btn-default" style="background-color: #49e87b; font-size: 25px;">Log In</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
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




