import App, { MyUserContext } from '../App';
import React, { useContext } from 'react';
import { useRef, useState } from "react";
import Apis, { endpoints } from '../configs/Apis';
import { Navigate, useNavigate } from 'react-router-dom';
import { Alert, Form, NavItem } from 'react-bootstrap';
import { format } from 'date-fns';


const DangKyKhamBenh = () => {
    const [user, dispath] = useContext(MyUserContext);


    const formattedNgaySinh = format(user.ngaySinh, 'yyyy-MM-dd');

    const [pdk, setPdk] = useState({
        "chonNgaykham": "", "thoiGianKham": "", "userId": user.idTk
    });

    const nav = useNavigate();

    const [err, setErr] = useState(null);

    const dangkykham = async (evt) => {
        evt.preventDefault();

        const process = async () => {
            const form = new FormData();


            for (let field in pdk)
                form.append(field, pdk[field]);

            let res = await Apis.post(endpoints['dangkykhamapi'], form);

            if (res.status === 201) {
                nav("/");
            }
            else {
                setErr("Lưu thất bại!");
            }


        };

        process();

    };

    // console.log(user.idTk);

    const change = (evt, field) => {
        setPdk(current => {
            return { ...current, [field]: evt.target.value }
        })
    }

    return (
        <>
            {err === null ? "" : <div class="alert1"><Alert>{err}</Alert></div>}

            <nav class="dkk_main">

                {/* <Form > */}

                <div class="dkk">

                    <div class="dkk1">
                        <div class="contentdkk1">
                            <h5>Lưu ý:</h5>
                            <h5>Lịch hẹn có hiệu lực sau khi có xác nhận chính thức từ Phòng khám Bệnh viện Health couch</h5>
                            <h5>Quý khánh hàng vui lòng cung cấp thông tin chính xác để được phục vụ tốt nhất. Trong trường hợp cung cấp sai thông tin email & điện thoại, việc xác nhận cuộc hẹn sẽ không hiệu lực.</h5>
                            <h5>Quý khách sử dụng dịch vụ đặt hẹn trực tuyến, xin vui lòng đặt trước ít nhất là 24 giờ trước khi đến khám.</h5>
                            <h5>Trong trường hợp khẩn cấp hoặc nghi ngờ có các triệu chứng nguy hiểm, quý khách vui lòng ĐẾN TRỰC TIẾP Phòng khám hoặc các trung tâm y tế gần nhất để kịp thời xử lý.</h5>
                        </div>
                    </div>
                    <div class="contentdkk2_main">
                        <div class="contentdkk2">
                            <h1>ĐĂNG KÝ KHÁM</h1>
                            <h5>Vui lòng kiểm tra và cập nhật thông tin chính xác trước khi gửi phiếu đăng ký khám!</h5>
                        </div>





                        <div class="contentdkk3">
                            <input
                                className="custom-input"
                                type="text"
                                id="custom-input1"
                                value={user.hoTen}
                                placeholder="Họ và tên"
                                onChange={(e) => change(e, "hoTen")}

                            />


                            <input class="custom-input" type="text" id="custom-input1" value={user.email} placeholder="Email cá nhân" />
                        </div>

                        <div class="contentdkk4">


                            <select value={user.gioiTinh} id="gioiTinh" class="form-select" cssErrorClass="is-invalid">
                                <option value="" label="Giới tính" />
                                <option value="Nam" label="Nam" />
                                <option value="Nữ" label="Nữ" />
                                <option value="Khác" label="Khác" />
                            </select>


                            <div class="contentdkk5">
                                {/* <input class="custom-input" type="date" id="custom-input1" value={user.ngaySinh} placeholder="" /> */}
                                <input className="custom-input" type="date" id="custom-input1" value={formattedNgaySinh} placeholder="Ngày sinh"
                                />
                            </div>

                            <div class="contentdkk5">
                                <input class="custom-input" type="text" id="custom-input1" value={user.sdt} placeholder="Số điện thoại" />
                            </div>

                            <div class="contentdkk5">
                                <input class="custom-input" type="text" id="custom-input1" value={user.diaChi} placeholder="Địa chỉ" />
                            </div>







                            <div class="submitdkk submitdkk111">
                                <button type="submit">CẬP NHẬT THÔNG TIN</button>
                            </div>

                        </div>


                        <Form onSubmit={dangkykham}>

                            <div class="contentdkk2 contentdkk22">
                                <h5>* Thông tin bắt buộc phải đăng ký</h5>
                            </div>



                            <div class="contentdkk5">
                                <input class="custom-input" value={pdk.chonNgaykham} onChange={(e) => change(e, "chonNgaykham")} type="date" id="chonNgaykham" path="chonNgaykham" placeholder="Ngày khám" />
                            </div>

                            <select value={pdk.thoiGianKham} onChange={(e) => change(e, "thoiGianKham")} id="thoiGianKham" class="form-select buoiKham1" path="thoiGianKham" cssErrorClass="is-invalid" placeholder="Giờ khám">
                                <option value="" label="Buổi khám" />
                                <option value="Sáng" label="Sáng" />
                                <option value="Trưa" label="Trưa" />
                                <option value="Chiều" label="Chiều" />
                            </select>

                            <div class="submitdkk">
                                <button type="submit" >ĐĂNG KÝ KHÁM</button>
                            </div>
                            <p id="luuy">*Lưu ý: bệnh nhân chỉ được gửi phiếu đăng ký khám mới sau 24h kể từ khi gửi phiếu đăng ký hiện tại!</p>

                            {/* <input type="text" id="hoTen111" path="tenBenhNhanDky" value="${pageContext.request.userPrincipal.name}" /> */}
                        </Form>
                    </div>

                </div>
                {/* </Form> */}
            </nav>
        </>
    )
}
export default DangKyKhamBenh;