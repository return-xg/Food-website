package com.food.recipe.service;

import java.util.List;
import com.food.recipe.domain.Likes;
import com.food.recipe.domain.Recipe;

/**
 * 收藏Service接口
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
public interface ILikesService 
{
    /**
     * 查询收藏
     * 
     * @param likeId 收藏主键
     * @return 收藏
     */
    public Likes selectLikesByLikeId(Long likeId);

    /**
     * 查询收藏列表
     * 
     * @param likes 收藏
     * @return 收藏集合
     */
    public List<Likes> selectLikesList(Likes likes);

    /**
     * 查询收藏列表
     *
     * @param likes 收藏
     * @return 收藏集合
     */
    public List<Likes> selectLikesList1(Likes likes);

    /**
     * 新增收藏
     * 
     * @param likes 收藏
     * @return 结果
     */
    public int insertLikes(Likes likes);

    /**
     * 修改收藏
     * 
     * @param likes 收藏
     * @return 结果
     */
    public int updateLikes(Likes likes);

    /**
     * 批量删除收藏
     * 
     * @param likeIds 需要删除的收藏主键集合
     * @return 结果
     */
    public int deleteLikesByLikeIds(Long[] likeIds);

    /**
     * 删除收藏信息
     * 
     * @param likeId 收藏主键
     * @return 结果
     */
    public int deleteLikesByLikeId(Long likeId);

    /**
     * 取消收藏
     *
     * @param likes
     * @return
     */
    public int delete(Likes likes);

    /**
     * 查询用户是否已经收藏
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
     * 统计一周以来收藏量最高的前三名食谱
     * @return
     */
    public List<Recipe> threeLike();
}
