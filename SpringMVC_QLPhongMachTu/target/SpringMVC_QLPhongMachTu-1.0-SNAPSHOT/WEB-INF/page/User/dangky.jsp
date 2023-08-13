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
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>


<nav class="login">
    <div class="login_main">  
        <form:form class="form_login" method="post" action="${action}" modelAttribute="user" 
                   enctype="multipart/form-data">
            <p>ĐĂNG KÝ</p>

            <!--
                        <div class="login0">
                            <div class="one">
                                <div class="one1">
                                    <div id="tk1"><i class="fas fa-lock"></i></div>
                                </div>
            
                                <div class="one1">
            <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
        </div>
    </div>
</div>

<div class="login0">
    <div class="one">
        <div class="one1">
            <div id="tk1"><i class="fas fa-lock"></i></div>
        </div>

        <div class="one1">
            <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
        </div>
    </div>
</div>

<div class="login0">
    <div class="one">
        <div class="one1">
            <div id="tk1"><i class="fas fa-lock"></i></div>
        </div>

        <div class="one1">
            <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
        </div>
    </div>
</div>

<div class="login0">
    <div class="one">
        <div class="one1">
            <div id="tk1"><i class="fas fa-lock"></i></div>
        </div>

        <div class="one1">
            <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
        </div>
    </div>
</div>

<div class="login0">
    <div class="one">
        <div class="one1">
            <div id="tk1"><i class="fas fa-lock"></i></div>
        </div>

        <div class="one1">
            <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
        </div>
    </div>
</div>-->

            <div class="login0">
                <div class="one">
                    <div class="one1">
                        <div id="tk1"><i class="fa-solid fa-user"></i></div>
                    </div>

                    <div class="one1">
                        <form:input type="text" id="username" path="taiKhoan" placeholder="Nhập tài khoản"/>
                    </div>
                </div>
            </div>

            <div class="login0">
                <div class="one">
                    <div class="one1">
                        <div id="tk1"><i class="fas fa-lock"></i></div>
                    </div>

                    <div class="one1">
                        <form:input type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu"/>
                    </div>
                </div>
            </div>



            <div class="login0">
                <div class="one">
                    <div class="one1">
                        <div id="tk1"><i class="fas fa-lock"></i></div>
                    </div>

                    <div class="one1">
                        <form:input type="password" id="confirm-password" path="confirmmatKhau" placeholder="Nhập lại mật khẩu"/>
                    </div>
                </div>
            </div>

            <div class="login0">
                <div class="one">
                    <div class="one1">
                        <div id="tk1"><i class="fa-solid fa-cloud-arrow-up"></i></div>
                    </div>

                    <div class="one1">
                        <form:input type="file" id="file" path="file" placeholder="Upload Avatar"/>
                    </div>
                </div>
            </div>

            <div class="login0">
                <div class="one2">
                    <button type="submit" >Đăng ký</button>
                </div>
            </div>

        </form:form>
    </div>
</nav>



