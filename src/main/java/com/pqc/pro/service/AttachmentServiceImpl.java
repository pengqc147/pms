package com.pqc.pro.service;

import com.pqc.pro.bean.Attachment;
import com.pqc.pro.bean.AttachmentExample;
import com.pqc.pro.mapper.AttachmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AttachmentServiceImpl implements AttachmentService {

    @Resource
    private AttachmentMapper attachmentMapper;
    public void getInfo(Attachment attachment) {
        attachmentMapper.insert(attachment);
    }

    public List<Attachment> ShowAttachmentList() {
        return attachmentMapper.selectByExample(new AttachmentExample());
    }
}
