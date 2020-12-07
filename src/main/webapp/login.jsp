<%-- 
    Document   : login.jsp
    Created on : Dec 5, 2020, 2:10:25 PM
    Author     : viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/nav.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3 class="text-center my-2">Login Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp" class="text-center d-block">You are not have account</a>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary custom-bg">Login in</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
