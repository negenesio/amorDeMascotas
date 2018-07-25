package amordemascotas

import com.amordemascotas.Role
import com.amordemascotas.User
import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.transaction.Transactional
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UsernameNotFoundException

class UserEmailUserService extends GormUserDetailsService{

    UserDetails loadUserByUsername(String username, boolean loadRoles)
            throws UsernameNotFoundException {
        return loadUserByUsername(username)
    }

    @Transactional
    UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //enable login with either username or password
        User user = User.findByUsernameOrEmail(username, username)

        if (!user) throw new UsernameNotFoundException('User not found', username)
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.username, user.getPassword(),
                user.enabled, !user.accountExpired, !user.passwordExpired, !user.accountLocked, getAuthorities(user.getAuthorities()))
        Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities())
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return userDetails
    }

    public static List<GrantedAuthority> getAuthorities(Set<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>()
        roles?.each { role ->
            authorities.add(new SimpleGrantedAuthority(role.authority))
        }
        return authorities
    }
}