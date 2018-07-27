package com.dcm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.dcm.repository.UsersRepository;
import com.dcm.service.CustomUserDetailsService;



@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableWebSecurity
@EnableJpaRepositories(basePackageClasses = UsersRepository.class)
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
    private CustomUserDetailsService userDetailsService;
	
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService).passwordEncoder(getPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/**").authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/")
                .and()
            .logout()                                    
                .permitAll()
        .and()
        .exceptionHandling().accessDeniedPage("/accessDenied");
    }
    
 
    private PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
            	System.out.println("Encode: "+charSequence);
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
            	System.out.println("Matches: "+charSequence);
            	System.out.println("Matches: "+s);
//            	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//            	String hashedPassword = passwordEncoder.encode(charSequence);
//            	System.out.println("Matches: "+hashedPassword);
            	if(charSequence.equals(s))
                    return true;
            	else
            		return false;
            }
        };
    }
}