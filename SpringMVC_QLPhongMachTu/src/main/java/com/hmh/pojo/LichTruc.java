/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "lich_truc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LichTruc.findAll", query = "SELECT l FROM LichTruc l"),
    @NamedQuery(name = "LichTruc.findByIdlichTruc", query = "SELECT l FROM LichTruc l WHERE l.idlichTruc = :idlichTruc"),
    @NamedQuery(name = "LichTruc.findByTrangThaitruc", query = "SELECT l FROM LichTruc l WHERE l.trangThaitruc = :trangThaitruc")})
public class LichTruc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_lichTruc")
    private Integer idlichTruc;
    @Column(name = "trangThai_truc")
    private Short trangThaitruc;
    @JoinColumn(name = "id_tk", referencedColumnName = "id_tk")
    @ManyToOne
    private TaiKhoan idTk;
    @OneToMany(mappedBy = "idlichTruc")
    @JsonIgnore
    private Set<ChiTietLichTruc> chiTietLichTrucSet;

    public LichTruc() {
    }

    public LichTruc(Integer idlichTruc) {
        this.idlichTruc = idlichTruc;
    }

    public Integer getIdlichTruc() {
        return idlichTruc;
    }

    public void setIdlichTruc(Integer idlichTruc) {
        this.idlichTruc = idlichTruc;
    }

    public Short getTrangThaitruc() {
        return trangThaitruc;
    }

    public void setTrangThaitruc(Short trangThaitruc) {
        this.trangThaitruc = trangThaitruc;
    }

    public TaiKhoan getIdTk() {
        return idTk;
    }

    public void setIdTk(TaiKhoan idTk) {
        this.idTk = idTk;
    }

    @XmlTransient
    public Set<ChiTietLichTruc> getChiTietLichTrucSet() {
        return chiTietLichTrucSet;
    }

    public void setChiTietLichTrucSet(Set<ChiTietLichTruc> chiTietLichTrucSet) {
        this.chiTietLichTrucSet = chiTietLichTrucSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlichTruc != null ? idlichTruc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LichTruc)) {
            return false;
        }
        LichTruc other = (LichTruc) object;
        if ((this.idlichTruc == null && other.idlichTruc != null) || (this.idlichTruc != null && !this.idlichTruc.equals(other.idlichTruc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hmh.pojo.LichTruc[ idlichTruc=" + idlichTruc + " ]";
    }
    
}
