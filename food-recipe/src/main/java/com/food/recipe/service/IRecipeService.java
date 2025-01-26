package com.food.recipe.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.food.common.core.domain.entity.SysUser;
import com.food.recipe.domain.Recipe;

/**
 * 食谱Service接口
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
public interface IRecipeService 
{
    /**
     * 查询食谱
     * 
     * @param recipeId 食谱主键
     * @return 食谱
     */
    public Recipe selectRecipeByRecipeId(Long recipeId);

    /**
     * 查询食谱列表
     * 
     * @param recipe 食谱
     * @return 食谱集合
     */
    public List<Recipe> selectRecipeList(Recipe recipe);

    /**
     * 查询审核通过食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    public List<Recipe> selectRecipeListState1(Recipe recipe);

    /**
     * 新增食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    public int insertRecipe(Recipe recipe);

    /**
     * 修改食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    public int updateRecipe(Recipe recipe);

    /**
     * 修改审核状态
     *
     * @param recipe 食谱
     * @return 结果
     */
    public int updateState(Recipe recipe);

    /**
     * 批量删除食谱
     * 
     * @param recipeIds 需要删除的食谱主键集合
     * @return 结果
     */
    public int deleteRecipeByRecipeIds(Long[] recipeIds);

    /**
     * 删除食谱信息
     * 
     * @param recipeId 食谱主键
     * @return 结果
     */
    public int deleteRecipeByRecipeId(Long recipeId);

    /**
     * 按收藏量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    public List<Recipe> likeRecipeList(Recipe recipe);

    /**
     * 按评论量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    public List<Recipe> reviewRecipeList(Recipe recipe);

    /**
     * 用户查询自己发布的菜谱
     *
     * @param recipe
     * @return
     */
    public List<Recipe> userRecipeList(Recipe recipe);

    /**
     * 根据食谱id查询用户信息
     *
     * @param recipeId
     * @return
     */
    public SysUser recipeByIdUser(Long recipeId);

    /**
     * 最近收藏数量最高的八个菜谱
     * @return
     */
    public List<Recipe> likeNumList();

    /**
     * 审核通过所有食谱数量
     *
     * @return
     */
    public int recipeNum();

    /**
     * 根据开始时间和结束时间查询每天增长的state=1的食谱数量
     *
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 每天的食谱数量列表
     */
    public List<Map<String, Object>> getRecipeCountByDate(LocalDateTime startTime, LocalDateTime endTime);
}
