package com.food.recipe.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.food.recipe.mapper.LikesMapper;
import com.food.recipe.domain.Likes;
import com.food.recipe.service.ILikesService;

import static com.food.common.utils.SecurityUtils.getUserId;

/**
 * 点赞Service业务层处理
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
     * 查询点赞
     * 
     * @param likeId 点赞主键
     * @return 点赞
     */
    @Override
    public Likes selectLikesByLikeId(Long likeId)
    {
        return likesMapper.selectLikesByLikeId(likeId);
    }

    /**
     * 查询点赞列表
     * 
     * @param likes 点赞
     * @return 点赞
     */
    @Override
    public List<Likes> selectLikesList(Likes likes)
    {
        return likesMapper.selectLikesList(likes);
    }

    /**
     * 新增点赞
     * 
     * @param likes 点赞
     * @return 结果
     */
    @Override
    public int insertLikes(Likes likes)
    {
        likes.setUserId(getUserId());
        return likesMapper.insertLikes(likes);
    }

    /**
     * 取消点赞
     *
     * @param likes
     * @return
     */
    @Override
    public int delete(Likes likes)
    {
        return likesMapper.delete(likes);
    }

    /**
     * 修改点赞
     * 
     * @param likes 点赞
     * @return 结果
     */
    @Override
    public int updateLikes(Likes likes)
    {
        return likesMapper.updateLikes(likes);
    }

    /**
     * 批量删除点赞
     * 
     * @param likeIds 需要删除的点赞主键
     * @return 结果
     */
    @Override
    public int deleteLikesByLikeIds(Long[] likeIds)
    {
        return likesMapper.deleteLikesByLikeIds(likeIds);
    }

    /**
     * 删除点赞信息
     * 
     * @param likeId 点赞主键
     * @return 结果
     */
    @Override
    public int deleteLikesByLikeId(Long likeId)
    {
        return likesMapper.deleteLikesByLikeId(likeId);
    }
}
