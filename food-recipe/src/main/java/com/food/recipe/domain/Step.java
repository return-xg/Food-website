package com.food.recipe.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;

/**
 * 步骤对象 step
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
public class Step extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 步骤id */
    private Long stepId;

    /** 食谱id */
    @Excel(name = "食谱id")
    private Long recipeId;

    /** 记录步骤的顺序 */
    @Excel(name = "记录步骤的顺序")
    private Long stepNumber;

    /** 详细描述该步骤的操作内容 */
    @Excel(name = "详细描述该步骤的操作内容")
    private String stepDescription;

    /** 步骤图片 */
    @Excel(name = "步骤图片")
    private String stepImage;

    public void setStepId(Long stepId) 
    {
        this.stepId = stepId;
    }

    public Long getStepId() 
    {
        return stepId;
    }
    public void setRecipeId(Long recipeId) 
    {
        this.recipeId = recipeId;
    }

    public Long getRecipeId() 
    {
        return recipeId;
    }
    public void setStepNumber(Long stepNumber) 
    {
        this.stepNumber = stepNumber;
    }

    public Long getStepNumber() 
    {
        return stepNumber;
    }
    public void setStepDescription(String stepDescription) 
    {
        this.stepDescription = stepDescription;
    }

    public String getStepDescription() 
    {
        return stepDescription;
    }
    public void setStepImage(String stepImage) 
    {
        this.stepImage = stepImage;
    }

    public String getStepImage() 
    {
        return stepImage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("stepId", getStepId())
            .append("recipeId", getRecipeId())
            .append("stepNumber", getStepNumber())
            .append("stepDescription", getStepDescription())
            .append("stepImage", getStepImage())
            .toString();
    }
}
