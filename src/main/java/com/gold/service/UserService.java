package com.gold.service;

import com.gold.mappers.UserMapper;
import com.gold.user.UserVo;
import lombok.RequiredArgsConstructor;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    @Autowired
    UserMapper userMapper;

    public int idCheck(String userID) throws Exception {
        int result = userMapper.idCheck(userID);
        return result;
    }

    @Transactional
    public void joinUser(@NotNull UserVo userVo){
        userVo.setUserID(userVo.getUserID());
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        userVo.setUserPW(passwordEncoder.encode(userVo.getPassword()));
        userVo.setUserName(userVo.getUserName());
        userVo.setUserMail(userVo.getUserMail());
        userVo.setUserZIP(userVo.getUserZIP());
        userVo.setUserADR(userVo.getUserADR());
        userVo.setUserDADR(userVo.getUserDADR());
        userMapper.saveUser(userVo);
    }


    @Override
    public UserDetails loadUserByUsername(String userID) throws UsernameNotFoundException {

        UserVo userVo = userMapper.getUserAccount(userID);

        if (userVo == null) throw new UsernameNotFoundException("Not Found account.");

        return userVo;
    }

    public UserVo userLogin(UserVo user) throws Exception{

        return userMapper.userLogin(user);
    }
}
