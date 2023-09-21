import '../css/css.css'
import App, { MyUserContext } from '../App'
import React, { useContext } from 'react'
import ReactDOM from 'react-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser, faLock } from '@fortawesome/free-solid-svg-icons';
import { useState } from 'react';
import { button } from 'bootstrap';
import Apis, { authApi, endpoints } from '../configs/Apis';
import cookie from "react-cookies";
import { Navigate, useNavigate } from 'react-router-dom';

const DangNhap = () => {


    const [user, dispath] = useContext(MyUserContext);
    const [taiKhoan, setTaiKhoan] = useState();
    const [matkhau, setMatKhau] = useState();
    const [err, setErr] = useState(null);
    // const nav = useNavigate();
    const dangnhap = (evt) => {
        evt.preventDefault();

        const process = async () => {
            try {
                let res = await Apis.post(endpoints['dangnhap'],
                    {
                        "taiKhoan": taiKhoan, "matKhau": matkhau
                    });
                cookie.save("token", res.data);

                let { data } = await authApi().get(endpoints['current-user']);
                cookie.save("user", data);

                dispath({
                    "type": "dangnhap",
                    "payload": data
                })

            } catch (err) {
                console.error(err)
            }

        }

        process();
    }

    if (user !== null)
        return <Navigate to="/" />
    return (
        <>
            <nav class="login">
                <div class="login_main1">
                    <form class="form_login" onSubmit={dangnhap}>

                        <p>ĐĂNG NHẬP</p>
                        <div class="login0">
                            <div class="one">
                                <div class="one1">
                                    <div id="tk1"><FontAwesomeIcon icon={faUser} /></div>
                                </div>

                                <div class="one1">
                                    <input value={taiKhoan} onChange={e => setTaiKhoan(e.target.value)} type="text" id="username" name="username" placeholder="Nhập tài khoản" />
                                </div>
                            </div>
                        </div>

                        <div class="login0">
                            <div class="one">
                                <div class="one1">
                                    <div id="tk1"><FontAwesomeIcon icon={faLock} /></div>
                                </div>

                                <div class="one1">
                                    <input value={matkhau} onChange={e => setMatKhau(e.target.value)} type="password" id="password" name="password" placeholder="Nhập mật khẩu" />
                                </div>
                            </div>
                        </div>

                        <div class="login0">
                            <div class="one2">
                                <button type="submit">Đăng nhập</button>
                            </div>
                        </div>

                        <div class="password">
                            <a href="#"><p>Quên mật khẩu?</p></a>
                        </div>
                    </form>
                </div>
            </nav>
        </>
    )
}

export default DangNhap;