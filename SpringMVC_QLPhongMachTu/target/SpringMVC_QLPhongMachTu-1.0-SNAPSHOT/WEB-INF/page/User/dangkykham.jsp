<%-- 
    Document   : dangkykham
    Created on : Jul 26, 2023, 11:01:33 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/benhnhan/dangkykham" var="actions"/>

<form:form method="post" modelAttribute="taikhoan" action="${actions}">
    <nav class="dkk_main">
        <!--<div class="textdkk"><h1>ĐĂNG KÝ KHÁM</h1></div>-->

        <div class="dkk">
            <div class="dkk1">
                <div class="contentdkk1">
                    <h5>Lưu ý:</h5>
                    <h5>Lịch hẹn có hiệu lực sau khi có xác nhận chính thức từ Phòng khám Bệnh viện Health couch</h5>
                    <h5>Quý khánh hàng vui lòng cung cấp thông tin chính xác để được phục vụ tốt nhất. Trong trường hợp cung cấp sai thông tin email & điện thoại, việc xác nhận cuộc hẹn sẽ không hiệu lực.</h5>
                    <h5>Quý khách sử dụng dịch vụ đặt hẹn trực tuyến, xin vui lòng đặt trước ít nhất là 24 giờ trước khi đến khám.</h5>
                    <h5>Trong trường hợp khẩn cấp hoặc nghi ngờ có các triệu chứng nguy hiểm, quý khách vui lòng ĐẾN TRỰC TIẾP Phòng khám hoặc các trung tâm y tế gần nhất để kịp thời xử lý.</h5>
                </div>
            </div>
            <div class="contentdkk2_main">
                <div class="contentdkk2">
                    <h1>ĐĂNG KÝ KHÁM</h1>
                    <h5>Vui lòng điền thông tin vào form bên dưới để đăng ký khám bệnh theo yêu cầu!</h5>
                </div>

                <div class="contentdkk3">
                    <form:input type="text" path="hoTen" id="hoTen" placeholder="Họ tên"/>
                    <form:input type="text" path="email" id="email" placeholder="Email"/>
                </div>

<!--                <div class="contentdkk4">
                    <%--<form:select class="form_sex" name="lang" id="lang-select" path="gioiTinh">--%>
                        <option value="">Giới tính</option>
                        <option value="sex">Nam</option>
                        <option value="sex">Nữ</option>
                    <%--</form:select>--%>
                </div>

                <div class="contentdkk6">
                    <%--<form:input type="date" path="ngaySinh" name="ngaysinh" id="ngaysinh" value="yyyy-mm-dd"/>--%>
                </div>-->

                <div class="contentdkk5">
                    <form:input type="text" path="diaChi" placeholder="Địa chỉ"/>
                </div>

                <div class="submitdkk">
                    <a href="#"><button type="submit">ĐĂNG KÝ KHÁM</button></a>
                </div>
            </div>


        </div>
    </nav>
</form:form>