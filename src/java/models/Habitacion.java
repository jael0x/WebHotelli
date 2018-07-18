/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import java.util.List;
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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author JAEL ARMAS
 */
@Entity
@Table(name = "habitacion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Habitacion.findAll", query = "SELECT h FROM Habitacion h")
    , @NamedQuery(name = "Habitacion.findByHabitacionId", query = "SELECT h FROM Habitacion h WHERE h.habitacionId = :habitacionId")
    , @NamedQuery(name = "Habitacion.findByPlanta", query = "SELECT h FROM Habitacion h WHERE h.planta = :planta")
    , @NamedQuery(name = "Habitacion.findByNumeracion", query = "SELECT h FROM Habitacion h WHERE h.numeracion = :numeracion")
    , @NamedQuery(name = "Habitacion.findByEstado", query = "SELECT h FROM Habitacion h WHERE h.estado = :estado")})
public class Habitacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "habitacion_id")
    private Integer habitacionId;
    @Column(name = "planta")
    private Integer planta;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4)
    @Column(name = "numeracion")
    private String numeracion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "estado")
    private int estado;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "habitacionId")
    private List<Reservacion> reservacionList;
    @JoinColumn(name = "categoria_id", referencedColumnName = "categoria_id")
    @ManyToOne(optional = false)
    private Categoria categoriaId;
    
    @Transient
    private int intNumeracion;
    
    @Transient
    private int intCategoria;
    
    @Transient
    private String strEstado;

    public int getIntNumeracion() {
        return intNumeracion;
    }

    public void setIntNumeracion(int intNumeracion) {
        this.intNumeracion = intNumeracion;
    }

    public int getIntCategoria() {
        return intCategoria;
    }

    public void setIntCategoria(int intCategoria) {
        this.intCategoria = intCategoria;
    }

    public String getStrEstado() {
        switch (this.estado){
            case 1:
                this.strEstado = "Disponible";
                    break;
            case 2:
                this.strEstado = "Ocupada";
                    break;
            case 3:
                this.strEstado = "Inhabilitada";
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

    public Habitacion() {
    }

    public Habitacion(Integer habitacionId) {
        this.habitacionId = habitacionId;
    }

    public Habitacion(Integer habitacionId, String numeracion, int estado) {
        this.habitacionId = habitacionId;
        this.numeracion = numeracion;
        this.estado = estado;
    }

    public Integer getHabitacionId() {
        return habitacionId;
    }

    public void setHabitacionId(Integer habitacionId) {
        this.habitacionId = habitacionId;
    }

    public Integer getPlanta() {
        return planta;
    }

    public void setPlanta(Integer planta) {
        this.planta = planta;
    }

    public String getNumeracion() {
        return numeracion;
    }

    public void setNumeracion(String numeracion) {
        this.numeracion = numeracion;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<Reservacion> getReservacionList() {
        return reservacionList;
    }

    public void setReservacionList(List<Reservacion> reservacionList) {
        this.reservacionList = reservacionList;
    }

    public Categoria getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(Categoria categoriaId) {
        this.categoriaId = categoriaId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (habitacionId != null ? habitacionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Habitacion)) {
            return false;
        }
        Habitacion other = (Habitacion) object;
        if ((this.habitacionId == null && other.habitacionId != null) || (this.habitacionId != null && !this.habitacionId.equals(other.habitacionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Habitacion[ habitacionId=" + habitacionId + " ]";
    }
    
}
