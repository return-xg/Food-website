package com.food.recipe.domain;

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
    @Excel(name = "食品名称")
    private String recipeName;

    /** 食谱简介 */
    @Excel(name = "食谱简介")
    private String recipeDescription;

    /** 图片 */
    @Excel(name = "图片")
    private String recipeImage;

    /** 审核状态 */
    private Long state;

    /** 步骤信息 */
    private List<Step> stepList;

    /** 菜系 */
    @Excel(name = "菜系")
    private String variety;

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
            .toString();
    }
}
