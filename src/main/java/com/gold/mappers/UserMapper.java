package com.gold.mappers;

import com.gold.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
    UserVo getUserAccount(String userID);
    void saveUser(UserVo userVO);
    int idCheck(String userID);
    UserVo userLogin(UserVo userVo);
}
