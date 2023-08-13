/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hmh.pojo;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "chi_tiet_lich_truc")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChiTietLichTruc.findAll", query = "SELECT c FROM ChiTietLichTruc c"),
    @NamedQuery(name = "ChiTietLichTruc.findByIdctLichTruc", query = "SELECT c FROM ChiTietLichTruc c WHERE c.idctLichTruc = :idctLichTruc")})
public class ChiTietLichTruc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_ctLichTruc")
    private Integer idctLichTruc;
    @JoinColumn(name = "id_lich_Truc", referencedColumnName = "id_lichTruc")
    @ManyToOne
    private LichTruc idlichTruc;
    @JoinColumn(name = "id_thoiGian_Truc", referencedColumnName = "id_tgTruc")
    @ManyToOne
    private ThoiGianTruc idthoiGianTruc;

    public ChiTietLichTruc() {
    }

    public ChiTietLichTruc(Integer idctLichTruc) {
        this.idctLichTruc = idctLichTruc;
    }

    public Integer getIdctLichTruc() {
        return idctLichTruc;
    }

    public void setIdctLichTruc(Integer idctLichTruc) {
        this.idctLichTruc = idctLichTruc;
    }

    public LichTruc getIdlichTruc() {
        return idlichTruc;
    }

    public void setIdlichTruc(LichTruc idlichTruc) {
        this.idlichTruc = idlichTruc;
    }

    public ThoiGianTruc getIdthoiGianTruc() {
        return idthoiGianTruc;
    }

    public void setIdthoiGianTruc(ThoiGianTruc idthoiGianTruc) {
        this.idthoiGianTruc = idthoiGianTruc;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idctLichTruc != null ? idctLichTruc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietLichTruc)) {
            return false;
        }
        ChiTietLichTruc other = (ChiTietLichTruc) object;
        if ((this.idctLichTruc == null && other.idctLichTruc != null) || (this.idctLichTruc != null && !this.idctLichTruc.equals(other.idctLichTruc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.hmh.pojo.ChiTietLichTruc[ idctLichTruc=" + idctLichTruc + " ]";
    }
    
}
