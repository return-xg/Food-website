package com.food.recipe.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
    @PreAuthorize("@ss.hasPermi('recipe:likes:add')")
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
