package com.food.recipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.food.common.annotation.Log;
import com.food.common.core.controller.BaseController;
import com.food.common.core.domain.AjaxResult;
import com.food.common.enums.BusinessType;
import com.food.recipe.domain.Review;
import com.food.recipe.service.IReviewService;
import com.food.common.utils.poi.ExcelUtil;
import com.food.common.core.page.TableDataInfo;

/**
 * 评论Controller
 * 
 * @author 智慧的小国
 * @date 2025-01-19
 */
@RestController
@RequestMapping("/recipe/review")
public class ReviewController extends BaseController
{
    @Autowired
    private IReviewService reviewService;

    /**
     * 查询评论列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:list')")
    @GetMapping("/list")
    public TableDataInfo list(Review review)
    {
        startPage();
        List<Review> list = reviewService.selectReviewList(review);
        return getDataTable(list);
    }

    /**
     * 导出评论列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:export')")
    @Log(title = "评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Review review)
    {
        List<Review> list = reviewService.selectReviewList(review);
        ExcelUtil<Review> util = new ExcelUtil<Review>(Review.class);
        util.exportExcel(response, list, "评论数据");
    }

    /**
     * 获取评论详细信息
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:query')")
    @GetMapping(value = "/{reviewId}")
    public AjaxResult getInfo(@PathVariable("reviewId") Long reviewId)
    {
        return success(reviewService.selectReviewByReviewId(reviewId));
    }

    /**
     * 新增评论
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:add')")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Review review)
    {
        return toAjax(reviewService.insertReview(review));
    }

    /**
     * 修改评论
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:edit')")
    @Log(title = "评论", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Review review)
    {
        return toAjax(reviewService.updateReview(review));
    }

    /**
     * 删除评论
     */
    @PreAuthorize("@ss.hasPermi('recipe:review:remove')")
    @Log(title = "评论", businessType = BusinessType.DELETE)
	@DeleteMapping("/{reviewIds}")
    public AjaxResult remove(@PathVariable Long[] reviewIds)
    {
        return toAjax(reviewService.deleteReviewByReviewIds(reviewIds));
    }

    /**
     * 评论总数
     */
    @GetMapping("/reviewNum")
    public int reviewNum(){
        return reviewService.reviewNum();
    }

    /**
     * 查询食谱评论
     * @param recipeId
     * @return
     */
    @GetMapping("/byRecipeId")
    public List<Review> list(@RequestParam Long recipeId){

        List<Review> reviews = reviewService.findAllByRecipeId(recipeId);

        List<Review> rootReviews = reviews.stream().filter(review -> review.getpId() == null).collect(Collectors.toList());
        for (Review rootReview : rootReviews) {
            rootReview.setChildren(reviews.stream().filter(review -> rootReview.getReviewId().equals(review.getpId())).collect(Collectors.toList()));
        }


        return rootReviews;
    }
}
