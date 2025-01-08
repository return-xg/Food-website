package com.food.recipe.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;

/**
 * 食材对象 ingredient
 *
 * @author 智慧的小国
 * @date 2025-01-06
 */
public class Ingredient extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 食材id */
    private Long ingredientId;

    /** 食谱id */
    @Excel(name = "食谱id")
    private Long recipeId;

    /** 存储食材的名称 */
    @Excel(name = "存储食材的名称")
    private String ingredientName;

    /** 记录食材的用量 */
    @Excel(name = "记录食材的用量")
    private String ingredientQuantity;

    public void setIngredientId(Long ingredientId)
    {
        this.ingredientId = ingredientId;
    }

    public Long getIngredientId()
    {
        return ingredientId;
    }
    public void setRecipeId(Long recipeId)
    {
        this.recipeId = recipeId;
    }

    public Long getRecipeId()
    {
        return recipeId;
    }
    public void setIngredientName(String ingredientName)
    {
        this.ingredientName = ingredientName;
    }

    public String getIngredientName()
    {
        return ingredientName;
    }
    public void setIngredientQuantity(String ingredientQuantity)
    {
        this.ingredientQuantity = ingredientQuantity;
    }

    public String getIngredientQuantity()
    {
        return ingredientQuantity;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("ingredientId", getIngredientId())
                .append("recipeId", getRecipeId())
                .append("ingredientName", getIngredientName())
                .append("ingredientQuantity", getIngredientQuantity())
                .toString();
    }
}
