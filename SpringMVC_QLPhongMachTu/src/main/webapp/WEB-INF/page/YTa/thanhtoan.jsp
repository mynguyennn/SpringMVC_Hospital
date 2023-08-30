<%-- 
    Document   : thanhtoan
    Created on : Aug 29, 2023, 3:42:02 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/yta/thanhtoan" var="actions"/>


<nav class="header-lapdskham">
    <div class="text-lsk lsk1">
        <p>Thanh toán hóa đơn</p>
    </div>
    <div class="lapdskham_search">
        <!--        <p>Tìm kiếm theo ngày</p>-->
        <form action="${actions}">
            <input name="kwDate" type="date"" placeholder="Tìm kiếm theo ngày...">
            <button type="submit"> <i class="fa-solid fa-magnifying-glass"></i> </button>
        </form>
    </div>
</nav>

<nav class="table1 table123 table1234">


    <section class="table__body1">
        <form>
            <table>
                <thead>
                    <tr>
                        <th>ID Hóa đơn</th>

                        <th>Tên bệnh nhân</th>
                        <th>Tiền khám</th>
                        <th>Tiền thuốc</th>
                        <th>Dịch vụ</th>

                        <th id="User_Role">Tổng tiền</th>
                        <th>Ngày thanh toán</th>

                        <th>Hình thức thanh toán</th>
                        <th></th>

                    </tr>
                </thead>
                <c:forEach items="${listHÐ}" var="d">
                    <tbody>
                        <tr>
                            <td>${d.idHoadon}</td>
                            <td>${d.idPhieudky.idBn.hoTen}</td>

                            <td>${d.tienKham.tienKham}</td>
                            <td>${d.tienThuoc}</td>
                            <td>dich vu</td>

                            <td>${d.tienKham.tienKham + d.tienThuoc}</td>
                            <td>${d.ngayThanhToan}</td>
                            <td>
                                <select path="loaiThanhToan" id="loaiThanhToan" class="form-select form-select1 form-select11" cssErrorClass="is-invalid">
                                    <c:forEach items="${listLoaiTT}" var="c" >
                                        <option value="${c.idloaiThanhToan}" >${c.tenLoaiThanhToan}</option>
                                    </c:forEach>
                                </select>
                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${d.ngayThanhToan == null}">
                                        <a href="<c:url value="/thanhtoan"/>">
                                            <button class="admin_submit111" type="submit">
                                                Thanh toán
                                            </button>
                                        </a>
                                    </c:when>
                                </c:choose>
                            </td>




                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </form>
    </section>




</nav>

<script src="<c:url value="/js/main.js" />"></script>

