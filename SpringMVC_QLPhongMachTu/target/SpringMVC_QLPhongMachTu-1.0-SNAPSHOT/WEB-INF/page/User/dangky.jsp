<%-- 
    Document   : login
    Created on : Jul 24, 2023, 1:34:13 AM
    Author     : Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<c:url value="/dangky" var="action"/>

<c:if test="${errMsg != null}">
    <div class="alert1">
        ${errMsg}
    </div>
</c:if>



<form:form class="form_login11" method="post" action="${action}" modelAttribute="user" 
           enctype="multipart/form-data">
    <%--<form:errors path="*" element="div" cssClass="alert1" />--%>
    <nav class="login1">

        <div class="login_main11">  

            <p>ĐĂNG KÝ KHÁM</p>
            <section class="dky_flex">

                <div class="dky1">

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-user"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="text" id="username" path="taiKhoan" placeholder="Nhập tài khoản"/>
                            </div>
                        </div>
                    </div>

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-key"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
                                <%--<form:errors path="matKhau" element="div" cssClass="alert alert-danger" />--%>
                            </div>

                        </div>
                    </div>



                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-key"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="password" id="confirm-password" path="confirmmatKhau" placeholder="Nhập lại mật khẩu"/>
                            </div>

                        </div>
                    </div>

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-envelope"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="email" id="email" path="email" placeholder="Email cá nhân"/>
                            </div>

                        </div>
                    </div>

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-cloud-arrow-up"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="file" id="file" path="file" placeholder="Upload Avatar"/>
                            </div>
                        </div>
                    </div>




                </div>



                <div class="dky1">

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-user-pen"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="hoTen" id="hoTen" path="hoTen" placeholder="Họ tên"/>
                            </div>
                        </div>
                    </div>


                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-venus-mars"></i></div>
                            </div>


                            <form:select path="gioiTinh" id="gioiTinh1" class="form-select" cssErrorClass="is-invalid">
                                <form:option value="" label="Giới tính" />
                                <form:option value="Nam" label="Nam" />
                                <form:option value="Nữ" label="Nữ" />
                                <form:option value="Khác" label="Khác" />
                            </form:select>        

                        </div>
                    </div>

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-cake-candles"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="date" id="ngaySinh" path="ngaySinh" placeholder="Ngày sinh"/>
                            </div>
                        </div>
                    </div>

                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-phone"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="sdt" id="sdt" path="sdt" placeholder="Số điện thoại"/>
                                <%--<form:errors path="sdt" element="div" cssClass="alert alert-danger" />--%>
                            </div>

                        </div>
                    </div>


                    <div class="login01">
                        <div class="one1">
                            <div class="one11">
                                <div id="tk11"><i class="fa-solid fa-location-dot"></i></div>
                            </div>

                            <div class="one11">
                                <form:input type="diaChi" id="diaChi" path="diaChi" placeholder="Địa chỉ"/>
                            </div>
                        </div>
                    </div>

                </div>

            </section>

            <div class="login01">
                <div class="one21">
                    <button type="submit" >Đăng ký</button>
                </div>
            </div>

        </div>

    </nav>
</form:form>



