/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author JAEL ARMAS
 */
@Entity
@Table(name = "reservacion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reservacion.findAll", query = "SELECT r FROM Reservacion r")
    , @NamedQuery(name = "Reservacion.findByReservacionId", query = "SELECT r FROM Reservacion r WHERE r.reservacionId = :reservacionId")
    , @NamedQuery(name = "Reservacion.findByFechaEntrada", query = "SELECT r FROM Reservacion r WHERE r.fechaEntrada = :fechaEntrada")
    , @NamedQuery(name = "Reservacion.findByFechaSalida", query = "SELECT r FROM Reservacion r WHERE r.fechaSalida = :fechaSalida")
    , @NamedQuery(name = "Reservacion.findByNumUsuarios", query = "SELECT r FROM Reservacion r WHERE r.numUsuarios = :numUsuarios")
    , @NamedQuery(name = "Reservacion.findByEstado", query = "SELECT r FROM Reservacion r WHERE r.estado = :estado")})
public class Reservacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "reservacion_id")
    private Integer reservacionId;
    @Column(name = "fecha_entrada")
    @Temporal(TemporalType.DATE)
    private Date fechaEntrada;
    @Column(name = "fecha_salida")
    @Temporal(TemporalType.DATE)
    private Date fechaSalida;
    @Column(name = "num_usuarios")
    private Integer numUsuarios;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estado")
    private int estado;
    @JoinColumn(name = "habitacion_id", referencedColumnName = "habitacion_id")
    @ManyToOne(optional = false)
    private Habitacion habitacionId;
    @JoinColumn(name = "usuario_id", referencedColumnName = "usuario_id")
    @ManyToOne(optional = false)
    private Usuario usuarioId;

    @Transient
    private String strFechaEntrada;

    @Transient
    private String strFechaSalida;

    @Transient
    private int idusuario;

    @Transient
    private int idhabitacion;

    @Transient
    private int idcategoria;

    @Transient
    private String strEstado;

    public String getStrFechaEntrada() {
        return strFechaEntrada;
    }

    public void setStrFechaEntrada(String strFechaEntrada) {
        this.strFechaEntrada = strFechaEntrada;
    }

    public String getStrFechaSalida() {
        return strFechaSalida;
    }

    public void setStrFechaSalida(String strFechaSalida) {
        this.strFechaSalida = strFechaSalida;
    }

    public String getFechaEntradaMostrar() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(fechaEntrada);
    }

    public String getFechaSalidaMostrar() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(fechaSalida);
    }

    public String getStrEstado() {
        switch (this.estado) {
            case 1:
                this.strEstado = "Pendiente";
                break;
            case 2:
                this.strEstado = "En Proceso";
                break;
            case 3:
                this.strEstado = "Finalizada";
                break;
            default:
                this.strEstado = "Sin Estado";
                break;
        }
        return strEstado;
    }

    public void setStrEstado(String strEstado) {
        this.strEstado = strEstado;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public int getIdhabitacion() {
        return idhabitacion;
    }

    public void setIdhabitacion(int idhabitacion) {
        this.idhabitacion = idhabitacion;
    }

    public int getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(int idcategoria) {
        this.idcategoria = idcategoria;
    }

    public Reservacion() {
    }

    public Reservacion(Integer reservacionId) {
        this.reservacionId = reservacionId;
    }

    public Reservacion(Integer reservacionId, int estado) {
        this.reservacionId = reservacionId;
        this.estado = estado;
    }

    public Integer getReservacionId() {
        return reservacionId;
    }

    public void setReservacionId(Integer reservacionId) {
        this.reservacionId = reservacionId;
    }

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public Integer getNumUsuarios() {
        return numUsuarios;
    }

    public void setNumUsuarios(Integer numUsuarios) {
        this.numUsuarios = numUsuarios;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public Habitacion getHabitacionId() {
        return habitacionId;
    }

    public void setHabitacionId(Habitacion habitacionId) {
        this.habitacionId = habitacionId;
    }

    public Usuario getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Usuario usuarioId) {
        this.usuarioId = usuarioId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reservacionId != null ? reservacionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservacion)) {
            return false;
        }
        Reservacion other = (Reservacion) object;
        if ((this.reservacionId == null && other.reservacionId != null) || (this.reservacionId != null && !this.reservacionId.equals(other.reservacionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Reservacion[ reservacionId=" + reservacionId + " ]";
    }

}
