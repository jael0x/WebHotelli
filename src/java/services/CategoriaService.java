/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.Categoria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author JAEL ARMAS
 */
@Service
public class CategoriaService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Categoria categoria) throws ServiceException{
        em.persist(categoria);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Categoria retrieve(int id) throws ServiceException{
        return em.find(Categoria.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Categoria categoria) throws ServiceException{
        em.merge(categoria);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Categoria> list() throws ServiceException{
        return em.createNamedQuery("Categoria.findAll").getResultList();
    }
    
}
