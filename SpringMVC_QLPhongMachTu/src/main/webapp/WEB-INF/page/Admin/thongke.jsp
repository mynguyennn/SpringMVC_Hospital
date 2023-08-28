<%-- 
    Document   : thongke
    Created on : Aug 29, 2023, 12:16:44 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/admin/thongke" />
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<main class="table">

    <h1>Thống Kê Bệnh Nhân</h1>

    <h2>Thống kê theo tháng</h2>
    <div>
        <label for="month">Chọn tháng:</label>
        <select id="month">
            <option value="1">Tháng 1</option>
            <option value="2">Tháng 2</option>
            <option value="3">Tháng 3</option>
            <!-- Thêm các option cho các tháng còn lại -->
        </select>
        <button onclick="showMonthlyRevenue()">Xem</button>
    </div>
    <canvas id="monthlyRevenueChart"></canvas>

    <h2>test theo thang</h2>
    <div>
        <c:forEach items="${list}" var="t">
            <h3>${t}</h3>
        </c:forEach>
    </div>
    
    
   
    
    <!--<script>-->
        
    <!--</script>-->