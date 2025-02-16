package com.food.recipe.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;

/**
 * 点赞对象 likes
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
public class Likes extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 点赞id */
    private Long likeId;

    /** 食谱id */
    @Excel(name = "食谱id")
    private Long recipeId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    public void setLikeId(Long likeId) 
    {
        this.likeId = likeId;
    }

    public Long getLikeId() 
    {
        return likeId;
    }
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("likeId", getLikeId())
            .append("recipeId", getRecipeId())
            .append("userId", getUserId())
            .toString();
    }


    private String recipeName;
    private String nickName;

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}
