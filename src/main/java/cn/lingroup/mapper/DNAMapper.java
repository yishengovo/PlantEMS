package cn.lingroup.mapper;

import cn.lingroup.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:14
 * @Description:
 */
public interface DNAMapper {
    BrowserOverviewPojo queryOverviewInfo(@Param("species") String species, @Param("type") String type);

    List<String> queryAllSpecies();

    List<String> queryAllChromosome();

    List<String> queryAllTypes();

    List<String> queryTypeBySpecies(@Param("species") String species);

    List<String> queryChromosomeBySpecies(@Param("species") String species);

    List<String> queryTypeBySpeciesAndChromosome(@Param("species") String species, @Param("chromosome") String chromosome);

    List<Figure1Pojo> queryFigure1InfoDnaOther(@Param("species") String species, @Param("type") String type);

    List<Figure2Pojo> queryFigure2InfoDnaOther(@Param("species") String species, @Param("type") String type);

    List<Figure3Pojo> queryFigure3InfoDnaOther(@Param("species") String species, @Param("type") String type);

    List<Figure4Pojo> queryFigure4InfoDnaOther(@Param("species") String species, @Param("type") String type);

    List<Figure1Pojo> queryFigure1InfoDna5hmc(@Param("species") String species, @Param("type") String type);

    List<Figure2Pojo> queryFigure2InfoDna5hmc(@Param("species") String species, @Param("type") String type);


    List<DNAother> queryDnaOtherInfoBySpeciesAndType(@Param("species") String species, @Param("type") String type);

    List<DNAother> queryDnaOtherInfoBySpeciesAndTypeAndGeneName(@Param("species") String species, @Param("type") String type, @Param("geneName") String geneName);

    List<DNAother> queryDnaOtherInformationBySpeciesChromosomeAndType(@Param("species") String species, @Param("chromosome") String chromosome, @Param("type") String type, @Param("start") int start, @Param("end") int end);

    List<DNAother> queryDnaOtherInformationBySpeciesChromosome(@Param("species") String species, @Param("chromosome") String chromosome, @Param("start") int start, @Param("end") int end);

    List<DNAother> queryDnaOtherInformationBySpeciesSequence(@Param("species") String species, @Param("sequence") String sequence);

    List<DNAother> queryDnaOtherInformationByType(@Param("type") String type);
//    根据ID搜索
    DNAother queryDnaOtherInformationById(@Param("id") String id);
    List<DNA5hmc> queryDna5hmcInfoBySpeciesAndType(@Param("species") String species, @Param("type") String type);

    List<DNA5hmc> queryDna5hmcInfoBySpeciesAndTypeAndGeneName(@Param("species") String species, @Param("type") String type, @Param("geneName") String geneName);

    List<DNA5hmc> queryDna5hmcInformationBySpeciesChromosomeAndType(@Param("species") String species, @Param("chromosome") String chromosome, @Param("type") String type, @Param("start") int start, @Param("end") int end);

    List<DNA5hmc> queryDna5hmcInformationBySpeciesChromosome(@Param("species") String species, @Param("chromosome") String chromosome, @Param("start") int start, @Param("end") int end);

    List<DNA5hmc> queryDna5hmcInformationBySpeciesSequence(@Param("species") String species, @Param("sequence") String sequence);

    List<DNA5hmc> queryDna5hmcOtherInformationByType(@Param("type") String type);


}
