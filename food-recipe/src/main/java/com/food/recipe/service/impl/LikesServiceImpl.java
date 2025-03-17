package com.food.recipe.service.impl;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import com.food.common.utils.DateUtils;
import com.food.recipe.domain.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.food.recipe.mapper.LikesMapper;
import com.food.recipe.domain.Likes;
import com.food.recipe.service.ILikesService;

import static com.food.common.utils.SecurityUtils.getUserId;

/**
 * 收藏Service业务层处理
 * 
 * @author 智慧的小国
 * @date 2025-01-10
 */
@Service
public class LikesServiceImpl implements ILikesService 
{
    @Autowired
    private LikesMapper likesMapper;

    /**
     * 查询收藏
     * 
     * @param likeId 收藏主键
     * @return 收藏
     */
    @Override
    public Likes selectLikesByLikeId(Long likeId)
    {
        return likesMapper.selectLikesByLikeId(likeId);
    }

    /**
     * 查询收藏列表
     * 
     * @param likes 收藏
     * @return 收藏
     */
    @Override
    public List<Likes> selectLikesList(Likes likes)
    {
        return likesMapper.selectLikesList(likes);
    }

    /**
     * 查询收藏列表
     *
     * @param likes 收藏
     * @return 收藏
     */
    @Override
    public List<Likes> selectLikesList1(Likes likes)
    {
        return likesMapper.selectLikesList1(likes);
    }

    /**
     * 新增收藏
     * 
     * @param likes 收藏
     * @return 结果
     */
    @Override
    public int insertLikes(Likes likes)
    {
        likes.setCreateTime(DateUtils.getNowDate());
        likes.setUserId(getUserId());
        likesMapper.insertLikes(likes);
        return likesMapper.updateRecipeLikes();
    }

    /**
     * 取消收藏
     *
     * @param likes
     * @return
     */
    @Override
    public int delete(Likes likes)
    {
        likes.setUserId(getUserId());
        likesMapper.delete(likes);
        return likesMapper.updateRecipeLikes();
    }

    /**
     * 查询用户是否已经收藏
     *
     * @param recipeId
     * @return
     */
    @Override
    public Boolean likeSelect(Long recipeId) {

        Long userId = getUserId();
        return likesMapper.likeSelect(userId,recipeId) > 0;
    }

    /**
     * 根据用户ID查询用户喜欢列表
     * @return
     */
    @Override
    public List<Recipe> listUserId() {
        return likesMapper.listUserId(getUserId());
    }

    /**
     * 修改收藏
     * 
     * @param likes 收藏
     * @return 结果
     */
    @Override
    public int updateLikes(Likes likes)
    {
        return likesMapper.updateLikes(likes);
    }

    /**
     * 批量删除收藏
     * 
     * @param likeIds 需要删除的收藏主键
     * @return 结果
     */
    @Override
    public int deleteLikesByLikeIds(Long[] likeIds)
    {
        return likesMapper.deleteLikesByLikeIds(likeIds);
    }

    /**
     * 删除收藏信息
     * 
     * @param likeId 收藏主键
     * @return 结果
     */
    @Override
    public int deleteLikesByLikeId(Long likeId)
    {
        return likesMapper.deleteLikesByLikeId(likeId);
    }

    /**
     * 统计一周以来收藏量最高的前三名食谱
     * @return
     */
    @Override
    public List<Recipe> threeLike() {

        LocalDateTime endTime = LocalDateTime.now();
        LocalDateTime startTime = endTime.minusWeeks(1);
        return likesMapper.threeLikes(startTime,endTime);
    }
}
