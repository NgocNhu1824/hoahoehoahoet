package group03.bloomresin.config;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.session.security.web.authentication.SpringSessionRememberMeServices;
import org.springframework.web.filter.ForwardedHeaderFilter;

import group03.bloomresin.domain.User;
import group03.bloomresin.service.UserService;
import group03.bloomresin.service.validator.CustomUserDetailsService;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    // ================= Password Encoder =================
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ================= Authentication Provider =================
    @Bean
    public DaoAuthenticationProvider authProvider(PasswordEncoder passwordEncoder) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }

    // ================= Success Handler =================
    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    // ================= Remember-Me Service =================
    @Bean
    public SpringSessionRememberMeServices rememberMeServices() {
        SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();
        rememberMeServices.setAlwaysRemember(true);
        return rememberMeServices;
    }

    // ================= Forwarded Header Filter =================
    @Bean
    public ForwardedHeaderFilter forwardedHeaderFilter() {
        return new ForwardedHeaderFilter();
    }

    // ================= Security Filter Chain =================
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // Không ép HTTPS, Render terminate HTTPS proxy
            .authorizeHttpRequests(authorize -> authorize
                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll()
                .requestMatchers(
                        "/", "/login", "/register", "/client/**", "/css/**", "/js/**", "/images/**", "/upload/**",
                        "/forgotpassword", "/authentication/**", "/product/**", "/products",
                        "/search/**", "/authentication/enterRegisterOTP", "/aboutus", "/voucher/**",
                        "/category/**", "/news/**", "/careservice/**"
                ).permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/employee/**").hasRole("EMPLOYEE")
                .requestMatchers("/customer/**").hasRole("CUSTOMER")
                .anyRequest().authenticated()
            )
            .sessionManagement(session -> session
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                .invalidSessionUrl("/login?expired")
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false)
            )
            .logout(logout -> logout
                .deleteCookies("JSESSIONID")
                .invalidateHttpSession(true)
                .logoutSuccessUrl("/login?logout")
            )
            .rememberMe(r -> r
                .rememberMeServices(rememberMeServices())
            )
            .formLogin(form -> form
                .loginPage("/login")
                .failureHandler(this::handleLoginFailure)
                .successHandler(customSuccessHandler())
                .permitAll()
            )
            .exceptionHandling(ex -> ex
                .accessDeniedPage("/access-deny")
            );

        return http.build();
    }

    // ================= Login Failure Handler =================
    private void handleLoginFailure(HttpServletRequest request, HttpServletResponse response,
                                    org.springframework.security.core.AuthenticationException exception) throws IOException {
        String email = request.getParameter("username");
        User user = userService.getUserByEmail(email).orElse(null);

        if (user != null) {
            if (!user.isStatus()) {
                request.getSession().setAttribute("message", "Your account was banned");
                response.sendRedirect("/login?locked");
            } else {
                response.sendRedirect("/login?error");
            }
        } else {
            response.sendRedirect("/login?error");
        }
    }
}
