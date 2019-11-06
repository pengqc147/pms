package com.pqc.compare.service;

import com.pqc.compare.bean.Datacollect;

import java.util.Date;
import java.util.List;

public interface DatacollectService {


    void saveInfo(Datacollect datacollect);

    List<Datacollect> getDatacollectList(Date datime);
}
