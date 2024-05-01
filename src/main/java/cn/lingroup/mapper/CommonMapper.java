package cn.lingroup.mapper;

import cn.lingroup.pojo.FigureLinkPojo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/23-17:09
 * @Description:
 */
public interface CommonMapper {
    FigureLinkPojo queryFigureLinkInfo(@Param("species") String species);
}
