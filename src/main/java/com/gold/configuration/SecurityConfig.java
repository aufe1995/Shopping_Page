package com.gold.configuration;

import com.gold.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@RequiredArgsConstructor
public class SecurityConfig {
    private final UserService userService;
    private final AuthenticationSuccessHandler authenticationSuccessHandler;
    private final AuthenticationFailureHandler authenticationFailureHandler;

    @Bean
    public BCryptPasswordEncoder encryptPassword() {
        return new BCryptPasswordEncoder();
    }


    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(encryptPassword());
    }


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        /*
        csrf 토근 활성화 시 사용
        쿠키 생성할 때 httpOnly 태그를 사용하면 클라이언트 스크립트가 보호된 쿠키에 액세스하는 위험을 줄여 쿠키 보안 강화
         */
        return http
                .csrf().disable() //csrf 토큰 비활성화
                .authorizeRequests() //요청 url 에 따라 접근 권한 설정
                .antMatchers("/","/login**", "/signup", "/resources/**").permitAll() //해당 경로 접근 허용
                .anyRequest()
                .authenticated() //다른 요청은 인증된 유저만 접근 허용
                .and()
                .formLogin()
                .usernameParameter("userID")
                .passwordParameter("userPW")
                .loginPage("/login") //로그인 폼은 해당 주로 페이지 호출
                .loginProcessingUrl("/login/action") //해당 url 로 요청이 오면 스프링 시큐리티가 가로채서 로그인 처리를 한다.
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailureHandler) //성공 및 실패 시 처리 핸들러
                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/home") //로그아웃 시 리턴 url
                .invalidateHttpSession(true) //인증 정보를 지우고 세션 무효화
                .deleteCookies("JSESSIONID","remember-me") //쿠키 삭제
                .permitAll()
                .and()
                .sessionManagement()
                .maximumSessions(1) //세션 최대 허용 수, -1일 경우 무제한 세션 허용
                .maxSessionsPreventsLogin(false) //true 는 중복 로그인 막고, false 는 이전 로그인 세션 해제
                .expiredUrl("/login?error=true&exception=Have been attempted to login from a new place. or session expired") //세션 만료 시 이동 페이지
                .and()
                .and().rememberMe() //로그인 유지
                .alwaysRemember(false) //로그인 항상 유지 여부
                .tokenValiditySeconds(7200) //유지 시간
                .rememberMeParameter("remember-me").and().build();
    }

}
