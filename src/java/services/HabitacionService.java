/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.Habitacion;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author JAEL ARMAS
 */
@Service
public class HabitacionService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Habitacion habitacion) throws ServiceException{
        em.persist(habitacion);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Habitacion retrieve(int id) throws ServiceException{
        return em.find(Habitacion.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Habitacion habitacion) throws ServiceException{
        em.merge(habitacion);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Habitacion> list() throws ServiceException{
        return em.createNamedQuery("Habitacion.findAll").getResultList();
    }
    
}
