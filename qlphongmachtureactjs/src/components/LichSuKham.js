import App, { MyUserContext } from '../App';
import React, { useContext, useEffect } from 'react';
import { useRef, useState } from "react";
import Apis, { authApi, endpoints } from '../configs/Apis';
import { Link, Navigate, useNavigate, useSearchParams } from 'react-router-dom';
import { Alert, Form, NavItem } from 'react-bootstrap';
import { format } from 'date-fns';
import { Button } from 'bootstrap';
import moment from "moment";


const LichSuKham = (idTk) => {
    const [user, dispath] = useContext(MyUserContext);
    const [dsLSK, setDsLSK] = useState([""]);

    let nav = useNavigate();
    const [q] = useSearchParams();
    idTk = user.idTk;

    const idPDK = dsLSK.idPhieudk;

    useEffect(() => {


        const loadPK = async () => {
            try {
                let { data } = await Apis.get(endpoints['lichsukham'](idTk));
                setDsLSK(data)
            }
            catch (error) {
                console.log("lỗi", error)
            }
        }
        const xoaLichsukham = async () => {
            let idphieuKham = q.get("idphieuKham");
            if (idphieuKham !== null) {
                if (window.confirm("Bạn có chắc chắn muốn Hủy lịch khám bệnh không?")) {
                    let res = await Apis.delete(endpoints['xoaLichsukham'](idphieuKham))
                    nav(`/lichsukham/${user.idTk}`);
                }
            }
        }
        xoaLichsukham();
        loadPK();

    }, [q])









    return (
        <>

            <Form>
                <div class="text-lsk text-lsk111">
                    <p>Lịch sử đăng ký phiếu khám</p>

                </div>
                <main class="table lskham">
                    <div>
                        <section class="table__body lskham1">
                            <table>
                                <thead>
                                    <tr>

                                        {/* <th>Tên bệnh nhân</th> */}


                                        <th>Ngày khám</th>
                                        <th>Ngày tạo phiếu</th>
                                        <th>Thời gian</th>
                                        <th>Trạng thái</th>
                                        {/* <th id="Username">Y tá xác nhận</th> */}
                                        {/* <th id="Username">Bác sĩ khám</th> */}
                                        <th></th>

                                    </tr>
                                </thead>

                                <tbody>
                                    {dsLSK.map(pdk => {
                                        return <>

                                            <tr key={pdk.idPhieudk}>
                                                {/* <td>{pdk.idBs.hoTen}</td> */}

                                                <td>{moment(pdk.chonNgaykham).format("DD-MM-yyyy")}</td>
                                                <td>{moment(pdk.thoiGianTaophieu).format("YYYY-MM-DD HH:mm:ss")}</td>
                                                <td>{pdk.thoiGianKham}</td>
                                                <td>
                                                    {pdk.trangThaidky === 0 ? (
                                                        <p id="xacnhan">Chưa xác nhận</p>
                                                    ) : (
                                                        <p id="xacnhan1">Đã xác nhận</p>
                                                    )}
                                                </td>
                                                {/* <td>{pdk.idRole.hoTen}</td> */}
                                                {/* <td>{pdk.idBn.hoTen}</td> */}
                                                <td>
                                                    <Link to={`/lichsukham/${user.idTk}?idphieuKham=${pdk.idPhieudk}`} type="submit" class="btn_lsk"> Hủy phiếu đăng ký </Link>
                                                </td>
                                            </tr>
                                        </>
                                    })}
                                </tbody>
                            </table>
                        </section>
                    </div>

                </main>
            </Form>
        </>
    )
}

export default LichSuKham;