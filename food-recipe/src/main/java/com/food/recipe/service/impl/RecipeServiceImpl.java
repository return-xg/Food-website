package com.food.recipe.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import com.food.common.core.domain.entity.SysUser;
import com.food.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Map;

import com.food.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.food.recipe.domain.Step;
import com.food.recipe.domain.Ingredient;
import com.food.recipe.mapper.RecipeMapper;
import com.food.recipe.domain.Recipe;
import com.food.recipe.service.IRecipeService;

import static com.food.common.utils.SecurityUtils.getUserId;

/**
 * 食谱Service业务层处理
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
@Service
public class RecipeServiceImpl implements IRecipeService 
{
    @Autowired
    private RecipeMapper recipeMapper;

    /**
     * 查询食谱
     * 
     * @param recipeId 食谱主键
     * @return 食谱
     */
    @Override
    public Recipe selectRecipeByRecipeId(Long recipeId)
    {
        return recipeMapper.selectRecipeByRecipeId(recipeId);
    }

    /**
     * 查询食谱列表
     * 
     * @param recipe 食谱
     * @return 食谱
     */
    @Override
    public List<Recipe> selectRecipeList(Recipe recipe)
    {
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 查询审核通过食谱列表
     *
     * @param recipe 食谱
     * @return 食谱
     */
    @Override
    public List<Recipe> selectRecipeListState1(Recipe recipe)
    {
        recipe.setState(1L);
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 新增食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int insertRecipe(Recipe recipe) {
        recipe.setUserId(getUserId());
        // 检查 getState() 的返回值是否为 null
        if (recipe.getState() == null) {
            recipe.setState(0L);
        } else if (recipe.getState()!= 1) {
            recipe.setState(0L);
        }
        recipe.setCreateTime(DateUtils.getNowDate());
        recipe.setLikes(0L);
        recipe.setReview(0L);
        int rows = recipeMapper.insertRecipe(recipe);
        insertIngredient(recipe);
        insertStep(recipe);
        return rows;
    }

    /**
     * 修改食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int updateRecipe(Recipe recipe)
    {
        recipe.setState(0L);
        recipe.setUpdateTime(DateUtils.getNowDate());
        recipeMapper.deleteStepByRecipeId(recipe.getRecipeId());
        recipeMapper.deleteIngredientByRecipeId(recipe.getRecipeId());
        insertIngredient(recipe);
        insertStep(recipe);
        return recipeMapper.updateRecipe(recipe);
    }

    /**
     * 修改审核状态
     *
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int updateState(Recipe recipe)
    {
        recipeMapper.deleteStepByRecipeId(recipe.getRecipeId());
        recipeMapper.deleteIngredientByRecipeId(recipe.getRecipeId());
        insertIngredient(recipe);
        insertStep(recipe);
        return recipeMapper.updateRecipe(recipe);
    }

    /**
     * 批量删除食谱
     * 
     * @param recipeIds 需要删除的食谱主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteRecipeByRecipeIds(Long[] recipeIds)
    {
        recipeMapper.deleteStepByRecipeIds(recipeIds);
        return recipeMapper.deleteRecipeByRecipeIds(recipeIds);
    }

    /**
     * 删除食谱信息
     * 
     * @param recipeId 食谱主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteRecipeByRecipeId(Long recipeId)
    {
        recipeMapper.deleteStepByRecipeId(recipeId);
        return recipeMapper.deleteRecipeByRecipeId(recipeId);
    }

    /**
     * 按收藏量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    @Override
    public List<Recipe> likeRecipeList(Recipe recipe) {
        recipe.setState(1L);
        return recipeMapper.likeRecipeList(recipe);
    }

    /**
     * 按评论量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    @Override
    public List<Recipe> reviewRecipeList(Recipe recipe) {
        recipe.setState(1L);
        return recipeMapper.reviewRecipeList(recipe);
    }

    /**
     * 用户查询自己发布的菜谱
     *
     * @param recipe
     * @return
     */
    @Override
    public List<Recipe> userRecipeList(Recipe recipe) {
        recipe.setUserId(getUserId());
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 根据食谱id查询用户信息
     *
     * @param recipeId
     * @return
     */
    @Override
    public SysUser recipeByIdUser(Long recipeId) {
        return recipeMapper.recipeByIdUser(recipeId);
    }

    /**
     * 最近收藏数量最高的八个菜谱
     * @return
     */
    @Override
    public List<Recipe> likeNumList() {
        return recipeMapper.likeNumList();
    }

    /**
     *
     * 最近评论数量最高的八个菜谱
     * @return
     */
    @Override
    public List<Recipe> reviewNumList() {
        return recipeMapper.reviewNumList();
    }

    /**
     * 审核通过所有食谱数量
     * @return
     */
    @Override
    public int recipeNum() {
        return recipeMapper.recipeNum();
    }

    /**
     * 根据开始时间和结束时间查询每天增长的state=1的食谱数量
     *
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 每天的食谱数量列表
     */
    @Override
    public List<Map<String, Object>> getRecipeCountByDate(LocalDateTime startTime, LocalDateTime endTime) {
        return recipeMapper.getRecipeCountByDate(startTime, endTime);
    }

    /**
     * 新增步骤信息
     * 
     * @param recipe 食谱对象
     */
    public void insertStep(Recipe recipe)
    {
        Long num = 0L;
        List<Step> stepList = recipe.getStepList();
        Long recipeId = recipe.getRecipeId();
        if (StringUtils.isNotNull(stepList))
        {
            List<Step> list = new ArrayList<Step>();
            for (Step step : stepList)
            {
                if (StringUtils.isNotBlank(step.getStepDescription()) || StringUtils.isNotBlank(step.getStepImage())) {
                    step.setStepNumber(++num);
                    step.setRecipeId(recipeId);
                    list.add(step);
                }
            }
            if (list.size() > 0)
            {
                recipeMapper.batchStep(list);
            }
        }
    }

    /**
     * 新增食材信息
     *
     * @param recipe 食谱对象
     */
    public void insertIngredient(Recipe recipe)
    {
        List<Ingredient> ingredientList = recipe.getIngredientList();
        Long recipeId = recipe.getRecipeId();
        if (StringUtils.isNotNull(ingredientList))
        {
            List<Ingredient> list = new ArrayList<Ingredient>();
            for (Ingredient ingredient : ingredientList)
            {
                if (StringUtils.isNotBlank(ingredient.getIngredientName()) || StringUtils.isNotBlank(ingredient.getIngredientQuantity())) {
                    ingredient.setRecipeId(recipeId);
                    list.add(ingredient);
                }
            }
            if (list.size() > 0)
            {
                recipeMapper.batchIngredient(list);
            }
        }
    }
}
