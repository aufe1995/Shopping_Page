package com.gold.service;

import com.gold.mappers.UserMapper;
import com.gold.user.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    @Autowired
    UserMapper userMapper;

    @Transactional
    public void joinUser(UserVO userVo){
        userVo.setUserID(userVo.getUserID());
        userVo.setUserPW(userVo.getUserPW());
        userVo.setUserName(userVo.getUserName());
        userVo.setUserPhone(userVo.getUserPhone());
        userVo.setUserEmail(userVo.getUserEmail());
        userVo.setUserADR(userVo.getUserADR());
        userVo.setUserAuth("USER");
        userMapper.saveUser(userVo);
    }


    @Override
    public UserDetails loadUserByUsername(String userID) throws UsernameNotFoundException {

        UserVO userVO = userMapper.getUserAccount(userID);
        if(userVO == null){
            throw new UsernameNotFoundException("User not authorized.");
        }
        return userVO;
    }
}
