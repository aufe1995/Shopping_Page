package com.gold.service;

import com.gold.mappers.UserMapper;
import com.gold.user.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class UserService {

    @Autowired
    UserMapper userMapper;

    @Transactional
    public void joinUser(UserVO userVo){
        userVo.setUserID(userVo.getUserID());
        userVo.setUserPW(userVo.getUserPW());
        userVo.setUserName(userVo.getUserName());
        userVo.setUserPhone(userVo.getUserPhone());
        userVo.setUserRRN(userVo.getUserRRN());
        userVo.setUserEmail(userVo.getUserEmail());
        userVo.setUserADR(userVo.getUserADR());
        userMapper.saveUser(userVo);
    }

}
