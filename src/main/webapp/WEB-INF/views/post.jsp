<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                    <!DOCTYPE html>
					<html lang="en">
					
					<head>
					    <meta charset="UTF-8">
					    <meta name="viewport" content="width=device-width, initial-scale=1.0">
					    <title>Blog Post | ${blogID.title}</title>
					    <!-- Bootstrap core CSS -->
	                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	                    <link href="<c:url value='assets/css/theme.css' />" rel="stylesheet" type="text/css">
	                    <link rel="stylesheet" href="<c:url value='assets/css/blocks.css' />" >
	                    <!-- Custom styles for this template -->
	                    <link href="<c:url value='assets/css/styles.css' />" rel="stylesheet">
					    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					    <script>
					        $(document).ready(function() {
					            $("#hide").hide();
					            $(".editBlog").hide();
					            $("#edit").click(function() {
					                $(".editBlog").show();
					                $("#edit").hide();
					                $("#hide").show();
					            });
					
					            $("#hide").click(function() {
					                $(".editBlog").hide();
					                $("#edit").show();
					                $("#hide").hide();
					            });
					        });
					    </script>
					    <script>
						    	$(document).ready(function() {
						        $("#newCommentForm").hide(); 
						
						        $("#commentBtn").click(function() {
						            $("#newCommentForm").toggle(); 
						        });
						    });
						</script>
					    
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
						</nav><br><br><br>
					    <nav class="navbar navbar-dark bg-primary">
					        <div class="container"><a class="navbar-brand">Blog Post | ${blogID.title}</a>
					        </div>
					    </nav>
					    <div class="container">
					        <div class="well" style="background-color: #ffffff;">
					            <c:if test="${not empty blogID}">
					                <h1>${blogID.title}</h1>
					                <p>${blogID.content}</p>
					                <p>Written by: ${blogID.username}</p>
					                <c:if test="${blogID.username == username}">
									    <c:if test="${edit}">
									        <form:form modelAttribute="editedBlog" method="POST">
									            <div class="form-group">
									                <label for="title">Update Title</label>
									                <form:input path="title" class="form-control" placeholder="title" />
									            </div>
									            <div class="form-group">
									                <label for="content">Update Content</label>
									                <form:textarea path="content" class="form-control" placeholder="Content" />
									            </div>
									            <button type="submit" class="btn btn-default">Submit</button>
									        </form:form>
									        <button id="edit" class="btn btn-default">Edit</button>
									        <button id="hide" class="btn btn-default">Hide</button>
									    </c:if>
									</c:if>
					            </c:if>
					        </div>
					        <c:forEach var="comments" items="${comments}">
					            <div class="row">
					                <div class="col-lg-5 col-md-3" style="background-color: #fbf5f5;">
					                    <h3>${comments.username} says:</h3>
					                    <p>${comments.date}</p>
					                </div>
					                <div class="col-md-6 well" style="background-color: #fcfefd;">
					                    <p>${comments.cmt}</p>
					                </div>
					                <div class="col-md-3"></div>
					            </div>
					        </c:forEach>
							<c:if test="${not empty blogID}">
							    <button id="commentBtn" class="btn btn-default">Comment</button>
							    <form:form modelAttribute="newcomment" method="POST">
							        <div class="form-group" style="background-color: #f2efe2;">
							            <label for="cmt">Enter Comment</label>
							            <form:input path="cmt" class="form-control" placeholder="Enter Comment Here" />
							            <button type="submit" class="btn btn-success">Submit</button>
							        </div>
							    </form:form>
							</c:if>
					    </div>
					</body>
					<footer class="py-5 bg-dark" id="myFooter" style="background-color: #050202;">
					    <div class="container">
					        <p class="m-0 text-center text-white">Copyright &copy; PhongdtBlog 2023</p>
					    </div>
					</footer>
					<!-- Bootstrap core JavaScript -->
                    <!-- Placed at the end of the document so the pages load faster -->
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
					
					</html>