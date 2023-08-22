<%-- 
    Document   : doimatkhau
    Created on : Aug 12, 2023, 11:18:41 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<c:url value="/doimatkhau" var="action"/>

<c:if test="${errMsg != null}">
    <div class="alert1">
        ${errMsg}
    </div>
</c:if>

<form:form class="form_login11" method="post" action="${action}" modelAttribute="updatepass">

    <form:hidden path="idTk"/>
    <form:hidden path="taiKhoan"/>

    <nav class="login111">

        <div class="login_main1111">  

            <div class="dky111">
                <p>ĐỔI MẬT KHẨU</p>

                <div class="login0111">
                    <div class="one111">
                        <div class="one1111">
                            <div id="tk1111"><i class="fa-solid fa-unlock"></i></div>
                        </div>

                        <div class="one1111">
                            <form:input type="password" id="matKhauHienTai" path="matKhauHienTai" placeholder="Nhập mật khẩu hiện tại"/>
                        </div>
                    </div>
                </div>

                <div class="login0111">
                    <div class="one111">
                        <div class="one1111">
                            <div id="tk1111"><i class="fa-solid fa-key"></i></div>
                        </div>

                        <div class="one1111">
                            <form:input type="password" id="matKhau" path="matKhau" placeholder="Nhập mật khẩu mới"/>
                            <%--<form:errors path="matKhau" element="div" cssClass="alert alert-danger" />--%>
                        </div>

                    </div>
                </div>



                <div class="login0111">
                    <div class="one111">
                        <div class="one1111">
                            <div id="tk111"><i class="fa-solid fa-key"></i></div>
                        </div>

                        <div class="one1111">
                            <form:input type="password" id="confirmmatKhau" path="confirmmatKhau" placeholder="Nhập lại mật khẩu mới"/>
                        </div>

                    </div>
                </div>
            </div>

            <div class="login0111">
                <div class="one2111">
                    <button type="submit" >Đổi mật khẩu</button>
                </div>
            </div>

        </div>

    </nav>
</form:form>