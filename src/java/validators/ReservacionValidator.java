/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import models.Reservacion;
import org.springframework.validation.ValidationUtils;

/**
 *
 *
 * @author JAEL ARMAS
 */
public class ReservacionValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Reservacion.class.isAssignableFrom(type);
    }

    //En Object viene el modelo a ser validado
    @Override //Implementa validaciones
    public void validate(Object o, Errors errors) {
        Reservacion reservacion = (Reservacion) o;

        if (reservacion.getIdhabitacion() == 0) {
            errors.rejectValue("idhabitacion", "required.idhabitacion", "Seleccione una habitación");
        }

        if (reservacion.getIdusuario() == 0) {
            errors.rejectValue("idusuario", "required.idusuario", "Seleccione un Usuario");
        }

        try {
            //Fecha Entrada, Salida
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Calendar fechaEntrada = Calendar.getInstance();
            Calendar fechaSalida = Calendar.getInstance();
            Date fechaActual = new Date();

            if (!reservacion.getStrFechaEntrada().isEmpty()) {
                fechaEntrada.setTime(format.parse(reservacion.getStrFechaEntrada()));
            } else {
                fechaEntrada.setTime(fechaActual);
            }

            //Pendiente, Alojamiento, Finalizada
            if (!reservacion.getStrFechaSalida().isEmpty()) {
                
                fechaSalida.setTime(format.parse(reservacion.getStrFechaSalida()));
                if (fechaSalida.getTime().after(fechaEntrada.getTime())) {
                    
                    if (fechaEntrada.getTime().after(fechaActual)) {
                        reservacion.setEstado(1); //Pendiente
                    } else {
                        
                        if (fechaSalida.getTime().after(fechaActual)) {
                            reservacion.setEstado(2); //Alojamiento
                        } else {
                            reservacion.setEstado(3); //Finalizada
                        }
                        
                    }
                    
                } else {
                    errors.rejectValue("strFechaSalida", "required.strFechaSalida", "La fecha de salida debe ser antes que la de entrada");
                }
            } else {
                fechaSalida.setTime(fechaEntrada.getTime());
                fechaSalida.add(Calendar.DATE, 1);
                if (fechaEntrada.getTime().after(fechaActual)) {
                    reservacion.setEstado(1); //Pendiente
                } else {
                    reservacion.setEstado(3); //Finalizada
                }
            }

            reservacion.setFechaEntrada(fechaEntrada.getTime());
            reservacion.setFechaSalida(fechaSalida.getTime());

        } catch (ParseException ex) {
//            errors.rejectValue("strFecha", "required.strFecha","");
            System.out.println(ex);
            System.out.println("La fecha está mal");
        }

    }
}
