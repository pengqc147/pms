package com.pqc.pro.service;


import com.pqc.pro.bean.Attachment;

import java.util.List;

public interface AttachmentService {


    void getInfo(Attachment attachment);

    List<Attachment> ShowAttachmentList();
}
