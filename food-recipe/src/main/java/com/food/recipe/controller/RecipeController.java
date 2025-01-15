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
        System.out.println(recipeService.selectRecipeByRecipeId(recipeId));
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
}
