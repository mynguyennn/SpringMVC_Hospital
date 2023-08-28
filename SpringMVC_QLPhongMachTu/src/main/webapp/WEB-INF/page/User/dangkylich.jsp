<%-- 
    Document   : dangkylich
    Created on : Aug 19, 2023, 12:32:49 PM
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/dangkylich" var="actions"/>

<c:if test="${err != null}">
    <div class="alert1">
        ${err}
    </div>
</c:if>

<form:form modelAttribute="">
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
                            <th>Thứ 2</th>
                            <th>Thứ 3</th>
                            <th>Thứ 4</th>
                            <th>Thứ 5</th>
                            <th>Thứ 6</th>
                            <th>Thứ 7</th>
                            <th>Chủ nhật</th>

                        </tr>
                    </thead>

                    <tbody>
                        <tr id="input_dky">
                            <td>Sáng</td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                        </tr>
                        <tr id="input_dky">
                            <td>Trưa</td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                        </tr>
                        <tr id="input_dky">
                            <td>Chiều</td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                            <td><input type="checkbox" id="" name="" value=""/></td>
                        </tr>
                    </tbody>


                </table>

                <div class="login0111">
                    <div class="one2111 one2111">
                        <button type="submit" >Xác nhận</button>
                    </div>
                </div>
            </section>
        </div>
    </main>
</form:form>
<script src="<c:url value="/js/main.js" />"></script>
