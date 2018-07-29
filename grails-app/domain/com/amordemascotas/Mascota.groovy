package com.amordemascotas

class Mascota {

    String nombre
    Raza raza
    Date fechaNacimiento
    User user
    Date fechaCreacion = new Date();
    String sexo
    String descripcion

    static constraints = {
        descripcion (nullable: true)
    }
}
