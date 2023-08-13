<%-- 
    Document   : quanlytk
    Created on : Aug 6, 2023, 1:16:40 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/quanlytaikhoan" var="actions"/>
<form:form method="post" modelAttribute="addtaikhoan" action="${actions}" enctype="multipart/form-data">

    <main class="table">
        <div>
            <section class="table__header">
                <h3>DANH SÁCH TÀI KHOẢN</h3>
                <div class="input-group">
                    <input type="search" placeholder="Tìm kiếm...">
                    <button> <i class='bx bx-search-alt-2'></i> </button>
                </div>
            </section>


            <section class="table__body">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Avatar</th>
                            <th>ID</th>
                            <th>Họ tên </th>
                            <th>Năm sinh</th>
                            <th>Giới tính</th>
                            <th>Địa chỉ</th>
                            <th>Email</th>
                            <th>SDT</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>User_Role</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${qltaikhoan}" var="p">


                            <tr>
                                <td>
                                    <c:url value="/api/admin/quanlytaikhoan/${p.idTk}" var="apiDel"/>
                                    <div class="admin_submit admin_submit11" onclick="xoaTaiKhoan('${apiDel}')">
                                        XÓA  
                                    </div>
                                </td>


                                <td>
                                    <a href="<c:url value="/admin/quanlytaikhoan/${p.idTk}"/>" >
                                        <img src="${p.avt}" alt="null" width="70" />
                                    </a>
                                </td>

                                <td>${p.idTk}</td>
                                <td>${p.hoTen}</td>
                                <td>${p.ngaySinh}</td>
                                <td>${p.gioiTinh}</td>
                                <td>${p.diaChi}</td>
                                <td>${p.email}</td>
                                <td>${p.sdt}</td>
                                <td>${p.taiKhoan}</td>
                                <td id="pass-text">${p.matKhau}</td>
                                <td>${p.idRole.chucVu}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>

            <section class="admin_btn">
                <!--                <div class="admin_submit">
                                    <button type="submit">THÊM</button>         
                                </div>-->

                <div class="admin_submit">
                    <button type="submit">
                        <c:choose>
                            <c:when test="${addtaikhoan.idRole != null}">
                                CẬP NHẬT
                            </c:when>
                            <c:otherwise>
                                THÊM    
                            </c:otherwise>
                        </c:choose>
                    </button>      
                </div>

                <div class="admin_submit">
                    <button type="submit">TẢI LẠI</button>   
                </div>

            </section>

        </div>
        <!--        <div class="change1">
                    <h5>ID</h5>
                    <input type="text" id="idTk" placeholder="" disabled/>
                </div>-->



        <form:hidden path="idTk"/>
        <form:hidden path="avt"/>

        <div class="change_ac">

            <div class="change_ac1">
                <div class="change1">
                    <h5>Họ tên</h5>
                    <form:input type="text" path="hoTen" id="hoTen" placeholder=""/>
                </div>

                <div class="change1">
                    <h5>Ngày sinh</h5>
                    <form:input type="text" path="ngaySinh" id="ngaySinh" placeholder=""/>
                </div>

            </div>


            <div class="change_ac1">
                <div class="change1">
                    <h5>Giới tính</h5>
                    <%--<form:input type="text" path="gioiTinh" id="gioiTinh" placeholder=""/>--%>
                    <form:select path="gioiTinh" id="gioiTinh" class="form-select" cssErrorClass="is-invalid">
                        <form:option value="Nam" label="Nam" />
                        <form:option value="Nữ" label="Nữ" />
                        <form:option value="Khác" label="Khác" />
                    </form:select>

                </div>

                <div class="change1">
                    <h5>Email</h5>
                    <form:input type="text" path="email" id="Email" placeholder=""/>
                </div>

            </div>



            <div class="change_ac1">
                <div class="change1">
                    <h5>Địa chỉ</h5>
                    <form:input type="text" path="diaChi" id="diaChi" placeholder=""/>
                </div>
                <div class="change1">
                    <h5>SÐT</h5>
                    <form:input type="text" path="sdt" id="sdt" placeholder=""/>
                </div>

            </div>


            <div class="change_ac1">


                <div class="change1">
                    <h5>Username</h5>
                    <form:input type="text" path="taiKhoan" id="taiKhoan" placeholder=""/>
                </div>

                <div class="change1">
                    <h5>Password</h5>
                    <form:input type="text" path="matKhau" id="matKhau" placeholder=""/>
                </div>

            </div>


            <div class="change_ac1" id="role_main">
                <div class="change1">
                    <h5>Chức vụ</h5>
                    <form:select class="role" name="role" id="role" path="idRole">
                        <c:forEach items="${user_role}" var="c" >
                            <c:choose>
                                <c:when test="${c.idRole == addtaikhoan.idRole.idRole}">
                                    <option value="${c.idRole}" selected>${c.chucVu}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${c.idRole}">${c.chucVu}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="change1">
                    <h5>Avatar</h5>
                    <form:input type="file" id="file" path="file" placeholder="Upload Avatar"/>

                </div>
            </div>




        </div>

    </main>
</form:form>


<script src="<c:url value="/js/main.js" />"></script>
