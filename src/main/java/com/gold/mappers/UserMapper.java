package com.gold.mappers;

import com.gold.user.UserVo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
    UserVo getUserAccount(String userID);
    void saveUser(UserVo userVO);
    public int idCheck(String userID);
    public UserVo userLogin(UserVo userVo);
}
