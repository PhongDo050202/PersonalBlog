<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <!DOCTYPE html>
        <html style="background-color: #beedd3;">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Logged Out</title>
        </head>

        <body style="background-color: #95c7cd;">
            <h1>You have been Logged Out</h1> <a href="<spring:url value="index"/>">Home</a>
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