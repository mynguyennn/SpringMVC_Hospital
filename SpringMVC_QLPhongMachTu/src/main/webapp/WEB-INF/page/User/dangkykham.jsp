<%--    Document   : dangkykham
    Created on : Jul 26, 2023, 11:01:33 PM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/benhnhan/dangkykham" var="actions"/>
<c:url value="/benhnhan/dangkykham_pdk" var="actionss"/>

<c:if test="${err != null}">
    <div class="alert1">
        ${err}
    </div>
</c:if>




<nav class="dkk_main">

    <form:form method="post" modelAttribute="user" action="${actions}" enctype="multipart/form-data">

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
                    <h5>Vui lòng kiểm tra và cập nhật thông tin chính xác trước khi gửi phiếu đăng ký khám!</h5>
                </div>


                <form:hidden path="idTk"/>
                <form:hidden path="taiKhoan"/>
                <form:hidden path="avt"/>


                <div class="contentdkk3">
                    <form:input class="custom-input" type="text" id="custom-input1" path="hoTen" placeholder="Họ và tên"/>
                    <form:input class="custom-input" type="text" id="custom-input1" path="email" placeholder="Email cá nhân" />
                </div>

                <div class="contentdkk4">
                    <%--<form:select class="custom-input" path="gioiTinh" id="custom-input1" cssErrorClass="is-invalid">--%>
                    <%--<form:option value="${user.gioiTinh}" label="${user.gioiTinh}" />--%>
                    <%--</form:select>--%>

                    <form:select path="gioiTinh" id="gioiTinh" class="form-select" cssErrorClass="is-invalid">
                        <form:option value="" label="Giới tính" />
                        <form:option value="Nam" label="Nam" />
                        <form:option value="Nữ" label="Nữ" />
                        <form:option value="Khác" label="Khác" />
                    </form:select>


                    <div class="contentdkk5">
                        <form:input class="custom-input" type="date" id="custom-input1" path="ngaySinh" placeholder="" />
                    </div>

                    <div class="contentdkk5">
                        <form:input class="custom-input" type="text" id="custom-input1" path="sdt" placeholder="Số điện thoại" />
                    </div>

                    <div class="contentdkk5">
                        <form:input class="custom-input" type="text" id="custom-input1" path="diaChi" placeholder="Địa chỉ" />
                    </div>

                    <!--hide-->
                    <form:input type="text" path="matKhau" id="matKhauu" placeholder=""/>
                    <form:input type="file" id="file1" path="file" placeholder="Upload Avatar"/>

                    <div class="submitdkk submitdkk111">
                        <a><button type="submit">CẬP NHẬT THÔNG TIN</button></a>
                    </div>
                    <p id="luuy">*Lưu ý: bệnh nhân chỉ được gửi phiếu đăng ký khám mới sau 24h kể từ khi gửi phiếu đăng ký hiện tại!</p>

                </div>
            </form:form>
            <form:form method="post" modelAttribute="themphieudky" action="${actionss}" enctype="multipart/form-data">
                <div class="submitdkk">
                    <a><button type="submit" >ĐĂNG KÝ KHÁM</button></a>
                </div>
                <form:input type="text" id="hoTen111" path="tenBenhNhanDky" value="${pageContext.request.userPrincipal.name}" />
            </form:form>
        </div>






</nav>

