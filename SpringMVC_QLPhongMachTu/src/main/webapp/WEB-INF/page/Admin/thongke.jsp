<%-- 
    Document   : thongke
    Created on : Aug 30, 2023, 3:49:40 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main class="table">

    <h1>Thống Kê Bệnh Nhân</h1>

    <h2>Thống Kê Theo Tháng: </h2>
    <form action="${pageContext.request.contextPath}/admin/thongke" method="post">
        <label for="year">Chọn năm:</label>
        <select id="year" name="year">
            <c:forEach var="year" begin="2020" end="2030">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <br>
        <label for="month">Chọn tháng:</label>
        <select id="month" name="month">
            <c:forEach var="month" begin="1" end="12">
                <option value="${month}">${month}</option>
            </c:forEach>
        </select>
        <br>
        <button type="submit" class="btn btn-danger">Thực hiện thống kê</button>
    </form>
    <canvas id="monthlyRevenueChart"></canvas>






    <h2>Thống Kê Theo Quý: </h2>
    <form action="${pageContext.request.contextPath}/admin/thongke" method="post">
        <label for="year">Chọn năm:</label>
        <select id="year" name="year">
            <c:forEach var="year" begin="2020" end="2030">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>
        <br>
        <label for="month">Chọn Quý:</label>
        <select id="month" name="month">
            <c:forEach var="month" begin="1" end="4">
                <option value="${month}">${month}</option>
            </c:forEach>
        </select>
        <br>
        <button type="submit" class="btn btn-danger">Thực hiện thống kê</button>
    </form>
    <canvas id="monthlyRevenueChart"></canvas>
    <!--    <h2>test theo thang</h2>-->
    <!--<div>-->
    <%--<c:forEach items="${list}" var="t">--%>
    <!--<h3>${t}</h3>-->
    <%--</c:forEach>--%>
    <!--</div>-->

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

//        var khachHangCount = ${countKhachHang};
        var benhNhanCount = ${countBenhNhan};
        var TrangThaiKhamCount = ${countTrangThaiKham};
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Loại', 'Số lượng'],
//                ['Khách hàng', khachHangCount],
                ['Bệnh Nhân Chưa Khám', benhNhanCount],
                ['Bệnh Nhân Đã Khám', TrangThaiKhamCount]

            ]);

            var options = {
                chart: {
                    title: 'Thống kê số lượng',
                    subtitle: 'số lượng bệnh nhân của bệnh viện'
                },
                bars: 'vertical'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));


            chart.draw(data, options);
        }
    </script>

    <div id="chart_div" style="width: 100%; height: 300px;"></div>
