package com.amordemascotas

class Mascota implements Serializable {

    String nombre
    Raza raza
    Date fechaNacimiento
    User user
    Date fechaCreacion = new Date();
    String sexo
    String descripcion

    Mascota(String nombre, Raza raza, Date fechaNacimiento, User user, Date fechaCreacion, String sexo, String descripcion) {
        this.nombre = nombre
        this.raza = raza
        this.fechaNacimiento = fechaNacimiento
        this.user = user
        this.fechaCreacion = fechaCreacion
        this.sexo = sexo
        this.descripcion = descripcion
    }

    static constraints = {
        descripcion (nullable: true)
        raza(unique : ['user', 'nombre', 'sexo', 'fechaNacimiento'])
    }
}
