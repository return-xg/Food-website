package com.food.recipe.service.impl;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import com.food.common.core.domain.entity.SysUser;
import com.food.common.utils.DateUtils;
import com.food.recipe.domain.*;
import com.food.recipe.mapper.LikesMapper;
import com.food.recipe.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Map;

import com.food.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.food.recipe.mapper.RecipeMapper;
import com.food.recipe.service.IRecipeService;

import static com.food.common.utils.SecurityUtils.getUserId;

/**
 * 食谱Service业务层处理
 * 
 * @author 智慧的小国
 * @date 2025-01-05
 */
@Service
public class RecipeServiceImpl implements IRecipeService 
{
    @Autowired
    private RecipeMapper recipeMapper;
    @Autowired
    private LikesMapper likesMapper;
    @Autowired
    private ReviewMapper reviewMapper;

    /**
     * 查询食谱
     * 
     * @param recipeId 食谱主键
     * @return 食谱
     */
    @Override
    public Recipe selectRecipeByRecipeId(Long recipeId)
    {
        return recipeMapper.selectRecipeByRecipeId(recipeId);
    }

    /**
     * 查询食谱列表
     * 
     * @param recipe 食谱
     * @return 食谱
     */
    @Override
    public List<Recipe> selectRecipeList(Recipe recipe)
    {
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 查询审核通过食谱列表
     *
     * @param recipe 食谱
     * @return 食谱
     */
    @Override
    public List<Recipe> selectRecipeListState1(Recipe recipe)
    {
        recipe.setState(1L);
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 新增食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int insertRecipe(Recipe recipe) {
        recipe.setUserId(getUserId());
        // 检查 getState() 的返回值是否为 null
        if (recipe.getState() == null) {
            recipe.setState(0L);
        } else if (recipe.getState()!= 1) {
            recipe.setState(0L);
        }
        recipe.setCreateTime(DateUtils.getNowDate());
        recipe.setLikes(0L);
        recipe.setReview(0L);
        int rows = recipeMapper.insertRecipe(recipe);
        insertIngredient(recipe);
        insertStep(recipe);
        return rows;
    }

    /**
     * 修改食谱
     * 
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int updateRecipe(Recipe recipe)
    {
        recipe.setState(0L);
        recipe.setUpdateTime(DateUtils.getNowDate());
        recipeMapper.deleteStepByRecipeId(recipe.getRecipeId());
        recipeMapper.deleteIngredientByRecipeId(recipe.getRecipeId());
        insertIngredient(recipe);
        insertStep(recipe);
        return recipeMapper.updateRecipe(recipe);
    }

    /**
     * 修改审核状态
     *
     * @param recipe 食谱
     * @return 结果
     */
    @Transactional
    @Override
    public int updateState(Recipe recipe)
    {
        recipeMapper.deleteStepByRecipeId(recipe.getRecipeId());
        recipeMapper.deleteIngredientByRecipeId(recipe.getRecipeId());
        insertIngredient(recipe);
        insertStep(recipe);
        return recipeMapper.updateRecipe(recipe);
    }

    /**
     * 批量删除食谱
     * 
     * @param recipeIds 需要删除的食谱主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteRecipeByRecipeIds(Long[] recipeIds)
    {
        recipeMapper.deleteStepByRecipeIds(recipeIds);
        return recipeMapper.deleteRecipeByRecipeIds(recipeIds);
    }

    /**
     * 删除食谱信息
     * 
     * @param recipeId 食谱主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteRecipeByRecipeId(Long recipeId)
    {
        recipeMapper.deleteStepByRecipeId(recipeId);
        return recipeMapper.deleteRecipeByRecipeId(recipeId);
    }

    /**
     * 按收藏量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    @Override
    public List<Recipe> likeRecipeList(Recipe recipe) {
        recipe.setState(1L);
        return recipeMapper.likeRecipeList(recipe);
    }

    /**
     * 按评论量查询食谱列表
     *
     * @param recipe 食谱
     * @return 食谱集合
     */
    @Override
    public List<Recipe> reviewRecipeList(Recipe recipe) {
        recipe.setState(1L);
        return recipeMapper.reviewRecipeList(recipe);
    }

    /**
     * 用户查询自己发布的菜谱
     *
     * @param recipe
     * @return
     */
    @Override
    public List<Recipe> userRecipeList(Recipe recipe) {
        recipe.setUserId(getUserId());
        return recipeMapper.selectRecipeList(recipe);
    }

    /**
     * 根据食谱id查询用户信息
     *
     * @param recipeId
     * @return
     */
    @Override
    public SysUser recipeByIdUser(Long recipeId) {
        return recipeMapper.recipeByIdUser(recipeId);
    }

    /**
     * 最近收藏数量最高的八个菜谱
     * @return
     */
    @Override
    public List<Recipe> likeNumList() {
        return recipeMapper.likeNumList();
    }

    /**
     *
     * 最近评论数量最高的八个菜谱
     * @return
     */
    @Override
    public List<Recipe> reviewNumList() {
        return recipeMapper.reviewNumList();
    }

    /**
     * 审核通过所有食谱数量
     * @return
     */
    @Override
    public int recipeNum() {
        return recipeMapper.recipeNum();
    }

    /**
     * 根据开始时间和结束时间查询每天增长的state=1的食谱数量
     *
     * @param startTime 开始时间
     * @param endTime 结束时间
     * @return 每天的食谱数量列表
     */
    @Override
    public List<Map<String, Object>> getRecipeCountByDate(LocalDateTime startTime, LocalDateTime endTime) {
        return recipeMapper.getRecipeCountByDate(startTime, endTime);
    }

    /**
     * 新增步骤信息
     * 
     * @param recipe 食谱对象
     */
    public void insertStep(Recipe recipe)
    {
        Long num = 0L;
        List<Step> stepList = recipe.getStepList();
        Long recipeId = recipe.getRecipeId();
        if (StringUtils.isNotNull(stepList))
        {
            List<Step> list = new ArrayList<Step>();
            for (Step step : stepList)
            {
                if (StringUtils.isNotBlank(step.getStepDescription()) || StringUtils.isNotBlank(step.getStepImage())) {
                    step.setStepNumber(++num);
                    step.setRecipeId(recipeId);
                    list.add(step);
                }
            }
            if (list.size() > 0)
            {
                recipeMapper.batchStep(list);
            }
        }
    }

    /**
     * 新增食材信息
     *
     * @param recipe 食谱对象
     */
    public void insertIngredient(Recipe recipe)
    {
        List<Ingredient> ingredientList = recipe.getIngredientList();
        Long recipeId = recipe.getRecipeId();
        if (StringUtils.isNotNull(ingredientList))
        {
            List<Ingredient> list = new ArrayList<Ingredient>();
            for (Ingredient ingredient : ingredientList)
            {
                if (StringUtils.isNotBlank(ingredient.getIngredientName()) || StringUtils.isNotBlank(ingredient.getIngredientQuantity())) {
                    ingredient.setRecipeId(recipeId);
                    list.add(ingredient);
                }
            }
            if (list.size() > 0)
            {
                recipeMapper.batchIngredient(list);
            }
        }
    }

    // 构建用户 - 物品矩阵
    public Map<Long, Map<Long, Integer>> buildUserItemMatrix() {
        Map<Long, Map<Long, Integer>> userItemMatrix = new HashMap<>();

        Likes l1 = new Likes();

        // 获取所有用户的收藏数据
        List<Likes> likesList = likesMapper.selectLikesList(l1);
        for (Likes likes : likesList) {
            Long userId = likes.getUserId();
            Long recipeId = likes.getRecipeId();
            userItemMatrix.computeIfAbsent(userId, k -> new HashMap<>())
                    .merge(recipeId, 1, Integer::sum);
        }

        Review r1 = new Review();

        // 获取所有用户的评论数据
        List<Review> reviewsList = reviewMapper.selectReviewList(r1);
        for (Review review : reviewsList) {
            Long userId = review.getUserId();
            Long recipeId = review.getRecipeId();
            userItemMatrix.computeIfAbsent(userId, k -> new HashMap<>())
                    .merge(recipeId, 1, Integer::sum);
        }

        return userItemMatrix;
    }

    // 计算余弦相似度
    public double cosineSimilarity(Map<Long, Integer> user1, Map<Long, Integer> user2) {
        double dotProduct = 0;
        double normA = 0;
        double normB = 0;

        for (Map.Entry<Long, Integer> entry : user1.entrySet()) {
            Long recipeId = entry.getKey();
            int rating1 = entry.getValue();
            normA += rating1 * rating1;
            if (user2.containsKey(recipeId)) {
                int rating2 = user2.get(recipeId);
                dotProduct += rating1 * rating2;
            }
        }

        for (int rating2 : user2.values()) {
            normB += rating2 * rating2;
        }

        if (normA == 0 || normB == 0) {
            return 0;
        }

        return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
    }

    /**
     * 个性化推荐
     * @param targetUserId
     * @return
     */
    public List<Recipe> generateRecommendations(Long targetUserId) {
        int topN = 5;
        Map<Long, Map<Long, Integer>> userItemMatrix = buildUserItemMatrix();
        Map<Long, Integer> targetUser = userItemMatrix.get(targetUserId);
        if (targetUser == null) {
            return new ArrayList<>();
        }

        Map<Long, Double> similarityMap = new HashMap<>();
        for (Map.Entry<Long, Map<Long, Integer>> entry : userItemMatrix.entrySet()) {
            Long userId = entry.getKey();
            if (userId != targetUserId) {
                Map<Long, Integer> otherUser = entry.getValue();
                double similarity = cosineSimilarity(targetUser, otherUser);
                similarityMap.put(userId, similarity);
            }
        }

        // 按相似度排序
        List<Map.Entry<Long, Double>> sortedSimilarities = new ArrayList<>(similarityMap.entrySet());
        sortedSimilarities.sort(Map.Entry.<Long, Double>comparingByValue().reversed());

        Map<Long, Double> recommendationScores = new HashMap<>();
        for (int i = 0; i < Math.min(topN, sortedSimilarities.size()); i++) {
            Long similarUserId = sortedSimilarities.get(i).getKey();
            double similarity = sortedSimilarities.get(i).getValue();
            Map<Long, Integer> similarUser = userItemMatrix.get(similarUserId);

            for (Map.Entry<Long, Integer> entry : similarUser.entrySet()) {
                Long recipeId = entry.getKey();
                if (!targetUser.containsKey(recipeId)) {
                    int rating = entry.getValue();
                    recommendationScores.merge(recipeId, rating * similarity, Double::sum);
                }
            }
        }

        // 按推荐分数排序
        List<Map.Entry<Long, Double>> sortedRecommendations = new ArrayList<>(recommendationScores.entrySet());
        sortedRecommendations.sort(Map.Entry.<Long, Double>comparingByValue().reversed());

        List<Recipe> recommendedRecipes = new ArrayList<>();
        for (int i = 0; i < Math.min(topN, sortedRecommendations.size()); i++) {
            Long recipeId = sortedRecommendations.get(i).getKey();
            Recipe recipe = selectRecipeByRecipeId(recipeId);
            if (recipe != null) {
                recommendedRecipes.add(recipe);
            }
        }

        return recommendedRecipes;
    }
}
