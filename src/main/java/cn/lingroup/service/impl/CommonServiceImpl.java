package cn.lingroup.service.impl;

import cn.lingroup.mapper.CommonMapper;
import cn.lingroup.pojo.FigureLinkPojo;
import cn.lingroup.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/24-15:45
 * @Description:
 */
@Service
public class CommonServiceImpl implements CommonService {

    @Autowired
    CommonMapper commonMapper;

    @Override
    public FigureLinkPojo getFigureLinkInfo(String species) {
        FigureLinkPojo figureLinkPojo = commonMapper.queryFigureLinkInfo(species);
        System.out.println(figureLinkPojo);
        return figureLinkPojo;
    }
}
