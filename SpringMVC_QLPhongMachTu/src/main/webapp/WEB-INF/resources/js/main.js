function xoaTaiKhoan(path) {
    if (confirm("Bạn chắc chắn muốn xóa Tài Khoản này không? Nếu xóa tài khoản này sẽ xóa toàn bộ dữ liệu liên quan!") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Xóa không thành công!");
        })
    }

}


function xoaLsPhieuDky(path) {
    if (confirm("Bạn chắc chắn muốn Hủy lịch đăng ký không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Hủy không thành công!");
        })
    }

}


function xoaLichTruc(path) {
    if (confirm("Bạn chắc chắn muốn xóa lịch trực này không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Xóa không thành công!");
        })
    }

}


function xoaBillThuoc(path) {
    if (confirm("Bạn chắc chắn muốn xóa Thuốc này không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Xóa không thành công!");
        })
    }

}


