<%-- 
    Document   : lichsukham
    Created on : Aug 12, 2023, 11:18:36 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/benhnhan/lichsukham" var="actions"/>
<c:if test="${err != null}">
    <div class="alert1">
        ${err}
    </div>
</c:if>

<form:form modelAttribute="user">
    <div class="text-lsk text-lsk111">
        <p>Lịch sử đăng ký phiếu khám</p>
    </div>
    <main class="table lskham">
        <div>
            <section class="table__body lskham1">
                <table>
                    <thead>
                        <tr>

                            <th>Tên bệnh nhân</th>


                            <th>Ngày khám</th>
                            <th>Thời gian</th>
                            <th>Trạng thái</th>
                            <th id="Username">Y tá xác nhận</th>
                            <th id="Username">Bác sĩ khám</th>
                            <th></th>

                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${lskham}" var="p">
                            <tr>
                                <td>${p.idBn.hoTen}</td>


                                <td>${p.chonNgaykham}</td>
                                <td>${p.thoiGianKham}</td>
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
                                <td>${p.idBs.hoTen}</td>
                                <td>
                                    <c:url value="/api/benhnhan/lichsukham/${t.idPhieudk}" var="apiDelete" />
                                    <c:choose>
                                        <c:when test="${p.trangThaidky.toString() eq 0}">
                                            <div class="btn_lsk" onclick="xoaLsPhieuDky('${apiDelete}')" > Hủy phiếu đăng ký </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class ="btn_lsk1" disabled>Hủy phiếu đăng ký</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>

    </main>
</form:form>
<script src="<c:url value="/js/main.js" />"></script>