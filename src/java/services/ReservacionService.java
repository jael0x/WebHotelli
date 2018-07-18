/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import javax.persistence.PersistenceContext;
import javax.persistence.EntityManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import models.Reservacion;
import java.util.List;

/**
 *
 * @author JAEL ARMAS
 */
@Service
public class ReservacionService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Reservacion reservacion) throws ServiceException{
        em.persist(reservacion);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Reservacion retrieve(int id) throws ServiceException{
        return em.find(Reservacion.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Reservacion reservacion) throws ServiceException{
        em.merge(reservacion);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Reservacion> list() throws ServiceException{
        return em.createNamedQuery("Reservacion.findAll").getResultList();
    }
    
}
