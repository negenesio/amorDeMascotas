package com.amordemascotas

class Encuentros {

    String status;
    Date fechaCreacion = new Date();
    Date fechaModificacion = new Date();
    Mascota mascotaOwner;
    Mascota mascotaFind;
    User userOwner;
    User userFind;

    static constraints = {
    }
}
