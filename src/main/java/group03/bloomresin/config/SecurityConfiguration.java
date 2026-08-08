package group03.bloomresin.config;

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
import org.springframework.web.filter.ForwardedHeaderFilter;

import group03.bloomresin.repository.UserLoginLogRepository;
import group03.bloomresin.service.UserService;
import group03.bloomresin.service.validator.CustomUserDetailsService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

        @Autowired
        private UserService userService;

        @Autowired
        private CustomUserDetailsService customUserDetailsService;

        @Autowired
        private UserLoginLogRepository loginLogRepo;

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public DaoAuthenticationProvider authProvider(PasswordEncoder passwordEncoder) {
                DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
                authProvider.setUserDetailsService(customUserDetailsService);
                authProvider.setPasswordEncoder(passwordEncoder);
                authProvider.setHideUserNotFoundExceptions(false);
                return authProvider;
        }

        @Bean
        public AuthenticationSuccessHandler customSuccessHandler() {
                return new CustomSuccessHandler(userService, loginLogRepo);
        }

        @Bean
        public ForwardedHeaderFilter forwardedHeaderFilter() {
                return new ForwardedHeaderFilter();
        }

        @Bean
        public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                http
                        // .requiresChannel(channel -> channel.anyRequest().requiresSecure())
                        .authorizeHttpRequests(authorize -> authorize
                                .requestMatchers("/", "/login", "/register", "/css/**", "/js/**", "/images/**",
                                        "/WEB-INF/**", "/client/**",
                                        "/products", "/product/**", "/category",
                                        "/search", "/news", "/news/**",
                                        "/forgotpassword", "/authentication/**",
                                        "/aboutus", "/about-us", "/contact", "/careservice", "/care-service", "/api/**",
                                        "/upload/**", "/resources/**").permitAll()
                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                .requestMatchers("/employee/**").hasRole("EMPLOYEE")
                                .requestMatchers("/customer/**").hasRole("CUSTOMER")
                                .anyRequest().authenticated()
                        )
                        .csrf(csrf -> csrf.disable())
                        .sessionManagement(session -> session
                                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                                .invalidSessionUrl("/login?expired")
                                .maximumSessions(1)
                                .maxSessionsPreventsLogin(false)
                        )
                        .formLogin(form -> form
                                .loginPage("/login")
                                .successHandler(customSuccessHandler())
                                .permitAll()
                        )
                        .logout(logout -> logout
                                .logoutUrl("/logout")
                                .logoutSuccessUrl("/login?logout")
                                .deleteCookies("JSESSIONID")
                                .invalidateHttpSession(true)
                        )
                        .rememberMe(r -> r
                                .key("bloomresin-remember-me-key")
                                .tokenValiditySeconds(86400 * 7)
                        )
                        .exceptionHandling(ex -> ex
                                .accessDeniedPage("/access-deny")
                        );

                return http.build();
        }
}
