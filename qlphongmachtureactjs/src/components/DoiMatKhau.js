import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faLock, faKey, faEnvelope, faCloudArrowUp, faUserPen, faVenusMars, faCakeCandles, faPhone, faLocationDot } from '@fortawesome/free-solid-svg-icons';
import { useRef, useState } from "react";
import App, { MyUserContext } from '../App';
import React, { useContext } from 'react';
import { Form } from 'react-bootstrap';
import Apis, { authApi, endpoints } from '../configs/Apis';
import { Navigate, useNavigate } from 'react-router-dom';


const DoiMatKhau = () => {

    const [duplicatePass, setDuplicatePass] = useState(false);
    const [faild, setFaild] = useState(false);
    const [changeSuccess, setChangeSuccess] = useState(false);
    const [pass, setPass] = useState(true);

    const nav = useNavigate();
    const [user, dispath] = useContext(MyUserContext);

    const [taiKhoan, setTaiKhoan] = useState({
        "matKhau": "",
        "matKhauMoi": "",
        "confirmmatKhau": ""
    });

    const change = (evt, field) => {
        setTaiKhoan(current => {
            return { ...current, [field]: evt.target.value }
        })
    }

    const changePass = (evt) => {
        evt.preventDefault();
        setPass(true);
        setDuplicatePass(false);
        setChangeSuccess(false);
        setFaild(false);

        const process = async () => {
            let formData = new FormData();


            formData.append("taiKhoan", user.taiKhoan);
            formData.append("matKhau", taiKhoan.matKhau);
            formData.append("matKhauMoi", taiKhoan.matKhauMoi);
            let res = await authApi().post(endpoints['doimatkhau'], formData);
            if (res.status === 200) {
                setChangeSuccess(true);
                nav("/");

            }
            else {
                setFaild(true);
            }
        }

        if (taiKhoan.matKhauMoi !== taiKhoan.confirmmatKhau) {
            setPass(false);
        }
        else if (taiKhoan.matKhauMoi === taiKhoan.matKhau) {
            setDuplicatePass(true);
        } else {
            process();
        }


    }


    return (
        <>
            <Form onSubmit={changePass}>

                <nav class="login111">

                    <div class="login_main1111 login_main11114545">

                        <div class="dky111">
                            <p>ĐỔI MẬT KHẨU</p>

                            <div class="login0111">
                                <div class="one111">
                                    <div class="one1111">
                                        <div id="tk1111"><FontAwesomeIcon icon={faLock} /></div>
                                    </div>

                                    <div class="one1111">
                                        <input type="password" id="matKhauHienTai" value={taiKhoan.matKhau} onChange={(e) => change(e, "matKhau")} placeholder="Nhập mật khẩu hiện tại" />
                                    </div>
                                </div>
                            </div>

                            <div class="login0111">
                                <div class="one111">
                                    <div class="one1111">
                                        <div id="tk1111"><FontAwesomeIcon icon={faKey} /></div>
                                    </div>

                                    <div class="one1111">
                                        <input type="password" id="matKhau" value={taiKhoan.matKhauMoi} onChange={(e) => change(e, "matKhauMoi")} placeholder="Nhập mật khẩu mới" />                                    </div>

                                </div>
                            </div>



                            <div class="login0111">
                                <div class="one111">
                                    <div class="one1111">
                                        <div id="tk111"><FontAwesomeIcon icon={faKey} /></div>
                                    </div>

                                    <div class="one1111">
                                        <input type="password" id="confirmmatKhau" value={taiKhoan.confirmmatKhau} onChange={(e) => change(e, "confirmmatKhau")} placeholder="Nhập lại mật khẩu mới" />
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="login0111">
                            <div class="one2111">
                                <button type="submit" >Đổi mật khẩu</button>
                            </div>
                        </div>

                    </div>

                </nav>
            </Form>
        </>
    )
}

export default DoiMatKhau;