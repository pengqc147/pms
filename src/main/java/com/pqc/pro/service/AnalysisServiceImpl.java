package com.pqc.pro.service;

import com.pqc.pro.bean.Analysis;
import com.pqc.pro.bean.AnalysisExample;
import com.pqc.pro.mapper.AnalysisMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AnalysisServiceImpl implements AnalysisService {

    @Resource
    private AnalysisMapper analysisMapper;
    public void getInfo(Analysis analysis) {
        analysisMapper.insert(analysis);
    }

    public List<Analysis> showAnalysisList() {
        return analysisMapper.selectByExample(new AnalysisExample());
    }
}
