<%-- 
    Document   : lichtruc
    Created on : Aug 30, 2023, 5:00:50 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/admin/lichtruc" var="actions"/>


<main class="table">
    <div>

        <%--<c:if test="${err != null}">--%>
        <!--<div class="alert1">-->
        <!--${err}-->
        <!--</div>-->
        <%--</c:if>--%>
        <section class="table__header">
            <h3>DANH SÁCH TÀI KHOẢN</h3>
            <div class="inputkw">
                <form action="${actions}">
                    <input name="kw" type="search" placeholder="Tìm kiếm...">
                    <button type="submit"> <i class="fa-solid fa-magnifying-glass"></i> </button>
                </form>
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
                        <th id="Username">Username</th>
                        <th id="Password">Password</th>
                        <th id="User_Role">Chức vụ</th>
                        <th>Email</th>
                        <th>SĐT</th>
                        <th>Năm sinh</th>
                        <th>Giới tính</th>
                        <th>Địa chỉ</th>


                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${tk}" var="p">


                        <tr>



                            <td>
                                <a href="<c:url value="/admin/lichtruc/${p.idTk}"/>" >
                                    <img src="${p.avt}" alt="null" width="65" />
                                </a>
                            </td>

                            <td>${p.idTk}</td>
                            <td>${p.hoTen}</td>                     
                            <td>${p.taiKhoan}</td>
                            <td id="pass-text"><i class="fa-solid fa-eye-slash"></i></td>
                            <td>${p.idRole.chucVu}</td>
                            <td>${p.email}</td>
                            <td>${p.sdt}</td>
                            <td>${p.ngaySinh}</td>
                            <td>${p.gioiTinh}</td>
                            <td>${p.diaChi}</td>


                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        </form>
    </div>
</main>


<div class="contentdkk3 contentdkk31">
    <div id="input_tt">
        <h5>ID </h5>
        <input type="text" path="idTk" placeholder="${idtk.idTk}" disabled="true"/>
    </div>

    <div>
        <h5>Họ tên</h5>
        <input type="text" path="hoTen" placeholder="${idtk.hoTen}" disabled="true"/>
    </div>

    <div class="contentdkk5 contentdkk51">
        <h5>Chức vụ</h5>
        <input type="text" path="chucVu" placeholder="${idtk.idRole.chucVu}" disabled="true"/>
    </div>


</div>




<form:form method="post" modelAttribute="lichtruc" action="${actions}" enctype="multipart/form-data">
    <div class="text-lsk text-lsk111">
        <p>Đăng ký lịch trực</p>
    </div>

    <main class="table lskham">
        <div>
            <section class="table__body lskham1 dkylich">
                <table>
                    <thead>

                        <tr>
                            <th>Buổi/Ca</th>
                                <c:forEach items="${dateList}" var="date">
                                <td>
                                    <%--<form:checkbox path="listDate" value="${date}"/>--%>
                                    <fmt:formatDate value="${date}" pattern="dd/MM/yyyy" />
                                </td>
                            </c:forEach>

                        </tr>

                    </thead>

                    <tbody>
                        <c:forEach items="${caTruc}" var="caTruc" >
                            <tr id="input_dky">
                                <td>${caTruc.buoiTruc}</td>
                                <c:forEach items="${dateList}" var="date">
                                    <td><input type="checkbox" id="checkbox${caTruc.idtgTruc}/${date.date}/${date.month+1}/${date.year+1900}" name="selectedDates" value="${caTruc.idtgTruc}/${date.date}/${date.month+1}/${date.year+1900}" ></td>
                          
                            
                                    </c:forEach>
                            </tr>
                        </c:forEach>
                            
                    </tbody>
                    <input type="hidden" name="caTrucId" value="${caTrucId.idtgTruc}" />
                     <input type="hidden" id="dateField" name="selectedDates" value="">
                      <input type="hidden" name="id" value="${idtk.idTk}" />
                </table>


            </section>
        </div>

    </main>
    <div class="login0111">
        <div class="one2111 one2111">
            <button type="submit" >Xác nhận</button>
        </div>
    </div>
</form:form>


<!--<script>
function getCheckbox(checkbox) {
    if(checkbox.checked)
    {
        var value = checkbox.value;
        var parts = value.split("-");
        var caTrucId = parts[0];
        var date = parts[1];
        var dateParts = date.split("-");

         var year = dateParts[3];
            var month = dateParts[2];
            var day = dateParts[1];

        var dateField = document.getElementById("dateField");
        dateField.value = caTrucId + "-" + year + "-" + month + "-" + day;
    }
}
</script>-->