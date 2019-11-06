package com.pqc.pro.service;

import com.pqc.pro.bean.Analysis;

import java.util.List;

public interface AnalysisService {
    void getInfo(Analysis analysis);

    List<Analysis> showAnalysisList();
}
