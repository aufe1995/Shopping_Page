package com.gold.mappers;

import com.gold.user.UserVO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
    UserVO getUserAccount(String userId);
    void saveUser(UserVO userVO);
}
