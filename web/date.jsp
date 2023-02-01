<%-- 
    Document   : date
    Created on : Nov 2, 2022, 11:26:06 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <div class="container px-3 my-5 clearfix">
                    <!-- Shopping cart table -->
                    <div class="card">
                        <div class="card-header">
                            <h2>Order Detail in ${requestScope.currentdate}</h2>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered m-0">
                                    <thead>
                                        <tr>
                                            <!-- Set columns width -->

                                            <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name </th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                            <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                                            <th class="text-right py-3 px-4" style="width: 100px;">Total</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="sum" value="0"/>
                                        <c:forEach var="o" items="${requestScope.ord}" >
                                            <tr>
                                                <td class="p-4">
                                                    <div class="media align-items-center">

                                                        <div class="media-body">
                                                            ${o.pname}
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle p-4"> ${o.price} </td>
                                                <td class="align-middle p-4">

                                                    <input class="form-control text-center" type="text" readonly="" value="${o.quantity}" />

                                                </td>
                                                <td  class="text-right font-weight-semibold align-middle p-4" >${o.price * o.quantity}đ  </td>
                                                
                                                <c:set var="sum" value="${o.price * o.quantity +sum}"/>

                                            </tr>
                                        </c:forEach>



                                    </tbody>
                                </table>
                            </div>
                            <!-- / Shopping cart table -->

                            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                                
                                <div class="d-flex">

                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total revenue</label>
                                        <div class="text-large"><strong>${sum}đ</strong></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
    </body>
</html>
