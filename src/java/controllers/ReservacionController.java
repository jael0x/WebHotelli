/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import models.Categoria;
import models.Habitacion;
import models.Reservacion;
import models.Usuario;
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
import services.UsuarioService;

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

    @Autowired
    private UsuarioService srvUsuario;

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

    @ModelAttribute("listUsuario")
    public List<Usuario> ListUsuario() throws ServiceException {
        return srvUsuario.list();
    }

    @ModelAttribute("listHabitaciones")
    public List<Habitacion> ListHabitacion() throws ServiceException {
        List<Habitacion> habitaciones = srvHabitacion.list();
        Comparator<Habitacion> comp = Comparator.comparing(Habitacion::getPlanta);
        comp = comp.thenComparing(habitacion -> habitacion.getCategoriaId().getCategoriaId());
        comp = comp.thenComparing(Habitacion::getEstado);
        comp = comp.thenComparing(Habitacion::getNumeracion);
        habitaciones.sort(comp);
        return habitaciones;
    }

    @ModelAttribute("listPlantas")
    public List<Integer> ListPlantas() throws ServiceException {
        List<Habitacion> habitaciones = ListHabitacion();
        habitaciones.sort(Comparator.comparing(Habitacion::getPlanta));
        Optional<Habitacion> maxHabitacion = habitaciones.stream().max(Comparator.comparing(Habitacion::getPlanta));
        int maxPlanta = maxHabitacion.get().getPlanta();
        List<Integer> plantas = new ArrayList<Integer>();
        for (int i = 1; i <= maxPlanta; i++) {
            plantas.add(i);
        }
        return plantas;
    }

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
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar fechaEntrada = Calendar.getInstance();
            Calendar fechaSalida = Calendar.getInstance();
            Date fechaActual = new Date();
            if (!reservacion.getStrFechaEntrada().isEmpty()) {
                fechaEntrada.setTime(format.parse(reservacion.getStrFechaEntrada()));
            } else {
                fechaEntrada.setTime(fechaActual);
            }

            //Pendiente, En Proceso, Finalizada
            if (!reservacion.getStrFechaSalida().isEmpty()) {
                fechaSalida.setTime(format.parse(reservacion.getStrFechaSalida()));
                if (fechaEntrada.getTime().after(fechaActual)) {
                    reservacion.setEstado(1);
                } else {
                    if (fechaSalida.getTime().after(fechaActual)) {
                        reservacion.setEstado(2);
                    } else {
                        reservacion.setEstado(3);
                    }
                }
            } else {
                fechaSalida.setTime(fechaEntrada.getTime());
                if (fechaEntrada.getTime().after(fechaActual)) {
                    reservacion.setEstado(1);
                } else {
                    reservacion.setEstado(3);
                }
            }

            reservacion.setFechaEntrada(fechaEntrada.getTime());
            reservacion.setFechaSalida(fechaSalida.getTime());

            Usuario usuario = srvUsuario.retrieve(reservacion.getIdusuario());
            Habitacion habitacion = srvHabitacion.retrieve(reservacion.getIdhabitacion());
            reservacion.setHabitacionId(habitacion);
            reservacion.setUsuarioId(usuario);

            switch (reservacion.getEstado()) {
                case 1:
                    habitacion.setEstado(1);
                    break;
                case 2:
                    habitacion.setEstado(2);
                    break;
                case 3:
                    habitacion.setEstado(1);
                    break;
            }
            
            srvHabitacion.update(habitacion);
            service.create(reservacion);
            return "redirect:list.htm";
        } catch (ParseException | ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/retrieve/{id}", method = RequestMethod.GET)
    public String retrieve(Model model,
            @PathVariable String id
    ) {
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
    public String update(Model model,
            @PathVariable String id
    ) {
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
    public String update(Model model,
            @ModelAttribute("reservacion") Reservacion reservacion
    ) {
        try {
            service.update(reservacion);
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(Model model,
            @PathVariable String id
    ) {
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
    public String delete(Model model,
            @ModelAttribute("reservacion") Reservacion reservacion
    ) {
        try {
            service.delete(reservacion.getReservacionId());
            return "redirect:list.htm";
        } catch (ServiceException ex) {
            model.addAttribute("message", ex.getMessage());
            return "error";
        }
    }
}
