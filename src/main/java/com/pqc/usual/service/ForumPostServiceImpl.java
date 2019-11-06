package com.pqc.usual.service;

import com.pqc.usual.bean.ForumPost;
import com.pqc.usual.mapper.ForumPostMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class ForumPostServiceImpl implements ForumPostService {
    @Resource
    private ForumPostMapper forumPostMapper;

    public void saveInfo(ForumPost forumPost) {
        forumPost.setCreatetime(new Date());
        forumPostMapper.insert(forumPost);
    }
}
