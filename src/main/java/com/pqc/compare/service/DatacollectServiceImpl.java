package com.pqc.compare.service;

import com.pqc.compare.bean.Datacollect;
import com.pqc.compare.bean.DatacollectExample;
import com.pqc.compare.mapper.DatacollectMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class DatacollectServiceImpl implements DatacollectService {

    @Resource
    private DatacollectMapper datacollectMapper;

    public void saveInfo(Datacollect datacollect) {
        datacollectMapper.insert(datacollect);
    }


    public List<Datacollect> getDatacollectList(Date datime) {
        DatacollectExample example = new DatacollectExample();
        DatacollectExample.Criteria criteria = example.createCriteria();
        criteria.andDatimeEqualTo(datime);
        return datacollectMapper.selectByExample(example);
    }
}
