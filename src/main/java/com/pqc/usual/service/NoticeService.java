package com.pqc.usual.service;

import com.github.pagehelper.PageInfo;
import com.pqc.usual.bean.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
    void saveInfo(Notice notice);

    PageInfo<Notice> showAllNotice(Integer eid, Integer pageNum, Map<String, Object> search);

    List<Notice> getNewNoticeList();

    Notice getThisList(Integer nid);
}
