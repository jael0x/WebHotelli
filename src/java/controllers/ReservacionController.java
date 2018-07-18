/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Comparator;
import java.util.List;
import models.Categoria;
import models.Habitacion;
import models.Reservacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.HabitacionService;
import services.ReservacionService;
import services.ServiceException;

/**
 *
 * @author JAEL ARMAS
 */
@Controller
@RequestMapping("/reservacion")
public class ReservacionController {

    @Autowired
    private ReservacionService service;

    @Autowired
    private HabitacionService srvHabitacion;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model) {
        try {
            List<Reservacion> reservaciones = service.list();
            model.addAttribute("reservaciones", reservaciones);
            return "reservacion/list";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @ModelAttribute("listHabitaciones")
    public List<Habitacion> ListHabitacion() throws ServiceException {
        return srvHabitacion.list();
    }

//    @ModelAttribute("listPlantas")
//    public List<Habitacion> ListHabitacion() throws ServiceException {
//        List<Habitacion> habitaciones = srvHabitacion.list();
//        habitaciones.sort(Comparator.comparing(Habitacion::getPlanta));
//        int max = habitaciones.
//        List<int> plantas = 
//        return srvHabitacion.list();
//    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(Model model) {
        try {
            Reservacion reservacion = new Reservacion();
            model.addAttribute("reservacion", reservacion);
            return "reservacion/create";
        } catch (Exception ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Model model, @ModelAttribute("reservacion") Reservacion reservacion) {
        try {
            service.create(reservacion);
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/retrieve/{id}", method = RequestMethod.GET)
    public String retrieve(Model model, @PathVariable String id) {
        try {
            int pk = Integer.parseInt(id);
            Reservacion reservacion = service.retrieve(pk);
            model.addAttribute("reservacion", reservacion);
            return "reservacion/retrieve";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String update(Model model, @PathVariable String id) {
        try {
            int pk = Integer.parseInt(id);
            Reservacion reservacion = service.retrieve(pk);
            model.addAttribute("reservacion", reservacion);
            return "reservacion/update";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Model model, @ModelAttribute("reservacion") Reservacion reservacion) {
        try {
            service.update(reservacion);
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(Model model, @PathVariable String id) {
        try {
            int pk = Integer.parseInt(id);
            Reservacion reservacion = service.retrieve(pk);
            model.addAttribute("reservacion", reservacion);
            return "reservacion/delete";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(Model model, @ModelAttribute("reservacion") Reservacion reservacion) {
        try {
            service.delete(reservacion.getReservacionId());
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
