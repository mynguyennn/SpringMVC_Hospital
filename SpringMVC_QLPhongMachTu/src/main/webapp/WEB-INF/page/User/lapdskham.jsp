<%-- 
    Document   : lapdskham
    Created on : Jul 28, 2023, 3:09:49 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<nav class="container">
    <div class="container mt-3">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>HỌ VÀ TÊN</th>
                    <th>NĂM SINH</th>
                    <th>GIỚI TÍNH</th>
                    <th>ĐỊA CHỈ</th>
                    <th>EMAIL</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${benhnhan}" var="p">
                    <tr>
                        <td>${p.idBn}</td>
                        <td>${p.hoTen}</td>
                        <td>${p.namSinh}</td>
                        <td>${p.gioiTinh}</td>
                        <td>${p.diaChi}</td>
                        <td>${p.email}</td>
                        <td>
                            <a href="#" class="btn btn-success">Đồng ý</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</nav>



