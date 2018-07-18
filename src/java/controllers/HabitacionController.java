/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import models.Categoria;
import models.Habitacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.CategoriaService;
import services.HabitacionService;
import services.ServiceException;

/**
 *
 * @author JAEL ARMAS
 */

@Controller
@RequestMapping("/habitacion")
public class HabitacionController {
    
    @Autowired
    private HabitacionService service;
    
    @Autowired
    private CategoriaService srvCategoria;
    
    @RequestMapping(value="/list", method= RequestMethod.GET)
    public String list(Model model) throws Exception{
        try{
            List<Habitacion> habitaciones = service.list();
            //Debe ordenarse por numeracion
            model.addAttribute("habitaciones", habitaciones);
            return "habitacion/list";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @ModelAttribute("listEstado")
    protected Map ListEstado() throws Exception {
	Map<String,String> listEstado = new HashMap<String,String>();
	listEstado.put("1", "Disponible");
	listEstado.put("2", "Ocupada");
	listEstado.put("3", "Inhabilitada");
        return listEstado;
    }
    
    @ModelAttribute("listCategoria")
    public List<Categoria> ListCategoria() throws ServiceException {
        return srvCategoria.list();
    }
    
    @RequestMapping(value="/create", method= RequestMethod.GET)
    public String create(Model model){
        try{
            Habitacion habitacion = new Habitacion();
            model.addAttribute("habitacion", habitacion);
            return "habitacion/create";
        }
        catch(Exception ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/create", method= RequestMethod.POST)
    public String create(Model model, @ModelAttribute("habitacion") Habitacion habitacion){
        try{
            int planta = habitacion.getPlanta();
            int number = habitacion.getIntNumeracion();
            if(number<10)
                habitacion.setNumeracion(""+planta+"0"+number);
            else
                habitacion.setNumeracion(""+planta+number);
            
            Categoria categoria = srvCategoria.retrieve(habitacion.getIntCategoria());
            habitacion.setCategoriaId(categoria);
            
            service.create(habitacion);
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
            Habitacion habitacion = service.retrieve(pk);
            model.addAttribute("habitacion", habitacion);
            return "habitacion/retrieve";
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
            Habitacion habitacion = service.retrieve(pk);
            model.addAttribute("habitacion", habitacion);
            return "habitacion/update";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/update", method= RequestMethod.POST)
    public String update(Model model, @ModelAttribute("habitacion") Habitacion formHabitacion){
        try{
            Habitacion habitacion = service.retrieve(formHabitacion.getHabitacionId());
            habitacion.setEstado(formHabitacion.getEstado());
            service.update(habitacion);
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
            Habitacion habitacion = service.retrieve(pk);
            model.addAttribute("habitacion", habitacion);
            return "habitacion/delete";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
    
    @RequestMapping(value="/delete", method= RequestMethod.POST)
    public String delete(Model model, @ModelAttribute("habitacion") Habitacion habitacion){
        try{
            service.delete(habitacion.getHabitacionId());
            return "redirect:list.htm";
        }
        catch(ServiceException ex){
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
