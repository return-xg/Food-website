package com.food.recipe.mapper;

import java.util.List;
import com.food.recipe.domain.Likes;
import com.food.recipe.domain.Recipe;
import org.apache.ibatis.annotations.Param;

/**
 * 点赞Mapper接口
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
public interface LikesMapper 
{
    /**
     * 查询点赞
     * 
     * @param likeId 点赞主键
     * @return 点赞
     */
    public Likes selectLikesByLikeId(Long likeId);

    /**
     * 查询点赞列表
     * 
     * @param likes 点赞
     * @return 点赞集合
     */
    public List<Likes> selectLikesList(Likes likes);

    /**
     * 新增点赞
     * 
     * @param likes 点赞
     * @return 结果
     */
    public int insertLikes(Likes likes);

    /**
     * 更新点赞数
     * @return
     */
    public int updateRecipeLikes();

    /**
     * 取消点赞
     *
     * @param likes
     * @return
     */
    public int delete(Likes likes);

    /**
     * 查询用户是否已经点赞
     * @param userId
     * @param recipeId
     * @return
     */
    public int likeSelect(@Param("userId") Long userId, @Param("recipeId") Long recipeId);

    /**
     * 修改点赞
     * 
     * @param likes 点赞
     * @return 结果
     */
    public int updateLikes(Likes likes);

    /**
     * 删除点赞
     * 
     * @param likeId 点赞主键
     * @return 结果
     */
    public int deleteLikesByLikeId(Long likeId);

    /**
     * 批量删除点赞
     * 
     * @param likeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLikesByLikeIds(Long[] likeIds);

    /**
     * 根据用户ID查询用户喜欢列表
     * @param userId
     * @return
     */
    public List<Recipe> listUserId(Long userId);
}
