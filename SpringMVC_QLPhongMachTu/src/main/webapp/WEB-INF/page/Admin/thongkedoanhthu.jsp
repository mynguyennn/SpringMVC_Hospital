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

    <div class="textThongKe">
        <h1>Thống Kê Doanh Thu</h1>
    </div>

    <nav class="container_TK">
        <div class="TK_Thang">
            <h2>Thống Kê Doanh Thu Theo Tháng: </h2>
            <form action="${pageContext.request.contextPath}/admin/thongkedoanhthu" method="post">
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
                        <option value="${month}">Tháng ${month}</option>
                    </c:forEach>
                </select>
                <br>
                <button type="submit" >Thống kê</button>
            </form>
            <canvas id="monthlyRevenueChart"></canvas>
            <div id="chart_div" style="width: 220%; height: 350px;"></div>
        </div>






        <div class="TK_Quy">
            <h2>Thống Kê Doanh Thu Theo Quý: </h2>
            <form action="${pageContext.request.contextPath}/admin/thongkedoanhthu" method="post">
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
                        <option value="${month}">Tháng ${month}</option>
                    </c:forEach>
                </select>
                <br>
                <button type="submit" >Thống kê</button>
            </form>
            <canvas id="monthlyRevenueChart"></canvas>
            <div id="chart_div" style="width: 220%; height: 350px;"></div>

        </div>


    </nav>









    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        var tongTien = ${totalRevenue};
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Loại', 'Doanh thu'],

                ['Doanh thu', tongTien]

            ]);

            var options = {
                chart: {
                    title: 'Thống kê doanh thu',
                    subtitle: 'Số lượng doanh thu của bệnh viên'
                },
                bars: 'vertical'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));


            chart.draw(data, options);
        }




    </script>




    <!--doanh thu-->
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

//        var khachHangCount = ${countKhachHang};
        var total = ${totalRevenue};

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Loại', 'Số lượng'],

                ['Doanh thu', total]

            ]);

            var options = {
                chart: {
                    title: 'Thống kê doanh thu',
                    subtitle: 'Doanh thu của bệnh viện'
                },
                bars: 'vertical'
            };

            var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));


            chart.draw(data, options);
        }


    </script>

