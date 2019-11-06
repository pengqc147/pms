package com.pqc.usual.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pqc.common.PageCut;
import com.pqc.usual.bean.BaoXiao;
import com.pqc.usual.bean.BaoXiaoExample;
import com.pqc.usual.mapper.BaoXiaoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class BaoXiaoServiceImpl implements BaoXiaoService {

    @Resource
    private BaoXiaoMapper baoXiaoMapper;

    public void saveBaoXiaoInfo(BaoXiao baoXiao) {
        baoXiao.setBxstatus(0);
        String bxid = UUID.randomUUID().toString().replaceAll("-", "");
        baoXiao.setBxid(bxid);
        baoXiaoMapper.insert(baoXiao);
    }

    public PageInfo<BaoXiao> showBaoXiaoInfo(Integer eid, Integer pageNum, Map<String, Object> search) {
        BaoXiaoExample example = new BaoXiaoExample();
        BaoXiaoExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFkEqualTo(eid);
        String status = (String)search.get("status");
        if(status != null && status != "") {
            //转为整数类型
            criteria.andBxstatusEqualTo(Integer.parseInt(status));
        }
        String keyword = (String)search.get("like_keyword");
        if(keyword != null && keyword != ""){
            criteria.andBxremarkLike("%"+keyword+"%");
        }
        /*Map<String, String> mybatisMap = PageCut.findSearchIsLike(search);
        String status = mybatisMap.get("status");
        if(status != null && status != "") {
            //转为整数类型
            criteria.andBxstatusEqualTo(Integer.parseInt(status));
        }
        String keyword = mybatisMap.get("like_keyword");
        if(keyword != null && keyword != ""){
            criteria.andBxremarkLike(keyword);
        }*/
        PageHelper.startPage(pageNum,4);
        List<BaoXiao> baoXiaos = baoXiaoMapper.selectByExample(example);
        PageInfo<BaoXiao> page = new PageInfo<BaoXiao>(baoXiaos,4);
        return page;
    }


}
