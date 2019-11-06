package com.pqc.usual.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pqc.usual.bean.BaoXiao;
import com.pqc.usual.bean.BaoXiaoExample;
import com.pqc.usual.bean.Notice;
import com.pqc.usual.bean.NoticeExample;
import com.pqc.usual.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;
    public void saveInfo(Notice notice) {
        notice.setNdate(new Date());
        noticeMapper.insert(notice);
    }

    public PageInfo<Notice> showAllNotice(Integer eid, Integer pageNum, Map<String, Object> search) {
        NoticeExample example = new NoticeExample();
        NoticeExample.Criteria criteria = example.createCriteria();
        //criteria.andEmpFkEqualTo(eid);
        /*String status = (String)search.get("status");
        if(status != null && status != "") {
            //转为整数类型
            //criteria.andBxstatusEqualTo(Integer.parseInt(status));
        }
        String keyword = (String)search.get("like_keyword");
        if(keyword != null && keyword != ""){
            //criteria.andBxremarkLike("%"+keyword+"%");
        }*/
        PageHelper.startPage(pageNum,4);
        List<Notice> notices = noticeMapper.selectByExample(example);
        PageInfo<Notice> page = new PageInfo<Notice>(notices,4);
        return page;
    }

    public List<Notice> getNewNoticeList() {
        NoticeExample example = new NoticeExample();
        example.setOrderByClause("ndate desc limit 3");
        List<Notice> notices = noticeMapper.selectByExample(example);
        return notices;
    }

    @Override
    public Notice getThisList(Integer nid) {
        return noticeMapper.selectByPrimaryKey(nid);
    }
}
