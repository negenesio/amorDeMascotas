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
    String name
    String email
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
        name nullable: false, blank: false
        email nullable: false, blank: false
        fechaNacimiento nullable: false, blank: false
    }

    static mapping = {
	    password column: '`password`'
    }

    User(String username, String password, String name, String email, Date fechaNacimiento) {
        this()
        this.username = username
        this.password = password
        this.name = name
        this.email = email
        this.fechaNacimiento = fechaNacimiento
        this.fechaCreacion = new Date()
    }
}
