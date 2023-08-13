<%-- 
    Document   : quanlyAdmin
    Created on : Aug 2, 2023, 3:45:24 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/quanlythuoc" var="actions"/>
<form:form method="post"  action="${actions}" modelAttribute="thuoc" enctype="multipart/form-data">

    <main class="table">
        <div>
            <section class="table__header">
                <h3>DANH SÁCH THUỐC</h3>
                <div class="input-group">
                    <input type="search" placeholder="Tìm kiếm...">
                    <button> <i class='bx bx-search-alt-2'></i> </button>
                </div>
            </section>
            <section class="table__body">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Thuốc</th>
                            <th>Xuất Xứ</th>
                            <th>Gía Thuốc</th>
                            <th>Đơn Vị </th>
                            <th>Số Lượng</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody >
                        <c:forEach items="${qlThuoc}" var="t">
                            <tr >
                                <td>
                                    <c:url value="/api/admin/quanlythuoc/${t.idThuoc}" var="apiDelete" />
                                    <div class="admin_submit admin_submit11" onclick="DeleThuoc('${apiDelete}')">
                                        XÓA  
                                    </div>
                                </td>
                                <td>${t.idThuoc}</td>
                                <td><a href="<c:url value="/admin/quanlythuoc/${t.idThuoc}"/>" >
                                        ${t.tenThuoc}
                                    </a></td>
                                <td>${t.xuatXu}</td>
                                <td>${t.giaThuoc}</td>
                                <td>${t.donVi}</td>
                                <td>${t.soLuong}</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>

            <section class="admin_btn">


                <div class="admin_submit">
                    <button type="submit">
                        <c:choose>

                            <c:when test="${thuoc.idThuoc != null}">
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
        <form:hidden path="idThuoc"/>

        <div class="change_ac">

            <div class="change_ac1">
                <div class="change1">
                    <h5>Tên Thuốc</h5>
                    <form:input type="text" path="tenThuoc" id="tenThuoc" placeholder=""/>
                </div>

                <div class="change1">
                    <h5>Xuất Xứ</h5>
                    <form:input type="text" path="xuatXu" id="xuatXu" placeholder=""/>
                </div>

            </div>

            <div class="change_ac1">
                <div class="change1">
                    <h5>Giá Thuốc</h5>
                    <form:input type="text" path="giaThuoc" id="giaThuoc" placeholder=""/>
                </div>
                <div class="change1">
                    <h5>Đơn Vị</h5>
                    <form:input type="text" path="donVi" id="donVi" placeholder=""/>
                </div>

            </div>
            <div class="change_ac1">
                <div class="change1">
                    <h5>Số Lượng</h5>
                    <form:input type="text" path="soLuong" id="soLuong" placeholder=""/>
                </div>
            </div>
        </div>
    </main>

</form:form>

<script src="<c:url value="/js/main.js" />"></script>
