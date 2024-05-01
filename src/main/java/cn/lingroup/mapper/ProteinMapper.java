package cn.lingroup.mapper;

import cn.lingroup.pojo.BrowserOverviewPojo;
import cn.lingroup.pojo.Figure3Pojo;
import cn.lingroup.pojo.Figure4Pojo;
import cn.lingroup.pojo.Protein;
import org.apache.commons.fileupload.util.LimitedInputStream;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/20-22:01
 * @Description:
 */
public interface ProteinMapper {

    BrowserOverviewPojo queryOverviewInfo(@Param("species") String species, @Param("type") String type);

    List<String> queryFigure3Info(@Param("species") String species, @Param("type") String type);

    List<String> queryFigure4Info(@Param("species") String species, @Param("type") String type);

    List<String> queryAllSpecies();

    List<String> queryAllTypes();

    List<String> ajaxQueryTypesBySpecies(@Param("species") String species);

    List<Protein> queryInfoBySpeciesAndType(@Param("species") String species, @Param("type") String type);

    List<Protein> queryInfoByAccession(@Param("accession") String accession);

    List<Protein> queryInfoByPeptide(@Param("species") String species, @Param("peptide") String peptide);

    List<Protein> queryInfoByType(@Param("type") String type);

//    根据ID查询
    Protein queryInfoById(@Param("id") String id);
}
