package group03.bloomresin.config;

import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import group03.bloomresin.domain.User;
import group03.bloomresin.domain.UserLoginLog;
import group03.bloomresin.repository.UserLoginLogRepository;
import group03.bloomresin.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

    private final UserService userService;
    private final UserLoginLogRepository loginLogRepo;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public CustomSuccessHandler(UserService userService, UserLoginLogRepository loginLogRepo) {
        this.userService = userService;
        this.loginLogRepo = loginLogRepo;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        String email = authentication.getName();
        User user = userService.getUserByEmail(email).orElse(null);

        // Check account status
        if (!user.isStatus()) {
            response.sendRedirect("/login?locked");
            return;
        }

        // Save login log
        UserLoginLog log = new UserLoginLog();
        log.setUser(user);
        log.setLoginTime(LocalDateTime.now());
        loginLogRepo.save(log);

        // Determine target URL based on role
        String targetUrl = determineTargetUrl(authentication);

        // Redirect
        redirectStrategy.sendRedirect(request, response, targetUrl);

        // Clear authentication attributes and set session
        clearAuthenticationAttributes(request, authentication, user);
    }

    protected String determineTargetUrl(final Authentication authentication) {
    Map<String, String> roleTargetUrlMap = new HashMap<>();
    roleTargetUrlMap.put("ROLE_CUSTOMER", "/");
    roleTargetUrlMap.put("ROLE_EMPLOYEE", "/employee/order");
    roleTargetUrlMap.put("ROLE_ADMIN", "/admin/statistics");

    final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
    for (final GrantedAuthority grantedAuthority : authorities) {
        String authorityName = grantedAuthority.getAuthority();
        if (roleTargetUrlMap.containsKey(authorityName)) {
            return roleTargetUrlMap.get(authorityName);
        }
    }
    return "/";
}

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication, User user) {
        HttpSession session = request.getSession(false);
        if (session == null) return;

        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        session.setAttribute("username", user.getEmail());
        session.setAttribute("avatar", user.getAvatar());
        session.setAttribute("id", user.getId());
        session.setAttribute("email", user.getEmail());
        int sum = user.getCart() == null ? 0 : user.getCart().getSum();
        session.setAttribute("sum", sum);
    }
}
