import { BrowserRouter, Route, Routes } from "react-router-dom";
import Index from "./components/Index";
import DangNhap from "./components/DangNhap";
import './App.css'
import Footer from "./layout/Footer";
import Header from "./layout/Header";
import DangKy from "./components/DangKy";
import DangKyKham from "./components/DangKyKham";
import { createContext, useReducer } from "react";
import MyUserReducer from "./reducers/MyUserReducer";
import cookie from "react-cookies";
import DoiMatKhau from "./components/DoiMatKhau";
import LichSuKham from "./components/LichSuKham";


export const MyUserContext = createContext();

const App = () => {

  const [user, dispath] = useReducer(MyUserReducer, cookie.load("user") || null);

  return (
    <MyUserContext.Provider value={[user, dispath]}>
      <BrowserRouter>
        <Header />
        <Routes>
          <Route path="/" element={<Index />} />
          <Route path="/dangnhap" element={<DangNhap />} />
          <Route path="/dangky" element={<DangKy />} />
          <Route path="/dangkykhamapi" element={<DangKyKham />} />
          <Route path="/doimatkhau" element={<DoiMatKhau />} />
          <Route path="/lichsukham/:idTk" element={<LichSuKham />} />
        </Routes>
        <Footer />
      </BrowserRouter>
    </MyUserContext.Provider>
  )
}
export default App;