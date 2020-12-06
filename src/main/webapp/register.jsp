<%-- 
    Document   : register
    Created on : Dec 4, 2020, 2:28:00 PM
    Author     : viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/nav.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file="components/message.jsp" %>                                                
                        <div class="card-body px-5">
                            <div class="container text-center">
                                <img src="img/newuser.png" style="max-width: 100px;" class="img-fluid">
                            </div>

                            <h3 class="text-center my-3">Sign Up here</h3>
                            <form action="RegisterServlet" method="post">
                                
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input name="user_phone" type="text" class="form-control" id="phone" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input name="user_address" type="text" class="form-control" id="address" placeholder="Enter Here" aria-describedby="emailHelp">
                                </div>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-danger">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
