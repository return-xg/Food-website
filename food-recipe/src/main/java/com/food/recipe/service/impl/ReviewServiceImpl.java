package com.food.recipe.service.impl;

import java.util.List;
import com.food.common.utils.DateUtils;
import com.food.recipe.domain.Recipe;
import com.food.recipe.mapper.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.food.recipe.mapper.ReviewMapper;
import com.food.recipe.domain.Review;
import com.food.recipe.service.IReviewService;

import static com.food.common.utils.SecurityUtils.*;

/**
 * 评论Service业务层处理
 * 
 * @author 智慧的小国
 * @date 2025-01-19
 */
@Service
public class ReviewServiceImpl implements IReviewService 
{
    @Autowired
    private ReviewMapper reviewMapper;

    @Autowired
    private RecipeMapper recipeMapper;

    /**
     * 查询评论
     * 
     * @param reviewId 评论主键
     * @return 评论
     */
    @Override
    public Review selectReviewByReviewId(Long reviewId)
    {
        return reviewMapper.selectReviewByReviewId(reviewId);
    }

    /**
     * 查询评论列表
     * 
     * @param review 评论
     * @return 评论
     */
    @Override
    public List<Review> selectReviewList(Review review)
    {
        return reviewMapper.selectReviewList(review);
    }

    /**
     * 新增评论
     * 
     * @param review 评论
     * @return 结果
     */
    @Override
    public int insertReview(Review review)
    {
        review.setCreateTime(DateUtils.getNowDate());
        review.setUserId(getUserId());
        review.setNickName(getNickname());
        Recipe recipe = recipeMapper.selectRecipeByRecipeId(review.getRecipeId());
        review.setRecipeName(recipe.getRecipeName());
        reviewMapper.insertReview(review);

        return reviewMapper.updateRecipeReview();
    }

    /**
     * 修改评论
     * 
     * @param review 评论
     * @return 结果
     */
    @Override
    public int updateReview(Review review)
    {
        return reviewMapper.updateReview(review);
    }

    /**
     * 批量删除评论
     * 
     * @param reviewIds 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteReviewByReviewIds(Long[] reviewIds)
    {
        reviewMapper.deleteReviewByReviewIds(reviewIds);

        return reviewMapper.updateRecipeReview();
    }

    /**
     * 删除评论信息
     * 
     * @param reviewId 评论主键
     * @return 结果
     */
    @Override
    public int deleteReviewByReviewId(Long reviewId)
    {
        reviewMapper.deleteReviewByReviewId(reviewId);

        return reviewMapper.updateRecipeReview();
    }

    /**
     * 评论总数
     *
     * @return
     */
    @Override
    public int reviewNum() {
        return reviewMapper.reviewNum();
    }

    /**
     * 查询食谱评论
     * @param recipeId
     * @return
     */
    @Override
    public List<Review> findAllByRecipeId(Long recipeId) {
        Review review = new Review();
        review.setRecipeId(recipeId);
        return reviewMapper.selectReviewList(review);
    }
}
