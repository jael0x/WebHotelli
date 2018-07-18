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
import models.Usuario;
import java.util.List;

/**
 *
 * @author JAEL ARMAS
 */
@Service
public class UsuarioService{
    @PersistenceContext
    private EntityManager em;
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void create(Usuario usuario) throws ServiceException{
        em.persist(usuario);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public Usuario retrieve(int id) throws ServiceException{
        return em.find(Usuario.class, id);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void update(Usuario usuario) throws ServiceException{
        em.merge(usuario);
    }
    
    @Transactional(rollbackFor = {ServiceException.class})
    public void delete(int id) throws ServiceException{
        em.remove(this.retrieve(id));
    }
    
    //------------------------------------------
        
    @Transactional(rollbackFor = {ServiceException.class})
    public List<Usuario> list() throws ServiceException{
        return em.createNamedQuery("Usuario.findAll").getResultList();
    }
    
}
