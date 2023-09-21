import '../css/css.css';
import App, { MyUserContext } from '../App';
import React, { useContext } from 'react';
import Apis, { endpoints } from '../configs/Apis';
import { Link } from 'react-router-dom';



const Header = () => {

    const [user, dispath] = useContext(MyUserContext);


    const dangxuat = () => {
        dispath({
            "type": "dangxuat"
        })

    }

    return (
        <>
            <div class="containerr">
                <header>
                    <a href="/" class="logo">
                        <h3>Health couch.</h3>
                    </a>

                    <div class="navbar">
                        <ul class="list">



                            {user !== null ?
                                <>
                                    <li class="tab1">
                                        <div class="avt_user">
                                            <img src={user.avt} alt="" />
                                        </div>
                                    </li>
                                    <li class="tab1"><a href="#">Xin chào, {user.hoTen}!</a></li>
                                    <Link to="/dangkykhamapi"><li class="tab">Đăng ký khám bệnh</li></Link>
                                    <Link to={`/lichsukham/${user.idTk}`}><li class="tab">Lịch sử khám bệnh</li></Link>
                                    <Link to="/doimatkhau"><li class="tab">Đổi mật khẩu</li></Link>
                                    <Link onClick={dangxuat} to="/"><li class="tab">Đăng xuất</li></Link>
                                </> :
                                <>
                                    <Link to="/dangnhap"><li class="tab">Đăng nhập</li></Link>
                                    <Link to="/dangky"><li class="tab">Đăng ký</li></Link>
                                </>
                            }













                            {/* <li class="tab"><a href="">Lịch sử khám bệnh</a></li> */}

                            {/* <li class="tab"><a href="">Lập danh sách khám</a></li> */}


                            {/* <li class="tab"><a href="">Lập phiếu khám bệnh</a></li> */}

                            {/* <li class="tab"><a href="">Đổi mật khẩu</a></li> */}




                        </ul>
                    </div>
                </header>
            </div >
        </>
    )
}

export default Header;