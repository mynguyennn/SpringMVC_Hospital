import cookie from "react-cookies";


const MyUserReducer = (currentState, action) => {

    switch (action.type) {
        case "dangnhap":
            return action.payload;
        case "dangxuat":
            cookie.remove("token");
            cookie.remove("user ");
            // cookie.remove("taikhoan");
            return null;
        default:
            return currentState;
    }

}

export default MyUserReducer;