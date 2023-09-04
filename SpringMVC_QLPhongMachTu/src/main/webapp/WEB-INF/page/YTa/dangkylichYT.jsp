<%-- 
    Document   : dangkylich
    Created on : Aug 19, 2023, 12:32:49 PM
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/yta/dangkylichYT" var="actions"/>

<%--<c:if test="${err != null}">--%>
<!--<div class="alert1">-->
<!--{err}-->
<!--</div>-->
<%--</c:if>--%>

<main class="table table324234">

    <div>
        <section class="table__header table__header1515">
            <h3>LỊCH ĐĂNG KÝ</h3>
            <div id="current-time"></div>
        </section>


        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Chức vụ</th>
                        <th>Ca trực</th>
                        <th>Ngày đăng ký</th>
<!--                        <th>Trạng thái</th>-->
                        <!--<th></th>-->
                        <!--<th></th>-->
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${listCTLT}" var="p">
                        <tr>
                            <td>${p.idTk.idTk}</td>
                            <td>${p.idTk.hoTen}</td>
                            <td>${p.idTk.idRole.chucVu}</td>                     
                            <td>${p.idTgTruc.buoiTruc} (${p.idTgTruc.batDau} - ${p.idTgTruc.ketThuc})</td>
                            <td> <fmt:formatDate value="${p.ngayDkyTruc}" pattern="EEEE, dd-MM-yyyy" /></td>
                 
<!--                            <td>
                                <div class="admin_submit admin_submit11 admin_submit1113">
                                    Ðiểm danh
                                </div>
                            </td>-->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

    </div>
</main> 

<script>
    function displayCurrentTime() {
        var currentTime = new Date();

        var daysOfWeek = ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
        var dayOfWeek = daysOfWeek[currentTime.getDay()];

        var day = currentTime.getDate();
        var month = currentTime.getMonth() + 1; // Lưu ý: Tháng bắt đầu từ 0
        var year = currentTime.getFullYear();

        var hours = currentTime.getHours();
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();

        var formattedTime = dayOfWeek + ", " + day + "-" + month + "-" + year + " " + hours + ":" + minutes + ":" + seconds;

        document.getElementById("current-time").textContent = formattedTime;
    }

    // Gọi hàm displayCurrentTime một lần khi trang được tải và sau đó mỗi giây
    displayCurrentTime();
    setInterval(displayCurrentTime, 1000);
</script>