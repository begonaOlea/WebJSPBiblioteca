
package com.biblioteca.model;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;


public class DB {
    
    private static Map<Integer, Libro> libros;
    
    static{
        libros = new HashMap<Integer,Libro>();
        libros.put(1, new Libro(1, "El Guijote", "Miguel de Cervantes", false));
        libros.put(2, new Libro(2, "La Odisea", "Homero", false));
        libros.put(3, new Libro(3, "La Divina Comedia", "Dante", true));
        libros.put(4, new Libro(4, "La vida es Sueño", "Calderón de la Barca", true));
    }
    
    private DB(){}
    
    public static Collection<Libro> getAllLibros(){
        return libros.values();
    }
    
      public static Collection<Libro> getLibrosPrestados(){          
        Set<Libro> prestados = new HashSet<Libro>();  
        for(Libro l: libros.values()){
            if(! l.isDisponible()){
                prestados.add(l);
            }
        }        
        return prestados;
    }
      
      public static void alquilar(int id){          
          libros.get(id).setDisponible(false);
      }    
      
}
