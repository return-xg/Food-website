package com.food.recipe.mapper;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.food.common.core.domain.entity.SysUser;
import com.food.recipe.domain.Ingredient;
import com.food.recipe.domain.Recipe;
import com.food.recipe.domain.Step;
import org.apache.ibatis.annotations.Param;

/**
 * 食谱Mapper接口
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
public interface RecipeMapper 
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
     * 删除食谱
     * 
     * @param recipeId 食谱主键
     * @return 结果
     */
    public int deleteRecipeByRecipeId(Long recipeId);

    /**
     * 批量删除食谱
     * 
     * @param recipeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRecipeByRecipeIds(Long[] recipeIds);

    /**
     * 批量删除步骤
     * 
     * @param recipeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStepByRecipeIds(Long[] recipeIds);
    
    /**
     * 批量新增步骤
     * 
     * @param stepList 步骤列表
     * @return 结果
     */
    public int batchStep(List<Step> stepList);
    

    /**
     * 通过食谱主键删除步骤信息
     * 
     * @param recipeId 食谱ID
     * @return 结果
     */
    public int deleteStepByRecipeId(Long recipeId);

    /**
     * 批量删除食材
     *
     * @param recipeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteIngredientByRecipeIds(Long[] recipeIds);

    /**
     * 批量新增食材
     *
     * @param ingredientList 食材列表
     * @return 结果
     */
    public int batchIngredient(List<Ingredient> ingredientList);


    /**
     * 通过食谱主键删除食材信息
     *
     * @param recipeId 食谱ID
     * @return 结果
     */
    public int deleteIngredientByRecipeId(Long recipeId);

    /**
     * 按收藏量查询食谱列表
     *
     * @param recipe
     * @return 食谱集合
     */
    public List<Recipe> likeRecipeList(Recipe recipe);

    /**
     * 按评论量查询食谱列表
     *
     * @param recipe
     * @return 食谱集合
     */
    public List<Recipe> reviewRecipeList(Recipe recipe);

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
    public List<Map<String, Object>> getRecipeCountByDate(@Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);
}
