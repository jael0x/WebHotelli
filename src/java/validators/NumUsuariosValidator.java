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
public class NumUsuariosValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Reservacion.class.isAssignableFrom(type);
    }

    //En Object viene el modelo a ser validado
    @Override //Implementa validaciones
    public void validate(Object o, Errors errors) {
        Reservacion reservacion = (Reservacion) o;

            if (reservacion.getNumUsuarios() < 1) {
                errors.rejectValue("numUsuarios", "required.numUsuarios", "Debe ingresar numero de Usuarios");
            } else if (reservacion.getNumUsuarios() > reservacion.getHabitacionId().getCategoriaId().getMaxUsuarios()) {
                errors.rejectValue("numUsuarios", "required.estatura", "El número de huespedes es mayor del permitido");
            }

    }
}
