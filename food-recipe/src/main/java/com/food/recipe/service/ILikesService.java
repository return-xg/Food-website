package com.food.recipe.service;

import java.util.List;
import com.food.recipe.domain.Likes;
import com.food.recipe.domain.Recipe;

/**
 * 点赞Service接口
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
public interface ILikesService 
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
     * 修改点赞
     * 
     * @param likes 点赞
     * @return 结果
     */
    public int updateLikes(Likes likes);

    /**
     * 批量删除点赞
     * 
     * @param likeIds 需要删除的点赞主键集合
     * @return 结果
     */
    public int deleteLikesByLikeIds(Long[] likeIds);

    /**
     * 删除点赞信息
     * 
     * @param likeId 点赞主键
     * @return 结果
     */
    public int deleteLikesByLikeId(Long likeId);

    /**
     * 取消点赞
     *
     * @param likes
     * @return
     */
    public int delete(Likes likes);

    /**
     * 查询用户是否已经点赞
     *
     * @param recipeId
     * @return
     */
    public Boolean likeSelect(Long recipeId);

    /**
     * 根据用户ID查询用户喜欢列表
     * @return
     */
    public List<Recipe> listUserId();

    /**
     * 统计一周以来点赞量最高的前三名食谱
     * @return
     */
    public List<Recipe> threeLike();
}
