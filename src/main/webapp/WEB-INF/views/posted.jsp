<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Blog Post Success</title>
        </head>

        <body style="background-color: #cae7db;">
            <h1>You have successfully Posted Your Blog ${blog.username}</h1>
            <h1>${blog.title}</h1>
            <p>${blog.content}</p> 
            <a href="<spring:url value="index" />" role="button" class="btn btn-primary">Return to Home Page </a> 
            <a href="<spring:url value="${blog.blogname}"/>"role="button" class="btn btn-primary">Go to Profile Page</a> 
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