package com.gold.user;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

@Data
public class UserVo implements UserDetails {
    private String userID;
    private String userPW;
    private String userName;
    private String userPhone;
    private String userEmail;
    private String userADR;
    private String userAuth;

    @Override
    public String getPassword() {
        return this.userPW;
    }

    @Override
    public String getUsername() {
        return this.userID;
    }

    public String getUserName() {
        return this.userName;
    }

    //계정이 갖고있는 권한 목록은 리턴
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection < GrantedAuthority > collectors = new ArrayList<>();
        collectors.add(() -> {
            return "USER";
        });

        return collectors;
    }


    //계정이 만료되지 않았는지 리턴 ( true : 만료 안됨 )
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //계정이 잠겨있는지 리턴 ( true : 잠기지 않음 )
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    //비밀번호가 만료되지 않았는지 리턴 ( true : 만료 안됨 )
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    //계정이 활성화된지 리턴 ( true : 활성화 )
    @Override
    public boolean isEnabled() {
        return true;
    }
}
