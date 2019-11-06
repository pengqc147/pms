package com.pqc.usual.service;

import com.github.pagehelper.PageInfo;
import com.pqc.usual.bean.BaoXiao;

import java.util.Map;

public interface BaoXiaoService {
    void saveBaoXiaoInfo(BaoXiao baoXiao);

    PageInfo<BaoXiao> showBaoXiaoInfo(Integer eid, Integer pageNum, Map<String, Object> search);
}
