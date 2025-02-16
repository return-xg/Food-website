package com.food.recipe.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.food.common.annotation.Log;
import com.food.common.core.controller.BaseController;
import com.food.common.core.domain.AjaxResult;
import com.food.common.enums.BusinessType;
import com.food.recipe.domain.Recipe;
import com.food.recipe.service.IRecipeService;
import com.food.common.utils.poi.ExcelUtil;
import com.food.common.core.page.TableDataInfo;

/**
 * 食谱Controller
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
@RestController
@RequestMapping("/recipe/recipe")
public class RecipeController extends BaseController
{
    @Autowired
    private IRecipeService recipeService;

    /**
     * 查询食谱列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:list')")
    @GetMapping("/list")
    public TableDataInfo list(Recipe recipe)
    {
        startPage();
        List<Recipe> list = recipeService.selectRecipeList(recipe);
        return getDataTable(list);
    }

    /**
     * 查询审核通过食谱列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:list')")
    @GetMapping("/listState1")
    public TableDataInfo listState1(Recipe recipe)
    {
        startPage();
        List<Recipe> list = recipeService.selectRecipeListState1(recipe);
        return getDataTable(list);
    }

    /**
     * 导出食谱列表
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:export')")
    @Log(title = "食谱", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Recipe recipe)
    {
        List<Recipe> list = recipeService.selectRecipeList(recipe);
        ExcelUtil<Recipe> util = new ExcelUtil<Recipe>(Recipe.class);
        util.exportExcel(response, list, "食谱数据");
    }

    /**
     * 获取食谱详细信息
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:query')")
    @GetMapping(value = "/{recipeId}")
    public AjaxResult getInfo(@PathVariable("recipeId") Long recipeId)
    {
        return success(recipeService.selectRecipeByRecipeId(recipeId));
    }

    /**
     * 新增食谱
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:add')")
    @Log(title = "食谱", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Recipe recipe)
    {
        return toAjax(recipeService.insertRecipe(recipe));
    }

    /**
     * 修改食谱
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:edit')")
    @Log(title = "食谱", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Recipe recipe)
    {
        return toAjax(recipeService.updateRecipe(recipe));
    }

    /**
     * 修改审核状态
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:edit')")
    @Log(title = "食谱", businessType = BusinessType.UPDATE)
    @PutMapping("/state")
    public AjaxResult editState(@RequestBody Recipe recipe)
    {
        return toAjax(recipeService.updateState(recipe));
    }

    /**
     * 删除食谱
     */
    @PreAuthorize("@ss.hasPermi('recipe:recipe:remove')")
    @Log(title = "食谱", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recipeIds}")
    public AjaxResult remove(@PathVariable Long[] recipeIds)
    {
        return toAjax(recipeService.deleteRecipeByRecipeIds(recipeIds));
    }

    /**
     * 按收藏量查询食谱列表
     */
    @GetMapping("/likeRecipe")
    public TableDataInfo likeRecipe(Recipe recipe) {
        startPage();
        List<Recipe> list = recipeService.likeRecipeList(recipe);
        return getDataTable(list);
    }

    /**
     * 按评论量查询食谱列表
     */
    @GetMapping("/reviewRecipe")
    public TableDataInfo reviewRecipe(Recipe recipe) {
        startPage();
        List<Recipe> list = recipeService.reviewRecipeList(recipe);
        return getDataTable(list);
    }

    /**
     * 用户查询发布菜谱
     */
    @GetMapping("/userRecipeList")
    public TableDataInfo userRecipeList(Recipe recipe) {
        startPage();
        List<Recipe> list = recipeService.userRecipeList(recipe);
        return getDataTable(list);
    }

    /**
     * 根据食谱id查询用户信息
     *
     * @param recipeId
     * @return
     */
    @GetMapping("/recipeByIdUser/{recipeId}")
    public AjaxResult recipeByIdUser(@PathVariable("recipeId") Long recipeId) {
        return success(recipeService.recipeByIdUser(recipeId));
    }

    /**
     * 最近收藏数量最高的八个菜谱
     * @return
     */
    @GetMapping("/likeNumList")
    public AjaxResult likeNumList() {
        return success(recipeService.likeNumList());
    }

    /**
     * 最近评论数量最高的八个菜谱
     */
    @GetMapping("reviewNumList")
    public AjaxResult reviewNumList() {
        return success(recipeService.reviewNumList());
    }

    /**
     * 审核通过所有食谱数量
     *
     * @return
     */
    @GetMapping("/recipeNum")
    public int recipeNum() {
        return recipeService.recipeNum();
    }

    /**
     * 根据开始时间和结束时间查询每天增长的state=1的食谱数量
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @return 每天的食谱数量列表
     */
    @GetMapping("/recipeCountByDate")
    public AjaxResult getRecipeCountByDate(
            @RequestParam(required = false, defaultValue = "all") String timeRange,
            @RequestParam(required = false) LocalDateTime startTime,
            @RequestParam(required = false) LocalDateTime endTime) {
        if (timeRange != null) {
            LocalDateTime now = LocalDateTime.now();
            switch (timeRange) {
                case "all":
                    startTime = LocalDateTime.MIN;
                    endTime = now;
                    break;
                case "halfYear":
                    startTime = now.minusMonths(6);
                    endTime = now;
                    break;
                case "oneMonth":
                    startTime = now.minusMonths(1);
                    endTime = now;
                    break;
                case "oneWeek":
                    startTime = now.minusWeeks(1);
                    endTime = now;
                    break;
                default:
                    return AjaxResult.error("无效的时间范围参数");
            }
        }

        List<Map<String, Object>> result = recipeService.getRecipeCountByDate(startTime, endTime);
        return AjaxResult.success(result);
    }
}
