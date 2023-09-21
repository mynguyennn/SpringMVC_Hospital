
import '../css/css.css'
import App from '../App'
import React from 'react'
import ReactDOM from 'react-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faLock, faKey, faEnvelope, faCloudArrowUp, faUserPen, faVenusMars, faCakeCandles, faPhone, faLocationDot } from '@fortawesome/free-solid-svg-icons';
import { useRef, useState } from "react";
import Apis, { endpoints } from '../configs/Apis';
import { Navigate, useNavigate } from 'react-router-dom';
import { Alert, Form, NavItem } from 'react-bootstrap';


const DangKy = () => {

    const [user, setUser] = useState({
        "taiKhoan": "", "matKhau": "", "hoTen": "", "confirmmatKhau": "",
        "gioiTinh": "", "diaChi": "", "email": "", "sdt": "", "ngaySinh": ""
    });

    const avatar = useRef();

    const nav = useNavigate();

    const [err, setErr] = useState(null);

    const dangky = (evt) => {
        evt.preventDefault();

        const process = async () => {
            let form = new FormData;

            for (let field in user)

                if (field !== "confirmmatKhau")
                    form.append(field, user[field]);

            form.append("avatar", avatar.current.files[0])

            let res = await Apis.post(endpoints['dangky'], form);

            if (res.status === 201)
                nav("/dangnhap");

        }

        if (user.matKhau === user.confirmmatKhau)
            process();
        else
            setErr("Mật khẩu không khớp!")
    }

    const change = (evt, field) => {
        setUser(current => {
            return { ...current, [field]: evt.target.value }
        })
    }

    


    return (
        <>
            {err === null ? "" : <div class="alert1"><Alert>{err}</Alert></div>}
            <nav class="login1">

                <div class="login_main11">

                    <p>ĐĂNG KÝ KHÁM</p>
                    <Form onSubmit={dangky}>
                        <section class="dky_flex" >

                            <div class="dky1">

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faUser} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.taiKhoan} onChange={(e) => change(e, "taiKhoan")} type="text" id="username" path="taiKhoan" placeholder="Nhập tài khoản" />
                                        </div>
                                    </div>
                                </div>

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faKey} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.matKhau} onChange={(e) => change(e, "matKhau")} type="password" id="password" path="matKhau" placeholder="Nhập mật khẩu" />
                                            {/* /* <%--<form:errors path="matKhau" element="div" cssClass="alert alert-danger" />--%> */}
                                        </div>

                                    </div>
                                </div>



                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faKey} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.confirmmatKhau} onChange={(e) => change(e, "confirmmatKhau")} type="password" id="confirm-password" path="confirmmatKhau" placeholder="Nhập lại mật khẩu" />
                                        </div>

                                    </div>
                                </div>

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faEnvelope} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.email} onChange={(e) => change(e, "email")} type="email" id="email" path="email" placeholder="Email cá nhân" />
                                        </div>

                                    </div>
                                </div>

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faCloudArrowUp} /></div>
                                        </div>

                                        <div class="one11">
                                            <input type="file" ref={avatar} id="file" path="file" placeholder="Upload Avatar" />
                                        </div>
                                    </div>
                                </div>




                            </div>



                            <div class="dky1">

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faUserPen} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.hoTen} onChange={(e) => change(e, "hoTen")} type="hoTen" id="hoTen" path="hoTen" placeholder="Họ tên" />
                                        </div>
                                    </div>
                                </div>


                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faVenusMars} /></div>
                                        </div>


                                        <select value={user.gioiTinh} onChange={(e) => change(e, "gioiTinh")} path="gioiTinh" id="gioiTinh1" class="form-select" cssErrorClass="is-invalid">
                                            <option value="" label="Giới tính" />
                                            <option value="Nam" label="Nam" />
                                            <option value="Nữ" label="Nữ" />
                                            <option value="Khác" label="Khác" />
                                        </select>

                                    </div>
                                </div>

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faCakeCandles} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.ngaySinh} onChange={(e) => change(e, "ngaySinh")} type="date" id="ngaySinh" path="ngaySinh" placeholder="Ngày sinh" />
                                        </div>
                                    </div>
                                </div>

                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faPhone} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.sdt} onChange={(e) => change(e, "sdt")} type="sdt" id="sdt" path="sdt" placeholder="Số điện thoại" />
                                            {/* /* <%--<form:errors path="sdt" element="div" cssClass="alert alert-danger" />--%> */}
                                        </div>

                                    </div>
                                </div>


                                <div class="login01">
                                    <div class="one1">
                                        <div class="one11">
                                            <div id="tk11"><FontAwesomeIcon icon={faLocationDot} /></div>
                                        </div>

                                        <div class="one11">
                                            <input value={user.diaChi} onChange={(e) => change(e, "diaChi")} type="diaChi" id="diaChi" path="diaChi" placeholder="Địa chỉ" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </section>

                        <div class="login01">
                            <div class="one21">
                                <button type="submit" >Đăng ký</button>
                            </div>
                        </div>
                    </Form>


                </div>

            </nav>
        </>
    )
}

export default DangKy;