<%-- 
    Document   : tienkham
    Created on : Sep 6, 2023, 10:16:38 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/admin/tienkham" var="action">
    <c:param name="tienKham" value="${tienKham.idtienKham}" />
</c:url>


<form method="post" action="${action}">

    <nav class="login111 tienkham_admin">

        <div class="login_main1111 login_main11114545 login_main111145452323">  

            <div class="dky111">
                <p>THAY ĐỔI TIỀN KHÁM</p>

                <div class="login0111">

                    <div class="tienkhamnow">
                        <div class="change1 change1_tienKham">
                            <h5>Tiền khám hiện tại</h5>
                            <input type="text" class="tienKham1" id="tienKham" placeholder="${tienKham.tienKham}vnđ" disabled="true" />
                        </div>
                    </div>

                    <div class="one111">
                        <div class="one1111">
                            <div id="tk1111"><i class="fa-solid fa-dollar-sign"></i></div>
                        </div>

                        <div class="one1111 one1111_tienkham">
                            <input name="newTienKham" type="number" min="0" id="tienKham" placeholder="Nhập tiền khám mới" min="0"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="login0111">
                <div class="one2111 one2111_tienkham">
                    <button type="submit" >Xác nhận</button>
                </div>
            </div>

        </div>

    </nav>
</form>
