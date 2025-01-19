package com.food.recipe.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;

/**
 * 评论对象 review
 * 
 * @author 智慧的小国
 * @date 2025-01-19
 */
public class Review extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 评论id */
    private Long reviewId;

    /** 食谱id */
    @Excel(name = "食谱id")
    private Long recipeId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 评论 */
    @Excel(name = "评论")
    private String review;

    public void setReviewId(Long reviewId) 
    {
        this.reviewId = reviewId;
    }

    public Long getReviewId() 
    {
        return reviewId;
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
    public void setReview(String review) 
    {
        this.review = review;
    }

    public String getReview() 
    {
        return review;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("reviewId", getReviewId())
            .append("recipeId", getRecipeId())
            .append("userId", getUserId())
            .append("review", getReview())
            .append("createTime", getCreateTime())
            .toString();
    }
}
