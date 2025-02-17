package com.food.recipe.domain;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;

/**
 * 食谱对象 recipe
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
public class Recipe extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 食谱id */
    private Long recipeId;

    /** 用户id */
    private Long userId;

    /** 食品名称 */
    @Excel(name = "食品名称",sort = 1)
    private String recipeName;

    /** 食谱简介 */
    @Excel(name = "食谱简介",sort = 3)
    private String recipeDescription;

    /** 图片 */
    @Excel(name = "图片",sort = 4)
    private String recipeImage;

    /** 审核状态 */
    @Excel(name = "审核状态",dictType = "recipe_state",sort = 9)
    private Long state;

    /** 步骤信息 */
    private List<Step> stepList;

    /** 菜系 */
    @Excel(name = "菜系",sort = 2,dictType = "variety")
    private String variety;

    /** 收藏数 */
    @Excel(name = "收藏数",sort = 5)
    private Long likes;


    /** 评论数 */
    @Excel(name = "评论数",sort = 6)
    private Long review;

    /** 食材信息 */
    private List<Ingredient> ingredientList;

    public void setRecipeId(Long recipeId) 
    {
        this.recipeId = recipeId;
    }

    public Long getRecipeId() 
    {
        return recipeId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setRecipeName(String recipeName) 
    {
        this.recipeName = recipeName;
    }

    public String getRecipeName() 
    {
        return recipeName;
    }
    public void setRecipeDescription(String recipeDescription) 
    {
        this.recipeDescription = recipeDescription;
    }

    public String getRecipeDescription() 
    {
        return recipeDescription;
    }
    public void setRecipeImage(String recipeImage) 
    {
        this.recipeImage = recipeImage;
    }

    public String getRecipeImage() 
    {
        return recipeImage;
    }
    public void setState(Long state) 
    {
        this.state = state;
    }

    public Long getState() 
    {
        return state;
    }

    public List<Step> getStepList()
    {
        return stepList;
    }

    public void setStepList(List<Step> stepList)
    {
        this.stepList = stepList;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public List<Ingredient> getIngredientList() {
        return ingredientList;
    }

    public void setIngredientList(List<Ingredient> ingredientList) {
        this.ingredientList = ingredientList;
    }

    public Long getLikes() {
        return likes;
    }

    public void setLikes(Long likes) {
        this.likes = likes;
    }


    public Long getReview() {
        return review;
    }

    public void setReview(Long review) {
        this.review = review;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recipeId", getRecipeId())
            .append("userId", getUserId())
            .append("recipeName", getRecipeName())
            .append("recipeDescription", getRecipeDescription())
            .append("recipeImage", getRecipeImage())
            .append("state", getState())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("stepList", getStepList())
            .append("variety", getVariety())
            .append("likes", getLikes())
            .append("review", getReview())
            .append("ingredientList", getIngredientList())
            .toString();
    }
}
