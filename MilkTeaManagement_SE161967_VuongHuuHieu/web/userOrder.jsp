<%-- 
    Document   : userPage
    Created on : Jun 18, 2022, 10:52:18 PM
    Author     : ownhi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.products.ProductDTO"%>
<%@page import="sample.products.Cart"%>
<%@page import="sample.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styleuser.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <!--Header-->
        <div class="row" id="header">

            <div class="col-md-6 " id="headerleft">                  
                <div id="divphone"><span class="fa fa-phone-square"></span> 0923 81 73 67 </div>
                <div><span class="fa fa-envelope"></span> hieuvhse161967@fpt.edu.vn</div>
            </div>
            <div class="col-md-6 " id="headerright">
                <a href="https://www.facebook.com/hieu.vuong.7967/"><span class="fab fa-facebook-square"></span></a>
                <a id="insta" href="https://www.instagram.com/henxaoxaott/"><span class="fab fa-instagram-square"></span></a>
            </div>
        </div>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                </div>
                <a class="navbar-brand" href="home.jsp">HOME</a>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a  href="home.jsp">ABOUT US</a></li>
                        <li><a  href="MainController?action=SEE+ALL">MENU</a ></li>
                        <li><a  href="home.jsp">CONTACT</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a  href="userPage.jsp">MY DETAIL</a></li>
                        <li><form action="MainController">
                                <input id="logout" type="submit" name="action" value="Logout"/>
                            </form></li>

                    </ul>
                </div>
            </div>
        </nav> <!--ket thuc navbar -->
        <div class="row">
            <div class="col-md-12">
                <!--Bắt đầu slider-->
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="item active" id="adminslider">
                            <h2>
                                <span>  ORDER </span>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Ket thuc header -->
        <!-- container -->
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null && cart.getCart().size() > 0) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Image</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Category ID</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th>Edit</th>
                </tr>
            </thead>

            <%                int count = 1;
                float total = 0;
                for (ProductDTO product : cart.getCart().values()) {
                    total += product.getPrice() * product.getQuantity();
            %>

            <form action="MainController"> 
                <tr>
                    <td><%= count++%></td>
                    <td><img src="<%= product.getImg()%>" /></td>                   
                    <td>
                        <input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/>                       
                    </td>
                    <td><%= product.getName()%></td>
                    <td><%= product.getPrice()%></td>

                    <td>
                        <input id="inputofquanity" type="number" min="1" name="quantity" value="<%= product.getQuantity()%>" required=""/>
                    </td>
                    <td><%= product.getCategoryID()%></td>
                    <td><%= product.getPrice() * product.getQuantity()%>₫</td>

                    <!-- remove here-->
                    <td>                      
                        <input type="submit" name="action" value="Remove"/>
                    </td>
                    <!-- Edit here-->
                    <td>                      
                        <input type="submit" name="action" value="Edit"/>
                    </td>

                </tr>

            </form>

            <%
                }
            %>

        </table>
        <div class="total">
            <h1>Total: <%= total%>₫</h1>
        <form action="MainController">
            <input type="hidden" name="total" value="<%= total%>"/>
            <input id="confirm" type="submit" name="action" value="Confirm"/>
        </form>
        </div>

    </div>   
    <%
        ArrayList<String> message = (ArrayList<String>) request.getAttribute("MESSAGE_ORDER");
        String notice= (String) request.getAttribute("MESSAGE_PURCHASE"); 
        if (message != null && message.size()>0) {
            for(String mess: message){
    %>
    <div class="message">
        <h1><%= mess %></h1>
    </div>
    <%
        }
        }
    %>
    
    <%
        if(notice==null){
            notice="";
        }else{
    %>
    <div class="message">
        <h1><%= notice %></h1>
    </div>    
    <%
        }
    %>

    <div class="addmoreOrder">
        <h4>Do you want to <a href="MainController?action=SEE+ALL">add more!!!</a> </h4>
    </div>
    <%
    } else {
    %>
    <div class="emptyOrder">
        <p>Your order is empty, please <a href="MainController?action=SEE+ALL">add more!!!</a> <p>
    </div>
    <%
        }
    %>
</body>
<!-- footer -->
<div id="CONTACT" class="footer">
    <div class="row">
        <div>
            <p>Email : hieuvhse161967@fpt.edu.vn</p>
            <p>Address: Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</p>
            <h5>&copy; Copyright 2022. OiShiMilkTea.VN</h5>
        </div>
    </div>

</div>
</body>

</html>
