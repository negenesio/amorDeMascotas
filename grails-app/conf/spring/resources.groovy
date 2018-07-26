import amordemascotas.UserEmailUserService
import com.amordemascotas.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(UserEmailUserService){
        grailsApplication = ref('grailsApplication')
    }
}
