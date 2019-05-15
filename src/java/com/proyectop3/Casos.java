/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.proyectop3;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author josea
 */


public class Casos {
    
    public Casos(){
        
    }
    
    private String idCaso;
    
    public String generarCodigo (String area, Date fechaCreacion){
        String codigo = "";
        
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        String fecha = simpleDateFormat.format(fechaCreacion);
        String fechaN = fecha.substring(0,4) + fecha.substring(5,7) + fecha.substring(8,10);
        Random rnd = new Random();
        int tresDigitos = rnd.nextInt(900)+100;
        
        codigo = area.substring(0,3) + fechaN + Integer.toString(tresDigitos);
        
        return codigo;
    }
    
}
