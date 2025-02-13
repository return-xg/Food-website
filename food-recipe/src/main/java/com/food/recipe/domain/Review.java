package com.food.recipe.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.food.common.annotation.Excel;
import com.food.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

import java.util.List;

/**
 * 评论对象 review
 *
 * @author 智慧的小国
 * @date 2025-02-13
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

    /** 用户名称 */
    @Excel(name = "用户名称")
    private String nickName;

    /** 评论 */
    @Excel(name = "评论")
    private String review;

    /** 父级id */
    @Excel(name = "父级id")
    private Long pId;

    /** 回复对象 */
    @Excel(name = "回复对象")
    private String target;

    /** 食谱名称 */
    @Excel(name = "食谱名称")
    private String recipeName;

    /** 多级评论 */
    @Transient
    private List<Review> children;

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
    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }

    public String getNickName()
    {
        return nickName;
    }
    public void setReview(String review)
    {
        this.review = review;
    }

    public String getReview()
    {
        return review;
    }
    public void setpId(Long pId)
    {
        this.pId = pId;
    }

    public Long getpId()
    {
        return pId;
    }
    public void setTarget(String target)
    {
        this.target = target;
    }

    public String getTarget()
    {
        return target;
    }
    public void setRecipeName(String recipeName)
    {
        this.recipeName = recipeName;
    }

    public String getRecipeName()
    {
        return recipeName;
    }

    public List<Review> getChildren() {
        return children;
    }

    public void setChildren(List<Review> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("reviewId", getReviewId())
                .append("recipeId", getRecipeId())
                .append("userId", getUserId())
                .append("nickName", getNickName())
                .append("review", getReview())
                .append("createTime", getCreateTime())
                .append("pId", getpId())
                .append("target", getTarget())
                .append("recipeName", getRecipeName())
                .append("children", getChildren())
                .toString();
    }
}
