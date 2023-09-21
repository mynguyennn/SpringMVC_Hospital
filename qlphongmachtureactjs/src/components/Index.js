import '../css/css.css';
import App from '../App';
import React from 'react';
import ImagesIndex from '../image/banner_img.png';



const Index = () => {


    return (
        <>
            <nav className="index">
                <div className="title">
                    <div>
                        <h3>BỆNH VIỆN CAO CẤP CHUẨN 5 SAO HÀNG ĐẦU VIỆT NAM</h3>
                        <p>
                            Hệ thống Bệnh Viện Health Couch là địa chỉ uy tín về khám chữa bệnh, với đội ngũ chuyên gia bác sĩ hàng đầu,
                            trang thiết bị hiện đại, cùng các phác đồ điều trị hiệu quả, khoa học mang đến dịch vụ khám, điều trị,
                            chăm sóc sức khỏe cao cấp, toàn diện với chi phí hợp lý.
                        </p>
                        <a href="/dangnhap">
                            <button>ĐĂNG KÝ KHÁM</button>
                        </a>
                    </div>
                    <div>
                        <img src={ImagesIndex} alt="alert" />
                    </div>
                </div>
            </nav>
        </>
    )
}

export default Index;