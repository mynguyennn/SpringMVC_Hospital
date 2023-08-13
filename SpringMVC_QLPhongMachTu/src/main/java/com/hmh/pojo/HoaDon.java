/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "hoa_don")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "HoaDon.findAll", query = "SELECT h FROM HoaDon h"),
    @NamedQuery(name = "HoaDon.findByIdHoadon", query = "SELECT h FROM HoaDon h WHERE h.idHoadon = :idHoadon"),
    @NamedQuery(name = "HoaDon.findByNgayThanhToan", query = "SELECT h FROM HoaDon h WHERE h.ngayThanhToan = :ngayThanhToan"),
    @NamedQuery(name = "HoaDon.findByTienKham", query = "SELECT h FROM HoaDon h WHERE h.tienKham = :tienKham"),
    @NamedQuery(name = "HoaDon.findByTienThuoc", query = "SELECT h FROM HoaDon h WHERE h.tienThuoc = :tienThuoc"),
    @NamedQuery(name = "HoaDon.findByLoaiThanhToan", query = "SELECT h FROM HoaDon h WHERE h.loaiThanhToan = :loaiThanhToan")})
public class HoaDon implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_hoadon")
    private Integer idHoadon;
    @Column(name = "ngay_thanh_toan")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayThanhToan;
    @Column(name = "tien_kham")
    private Long tienKham;
    @Column(name = "tien_thuoc")
    private Long tienThuoc;
    @Size(max = 45)
    @Column(name = "loai_thanh_toan")
    private String loaiThanhToan;
    @JoinColumn(name = "id_phieudky", referencedColumnName = "id_phieudk")
    @ManyToOne
    private PhieuDangKy idPhieudky;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idHd")
    private Set<ChiTietDv> chiTietDvSet;

    public HoaDon() {
    }

    public HoaDon(Integer idHoadon) {
        this.idHoadon = idHoadon;
    }

    public Integer getIdHoadon() {
        return idHoadon;
    }

    public void setIdHoadon(Integer idHoadon) {
        this.idHoadon = idHoadon;
    }

    public Date getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(Date ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    public Long getTienKham() {
        return tienKham;
    }

    public void setTienKham(Long tienKham) {
        this.tienKham = tienKham;
    }

    public Long getTienThuoc() {
        return tienThuoc;
    }

    public void setTienThuoc(Long tienThuoc) {
        this.tienThuoc = tienThuoc;
    }

    public String getLoaiThanhToan() {
        return loaiThanhToan;
    }

    public void setLoaiThanhToan(String loaiThanhToan) {
        this.loaiThanhToan = loaiThanhToan;
    }

    public PhieuDangKy getIdPhieudky() {
        return idPhieudky;
    }

    public void setIdPhieudky(PhieuDangKy idPhieudky) {
        this.idPhieudky = idPhieudky;
    }

    @XmlTransient
    public Set<ChiTietDv> getChiTietDvSet() {
        return chiTietDvSet;
    }

    public void setChiTietDvSet(Set<ChiTietDv> chiTietDvSet) {
        this.chiTietDvSet = chiTietDvSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHoadon != null ? idHoadon.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HoaDon)) {
            return false;
        }
        HoaDon other = (HoaDon) object;
        if ((this.idHoadon == null && other.idHoadon != null) || (this.idHoadon != null && !this.idHoadon.equals(other.idHoadon))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hmh.pojo.HoaDon[ idHoadon=" + idHoadon + " ]";
    }
    
}
