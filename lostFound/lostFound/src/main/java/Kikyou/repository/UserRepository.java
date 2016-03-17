package Kikyou.repository;

/**
 * Created by dwight12 on 2016/3/12.
 */

import Kikyou.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Repository      添加注解
 * @Modifying       说明该方法是修改操作
 * @Transactional   说明该方法是事务性操作
 * @Param           注解用于提取参数
 */

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {

    @Modifying
    @Transactional

    @Query("update UserEntity us set us.nickname=:qNickname, us.firstName=:qFirstName, " +
            "us.lastName=:qLastName, us.password=:qPassword where us.id=:qId")
    void updateUser(
            @Param("qNickname") String nickname,
            @Param("qFirstName") String firstName,
            @Param("qLastName") String qLastName,
            @Param("qPassword") String password,
            @Param("qId") Integer id);

}
