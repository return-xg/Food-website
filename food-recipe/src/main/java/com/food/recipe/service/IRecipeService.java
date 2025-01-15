package com.food.recipe.service;

import java.util.List;
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
}
