/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "phieu_dang_ky")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PhieuDangKy.findAll", query = "SELECT p FROM PhieuDangKy p"),
    @NamedQuery(name = "PhieuDangKy.findByIdPhieudk", query = "SELECT p FROM PhieuDangKy p WHERE p.idPhieudk = :idPhieudk"),
    @NamedQuery(name = "PhieuDangKy.findByIdBs", query = "SELECT p FROM PhieuDangKy p WHERE p.idBs = :idBs"),
    @NamedQuery(name = "PhieuDangKy.findByIdYt", query = "SELECT p FROM PhieuDangKy p WHERE p.idYt = :idYt"),
    @NamedQuery(name = "PhieuDangKy.findByIdBn", query = "SELECT p FROM PhieuDangKy p WHERE p.idBn = :idBn"),
    @NamedQuery(name = "PhieuDangKy.findByTrangThaidky", query = "SELECT p FROM PhieuDangKy p WHERE p.trangThaidky = :trangThaidky"),
    @NamedQuery(name = "PhieuDangKy.findByNgayDky", query = "SELECT p FROM PhieuDangKy p WHERE p.ngayDky = :ngayDky"),
    @NamedQuery(name = "PhieuDangKy.findByNgayHkham", query = "SELECT p FROM PhieuDangKy p WHERE p.ngayHkham = :ngayHkham")})
public class PhieuDangKy implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_phieudk")
    private Integer idPhieudk;
    @Column(name = "id_bs")
    private Integer idBs;
    @Column(name = "id_yt")
    private Integer idYt;
    @Column(name = "id_bn")
    private Integer idBn;
    @Column(name = "trangThai_dky")
    private Short trangThaidky;
    @Column(name = "ngay_dky")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayDky;
    @Column(name = "ngay_hkham")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayHkham;
    @JoinColumn(name = "id_pk", referencedColumnName = "id_phieukham")
    @ManyToOne
    private PhieuKhamBenh idPk;
    @OneToMany(mappedBy = "idPhieudky")
    private Set<HoaDon> hoaDonSet;

    public PhieuDangKy() {
    }

    public PhieuDangKy(Integer idPhieudk) {
        this.idPhieudk = idPhieudk;
    }

    public Integer getIdPhieudk() {
        return idPhieudk;
    }

    public void setIdPhieudk(Integer idPhieudk) {
        this.idPhieudk = idPhieudk;
    }

    public Integer getIdBs() {
        return idBs;
    }

    public void setIdBs(Integer idBs) {
        this.idBs = idBs;
    }

    public Integer getIdYt() {
        return idYt;
    }

    public void setIdYt(Integer idYt) {
        this.idYt = idYt;
    }

    public Integer getIdBn() {
        return idBn;
    }

    public void setIdBn(Integer idBn) {
        this.idBn = idBn;
    }

    public Short getTrangThaidky() {
        return trangThaidky;
    }

    public void setTrangThaidky(Short trangThaidky) {
        this.trangThaidky = trangThaidky;
    }

    public Date getNgayDky() {
        return ngayDky;
    }

    public void setNgayDky(Date ngayDky) {
        this.ngayDky = ngayDky;
    }

    public Date getNgayHkham() {
        return ngayHkham;
    }

    public void setNgayHkham(Date ngayHkham) {
        this.ngayHkham = ngayHkham;
    }

    public PhieuKhamBenh getIdPk() {
        return idPk;
    }

    public void setIdPk(PhieuKhamBenh idPk) {
        this.idPk = idPk;
    }

    @XmlTransient
    public Set<HoaDon> getHoaDonSet() {
        return hoaDonSet;
    }

    public void setHoaDonSet(Set<HoaDon> hoaDonSet) {
        this.hoaDonSet = hoaDonSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idPhieudk != null ? idPhieudk.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PhieuDangKy)) {
            return false;
        }
        PhieuDangKy other = (PhieuDangKy) object;
        if ((this.idPhieudk == null && other.idPhieudk != null) || (this.idPhieudk != null && !this.idPhieudk.equals(other.idPhieudk))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hmh.pojo.PhieuDangKy[ idPhieudk=" + idPhieudk + " ]";
    }
    
}
