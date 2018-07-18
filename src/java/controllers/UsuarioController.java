/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;
import models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.UsuarioService;
import services.ServiceException;

/**
 *
 * @author JAEL ARMAS
 */

@Controller
@RequestMapping("/usuario")
public class UsuarioController {
    
    @Autowired
    private UsuarioService service;
    
    @RequestMapping(value="/list", method= RequestMethod.GET)
    public String list(Model model){
        try{
            List<Usuario> usuarios = service.list();
            model.addAttribute("usuarios", usuarios);
            return "usuario/list";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/create", method= RequestMethod.GET)
    public String create(Model model){
        try{
            Usuario usuario = new Usuario();
            model.addAttribute("usuario", usuario);
            return "usuario/create";
        }
        catch(Exception ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/create", method= RequestMethod.POST)
    public String create(Model model, @ModelAttribute("usuario") Usuario usuario){
        try{
            service.create(usuario);
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/retrieve/{id}", method= RequestMethod.GET)
    public String retrieve(Model model, @PathVariable String id){
        try{
            int pk = Integer.parseInt(id);
            Usuario usuario = service.retrieve(pk);
            model.addAttribute("usuario", usuario);
            return "usuario/retrieve";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value="/update/{id}", method= RequestMethod.GET)
    public String update(Model model, @PathVariable String id){
        try{
            int pk = Integer.parseInt(id);
            Usuario usuario = service.retrieve(pk);
            model.addAttribute("usuario", usuario);
            return "usuario/update";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/update", method= RequestMethod.POST)
    public String update(Model model, @ModelAttribute("usuario") Usuario usuario){
        try{
            service.update(usuario);
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/delete/{id}", method= RequestMethod.GET)
    public String delete(Model model, @PathVariable String id){
        try{
            int pk = Integer.parseInt(id);
            Usuario usuario = service.retrieve(pk);
            model.addAttribute("usuario", usuario);
            return "usuario/delete";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/delete", method= RequestMethod.POST)
    public String delete(Model model, @ModelAttribute("usuario") Usuario usuario){
        try{
            service.delete(usuario.getUsuarioId());
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
