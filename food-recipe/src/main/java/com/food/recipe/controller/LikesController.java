package com.food.recipe.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.food.recipe.domain.Recipe;
import org.apache.ibatis.annotations.Select;
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
 * 收藏Controller
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
     * 查询收藏列表
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
     * 查询收藏列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:list')")
    @GetMapping("/list1")
    public TableDataInfo list1(Likes likes)
    {
        startPage();
        List<Likes> list = likesService.selectLikesList1(likes);
        return getDataTable(list);
    }

    /**
     * 导出收藏列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:export')")
    @Log(title = "收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Likes likes)
    {
        List<Likes> list = likesService.selectLikesList1(likes);
        ExcelUtil<Likes> util = new ExcelUtil<Likes>(Likes.class);
        util.exportExcel(response, list, "收藏数据");
    }

    /**
     * 获取收藏详细信息
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:query')")
    @GetMapping(value = "/{likeId}")
    public AjaxResult getInfo(@PathVariable("likeId") Long likeId)
    {
        return success(likesService.selectLikesByLikeId(likeId));
    }

    /**
     * 新增收藏
     */
    @Log(title = "收藏", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Likes likes)
    {
        return toAjax(likesService.insertLikes(likes));
    }

    /**
     * 取消收藏
     */
    @Log(title = "收藏", businessType = BusinessType.DELETE)
    @DeleteMapping("/likeDelete")
    public AjaxResult delete(@RequestBody Likes likes)
    {
        return toAjax(likesService.delete(likes));
    }

    /**
     * 查询用户是否已经收藏
     */
    @GetMapping("/likeSelect")
    public Boolean likeSelect(@RequestParam Long recipeId)
    {
         return likesService.likeSelect(recipeId);
    }

    /**
     * 修改收藏
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:edit')")
    @Log(title = "收藏", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Likes likes)
    {
        return toAjax(likesService.updateLikes(likes));
    }

    /**
     * 删除收藏
     */
    @PreAuthorize("@ss.hasPermi('recipe:likes:remove')")
    @Log(title = "收藏", businessType = BusinessType.DELETE)
	@DeleteMapping("/{likeIds}")
    public AjaxResult remove(@PathVariable Long[] likeIds)
    {
        return toAjax(likesService.deleteLikesByLikeIds(likeIds));
    }

    /**
     * 统计一周以来收藏量最高的前三名食谱
     */
    @GetMapping("/threeLike")
    public AjaxResult threeLike(){
        return success(likesService.threeLike());
    }
}
