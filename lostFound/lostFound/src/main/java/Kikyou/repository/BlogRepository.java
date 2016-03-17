package Kikyou.repository;

import Kikyou.model.BlogEntity;
import Kikyou.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

/**
 * Created by dwight12 on 2016/3/17.
 */
@Repository
public interface BlogRepository extends JpaRepository<BlogEntity, Integer> {

    @Modifying
    @Transactional

    @Query("update BlogEntity bl set bl.title=:qTitle, bl.content=:qContent, " +
            "bl.pubDate=:qPubDate, bl.userByUserId=:qUserByUserId where bl.id=:qId")
    void updateBlog(
            @Param("qTitle") String title,
            @Param("qContent") String content,
            @Param("qPubDate") Date pubDate,
            @Param("qUserByUserId") UserEntity userByUserId,
            @Param("qId") Integer id);

}

