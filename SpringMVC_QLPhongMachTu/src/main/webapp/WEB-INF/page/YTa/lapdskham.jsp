<%-- 
    Document   : lapdskham
    Created on : Jul 28, 2023, 3:09:49 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:url value="/yta/lapdskham" var="actions"/>


<c:if test="${msg != null}">
    <div class="alert1">
        ${msg}
    </div>
</c:if>

<nav class="header-lapdskham">
    <div class="text-lsk lsk1">
        <p>Danh sách bệnh nhân đăng ký khám</p>
    </div>
    <div class="lapdskham_search">
        <!--        <p>Tìm kiếm theo ngày</p>-->
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
                    <th>Ngày hẹn khám</th>
                    <th>Thời gian</th>
                    <th>Bác sĩ</th>
                    <th>Trạng thái</th>
                    <th>Y tá xác nhận</th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach items="${dskham}" var="p">
                <tbody>
                    <tr>
                        <td>
                            ${p.idPhieudk}
                            <c:url value="/yta/lapdskham" var="idpk">
                                ${p.idPhieudk}<c:param name="idPhieudk" value="${p.idPhieudk}" />
                            </c:url>
                        </td>
                        <td>[${p.idBn.idTk}] ${p.idBn.hoTen}</td>
                        <td>${p.idBn.email}</td>
                        <td><fmt:formatDate value="${p.chonNgaykham}" pattern="dd-MM-yyyy" /></td>

                        <td>${p.thoiGianKham}</td>


                        <td>
                            ${p.idBs.hoTen}
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
                        <td>${p.idYt.hoTen}</td>
                        <td> 
                            <c:choose>
                                <c:when test="${p.trangThaidky == 0}">
                                    <a href="<c:url value="/yta/lapdskham/${p.idPhieudk}"/>">
                                        <button class="admin_submit111" type="submit">
                                            Chọn
                                        </button>
                                    </a>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </tbody>
            </c:forEach>
        </table>
    </section>


    <nav class="table11">
        <form:form method="post" action="${actions}" modelAttribute="themDSpdk">
            <form:hidden path="chonNgaykham" />
            <form:hidden path="thoiGianKham" />
            <form:hidden path="trangThaidky" />
            <form:hidden path="idPk" />
            <%--<form:hidden path="thoiGianTaophieu" />--%>
            <div class="chonbacsi">
                <h5>ID Phiếu khám</h5>
                <form:input type="text" class="" 
                            path="idPhieudk" id="idPhieudk" readonly="true"/>


            </div>
            <div class="chonbacsi">
                <h5>ID Bệnh nhân</h5>
                <form:input type="text" class="" 
                            path="idBn" id="idBn" readonly="true"/>


            </div>
            <div class="chonbacsi">
                <h5>ID Y tá</h5>
                <form:input value="${user.idTk}" type="text" class="" 
                            path="idYt" id="idYt" readonly="true"/>


            </div>

            <div class="chonbacsi">
                <h5>Bác Sĩ</h5>
                <form:select class="form-select" id="role" name="idBs" path="idBs">
                    <c:forEach items="${dsTk}" var="c">
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

            </div>
            <c:choose>
                <c:when test="${empty dsTk }">
                    <div class="btnchonbacsi" style="display: none">
                        <button class="" type="submit">Xác nhận</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="btnchonbacsi" >
                        <button class="" type="submit">Xác nhận</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </form:form>
    </nav>
</nav>


