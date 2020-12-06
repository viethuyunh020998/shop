<%@page import="com.learn.mavenproject2.helper.Helper"%>
<%@page import="com.learn.mavenproject2.entities.Category"%>
<%@page import="com.learn.mavenproject2.dao.CategoryDao"%>
<%@page import="com.learn.mavenproject2.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mavenproject2.dao.ProductDao"%>
<%@page import="com.learn.mavenproject2.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bao Khiem Center</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/nav.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%
                    String cat = request.getParameter("category");
//                    out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());

                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cida = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cida);
                    }
                    CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list2 = cdo.getCategories();
                %>

                <!--show categories-->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Category
                        </a>

                        <%
                            for (Category c : list2) {
                        %>
                        <a href="index.jsp?category=<%= c.getCategoryID()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>
                </div>
                <!--show product-->
                <div class="col-md-10">
                    <div class="row mt-6">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : list) {
                                %>
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img  src="img/products/<%=p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" class="card-img-top m-2" alt"...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%> 
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn btn-outline-success"> <%= p.getPriceAfterApplyingDiscount()%> &#273 / <span class="text-secondary discount-label"><%= p.getpPrice()%> <%= p.getpDiscount()%>%off</span></button>  
                                    </div>
                                </div> 
                                <%}
                                    if (list.size() == 0) { %>
                                <h3 class="text-left">No item in this category</h3>
                                <%  }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %><div id="toast"></div>

    </body>
</html>
