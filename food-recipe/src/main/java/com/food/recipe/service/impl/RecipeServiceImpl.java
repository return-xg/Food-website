package com.food.recipe.service.impl;

import java.util.List;
import com.food.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
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
     * 新增食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int insertRecipe(Recipe recipe)
    {
        recipe.setUserId(getUserId());
        if (recipe.getState() != 1){
            recipe.setState(0L);
        }
        recipe.setCreateTime(DateUtils.getNowDate());
        recipe.setLikes(0L);
        recipe.setCollect(0L);
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
