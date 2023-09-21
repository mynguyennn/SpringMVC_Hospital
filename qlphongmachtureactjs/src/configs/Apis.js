import axios from "axios";
import cookie from "react-cookies";



const SERVER_CONTEXT = "/SpringMVC_QLPhongMachTu";
const SERVER = "http://localhost:8080";

export const endpoints = {
    "dangnhap": `${SERVER_CONTEXT}/api/dangnhap/`,
    "current-user": `${SERVER_CONTEXT}/api/current-user/`,
    "dangky": `${SERVER_CONTEXT}/api/dangky/`,
    "doimatkhau": `${SERVER_CONTEXT}/api/doimatkhau/`,
    "dangkykhamapi": `${SERVER_CONTEXT}/api/dangkykhamapi/`,
    "lichsukham": (idTk) => `${SERVER_CONTEXT}/api/lichsukham/${idTk}`,
    "xoaLichsukham": (id) => `${SERVER_CONTEXT}/api/lichsukham/${id}`,

}

export const authApi = () => {
    return axios.create({
        baseURL: SERVER,
        headers: {
            "Authorization": cookie.load("token")
        }
    })
}

export default axios.create({
    baseURL: SERVER
})