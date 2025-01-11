package com.food.recipe.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.food.recipe.domain.Recipe;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.food.common.annotation.Log;
import com.food.common.core.controller.BaseController;
import com.food.common.core.domain.AjaxResult;
import com.food.common.enums.BusinessType;
import com.food.recipe.domain.Likes;
import com.food.recipe.service.ILikesService;
import com.food.common.utils.poi.ExcelUtil;
import com.food.common.core.page.TableDataInfo;

/**
 * 点赞Controller
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
@RestController
@RequestMapping("/recipe/likes")
public class LikesController extends BaseController
{
    @Autowired
    private ILikesService likesService;

    /**
     * 根据用户ID查询用户喜欢列表
     * @return
     */
    @GetMapping("/userId")
    public TableDataInfo listUserId(){
        startPage();
        List<Recipe> list = likesService.listUserId();
        return getDataTable(list);
    }

    /**
     * 查询点赞列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:list')")
    @GetMapping("/list")
    public TableDataInfo list(Likes likes)
    {
        startPage();
        List<Likes> list = likesService.selectLikesList(likes);
        return getDataTable(list);
    }

    /**
     * 导出点赞列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:export')")
    @Log(title = "点赞", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Likes likes)
    {
        List<Likes> list = likesService.selectLikesList(likes);
        ExcelUtil<Likes> util = new ExcelUtil<Likes>(Likes.class);
        util.exportExcel(response, list, "点赞数据");
    }

    /**
     * 获取点赞详细信息
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:query')")
    @GetMapping(value = "/{likeId}")
    public AjaxResult getInfo(@PathVariable("likeId") Long likeId)
    {
        return success(likesService.selectLikesByLikeId(likeId));
    }

    /**
     * 新增点赞
     */
    @Log(title = "点赞", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Likes likes)
    {
        return toAjax(likesService.insertLikes(likes));
    }

    /**
     * 取消点赞
     */
    @Log(title = "点赞", businessType = BusinessType.DELETE)
    @DeleteMapping("/likeDelete")
    public AjaxResult delete(@RequestBody Likes likes)
    {
        return toAjax(likesService.delete(likes));
    }

    /**
     * 查询用户是否已经点赞
     */
    @GetMapping("/likeSelect")
    public Boolean likeSelect(@RequestParam Long recipeId)
    {
         return likesService.likeSelect(recipeId);
    }

    /**
     * 修改点赞
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:edit')")
    @Log(title = "点赞", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Likes likes)
    {
        return toAjax(likesService.updateLikes(likes));
    }

    /**
     * 删除点赞
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:remove')")
    @Log(title = "点赞", businessType = BusinessType.DELETE)
	@DeleteMapping("/{likeIds}")
    public AjaxResult remove(@PathVariable Long[] likeIds)
    {
        return toAjax(likesService.deleteLikesByLikeIds(likeIds));
    }
}
