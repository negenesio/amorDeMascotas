package com.amordemascotas

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    String username
    String password
    String nombre
    String apellido
    Date fechaNacimiento
    Date fechaCreacion
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this) as List<UserRole>)*.role as Set<Role>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        nombre nullable: false, blank: false
        apellido nullable: false, blank: false
        fechaNacimiento nullable: false, blank: false
    }

    static mapping = {
	    password column: '`password`'
    }

    User(String username, String password, String nombre, String apellido, Date fechaNacimiento) {
        this()
        this.username = username
        this.password = password
        this.nombre = nombre
        this.apellido = apellido
        this.fechaNacimiento = fechaNacimiento
        this.fechaCreacion = new Date()
    }
}
