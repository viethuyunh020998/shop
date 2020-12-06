<%@page import="java.util.Map"%>
<%@page import="com.learn.mavenproject2.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mavenproject2.entities.Category"%>
<%@page import="com.learn.mavenproject2.dao.CategoryDao"%>
<%@page import="com.learn.mavenproject2.helper.FactoryProvider"%>
<%@page import="com.learn.mavenproject2.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<% CategoryDao cdao = new CategoryDao((FactoryProvider.getFactory()));
    List<Category> list = cdao.getCategories();

    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="components/common_css_js.jsp" %>
    <body>
        <%@include file="components/nav.jsp" %>

        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">

                <!--cot thu 1--> 
                <div class="col-md-4">
                    <div class="card ">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/group.png" alt="all_user_icon">
                            </div>
                            <h1><%= m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>
                </div>
                <!--cot thu 2-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/list.png" alt="category_icon">
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Category</h1>
                        </div>
                    </div>
                </div>
                <!--cot thu 3--> 
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/package.png" alt="product_icon">
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Product</h1>
                        </div>
                    </div>
                </div>

            </div>
            <!--second row-->
            <div class="row mt-3">
                <!--second :row first col-->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/key.png" alt="product_icon">
                                <p class="mt-2">Click here to add new Category</p>
                                <h1 class="text-uppercase text-muted">Add Category</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <!--second :row second col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="product_icon">
                                <p class="mt-2">Click here to add new Product</p>
                                <h1 class="text-uppercase text-muted">Add Product</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" >
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category tittle" required />
                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" name="catDesc" placeholder="Enter category description" required ></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>

        <!--end add category modal-->


        <!--add product modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product Name" required />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="pDesc" placeholder="Enter product Description" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter product Price" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product Discount" required />
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product Quantity" required />
                            </div>
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <% for (Category c : list) {%>
                                    <option value="<%= c.getCategoryID()%>"><%= c.getCategoryTitle()%></option>
                                    <% }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>
                                <br>
                                <input type="file" name="pPic" required/>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--end add product modal-->
    </body>
</html>
