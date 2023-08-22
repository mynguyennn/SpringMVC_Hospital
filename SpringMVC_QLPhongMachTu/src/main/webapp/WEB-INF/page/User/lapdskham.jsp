<%-- 
    Document   : lapdskham
    Created on : Jul 28, 2023, 3:09:49 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/yta/lapdskham" var="actions"/>
<h1>${msg}</h1>
<nav class="header-lapdskham">
    <div class="text-lsk lsk1">
        <p>Danh sách bệnh nhân đăng ký khám</p>
    </div>
    <div class="lapdskham_search">
        <p>Tìm kiếm theo ngày</p>
        <form action="${actions}">
            <input name="kwDate" type="date"" placeholder="Tìm kiếm theo ngày...">
            <button type="submit"> <i class="fa-solid fa-magnifying-glass"></i> </button>
        </form>
    </div>
</nav>


<nav class="table1">
    <section class="table__body1">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>ID Bệnh nhân</th>
                    <th>Email</th>
                    <th>Ngày đăng ký</th>
                    <th>Y tá</th>
                    <th>Bác sĩ</th>
                    <th>Ngày hẹn khám</th>
                    <th>Trạng thái</th>
                    <th></th>
                    <!--<th>ID Phiếu khám</th>-->
                </tr>
            </thead>
            <c:forEach items="${dskham}" var="p">
                <tbody>
                    <tr>
                        <td>${p.idPhieudk}</td>
                        <td>[${p.idBn.idTk}] ${p.idBn.hoTen}</td>
                        <td>${p.idBn.email}</td>
                        <td>${p.ngayDky}</td>
                        <td>${p.idYt.hoTen}</td>

                        <td>
                            <%--<form:select name="idBS" path="idBS" id="idBS" class="form-select" cssErrorClass="is-invalid">--%>
                            <%--<c:forEach items="${dsbacsi}" var="c">--%>
                            <%--<form:option value="${c.idTk}" >${c.hoTen}</form:option>--%>
                            <%--</c:forEach>--%>
                            <%--</form:select>--%>
                            ${p.idBs.hoTen}
                        </td>

                        <td>
                            <%--<form:input type="date" path="ngayHkham" id="ngayHKham" placeholder=""/>--%>
                            ${p.ngayHkham}
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${p.trangThaidky.toString() eq 0}">
                                    <p id="xacnhan">Chưa xác nhận</p>
                                </c:when>
                                <c:otherwise>
                                    <p id="xacnhan1"> Đã xác nhận </p>
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td> 
                            <a href="<c:url value="/yta/lapdskham/${p.idPhieudk}"/>" class="btn btn-success">
                                <c:choose>
                                    <c:when test="${p.trangThaidky == 0}">
                                        Xác Nhận
                                    </c:when>
                                    <c:otherwise>
                                        Hủy
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </td>


<!--<td>${p.idPk.idPhieukham}</td>-->

                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </section>
</nav>
<nav class="table">
    <form:form method="post" action="${actions}" modelAttribute="themDSpdk">
        <form:hidden path="ngayDky" />
        <%--<form:hidden path="ngayHkham" />--%>
        <form:hidden path="trangThaidky" />
        <form:hidden path="idPk" />
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="idPhieudk" id="idPhieudk"/>
            <label for="name">Mã Phiếu Khám</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="idBn" id="idBn"/>
            <label for="name">Mã Bệnh Nhân</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input value="${user.idTk}" type="text" class="form-control" 
                        path="idYt" id="idYt"/>
            <label for="name">Mã y tá</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="date" path="ngayHkham" id="ngayHKham" placeholder=""/>


        </div>
        <div class="form-floating mb-3 mt-3">
            <form:select class="form-select" id="role" name="idBs" path="idBs">
                <c:forEach items="${dsbacsi}" var="c">
                    <c:choose>
                        <c:when test="${c.idTk == p.idBs.idTk}">
                            <option value="${c.idTk}" selected>${c.hoTen}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${c.idTk}">${c.hoTen}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </form:select>
            <label for="category" class="form-label">Chọn Bác Sĩ:</label>
        </div>
        <div class="form-floating mb-3 mt-3">
            <button class="btn btn-info" type="submit">Thêm Bác Sĩ</button>
        </div>


    </form:form>
</nav>





