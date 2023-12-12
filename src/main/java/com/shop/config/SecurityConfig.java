package com.shop.config;

import com.shop.service.UserService;
import com.shop.service.UserServiceImpl;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
@Configuration
public class SecurityConfig {

    @Bean
    public UserService userService() { return new UserServiceImpl();  }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/layout/**", "/notice/**", "/free/**", "/faq/**", "/contents/**", "/user/**", "/book/**","/login", "/join", "/idCheck", "/emailCheck", "/joinPro").permitAll()
                .antMatchers("/admin/**").hasRole("admin") // "admin" 역할을 가진 사용자에게만 허용
                .mvcMatchers("/", "/plugins/**", "/css/**", "/js/**", "/images/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/auth")
                .usernameParameter("name")
                .passwordParameter("password")
                .defaultSuccessUrl("/")
                .and()
                .logout()
                .logoutUrl("/logout")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/")
                .and()
                //.csrf().disable()
                .cors().disable()
                .sessionManagement()
                .sessionFixation().changeSessionId()
                .maximumSessions(1)
                .expiredSessionStrategy(new CustomSessionExpiredStrategy())
                .maxSessionsPreventsLogin(false)
                .sessionRegistry(sessionRegistry());

        return http.build();
    }


    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList("*"));
        configuration.setAllowedMethods(Arrays.asList("*"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

    @Bean
    public static ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() {
        return new ServletListenerRegistrationBean<>(new HttpSessionEventPublisher());
    }

//    @Bean(name = "uploadPath")
//    public String uploadPath() { // 멀티파트 업로드 디렉토리 지정
//        return "/Users/otaehun/Desktop/team04/team24/src/main/webapp/resources/upload";
//    }
}
