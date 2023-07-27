<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <title>Account Successfully Created</title>
                <!-- Bootstrap core CSS -->
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
            </head>

            <body>
                <div class="container">
                    <div class="alert alert-success" role="alert">
                        <h1>Congratulations, Your Account ${username} Has Been
                            Successfully Created</h1>
                        <a href="<c:url value="index" />" role="button" class="btn btn-primary">Return to Home Page</a>
                    </div>
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