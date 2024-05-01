package cn.lingroup.mapper;

import cn.lingroup.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan @Date: 2021/4/27-19:22 @Description:
 */
public interface RNAMapper {
  BrowserOverviewPojo queryOverviewInfo(
      @Param("species") String species, @Param("type") String type);

  List<String> queryAllSpecies();

  List<String> queryAllChromosome();

  List<String> queryAllTypes();

  List<String> queryTypeBySpecies(@Param("species") String species);

  List<String> queryChromosomeBySpecies(@Param("species") String species);

  List<String> queryTypeBySpeciesAndChromosome(
      @Param("species") String species, @Param("chromosome") String chromosome);

  List<Figure1Pojo> queryFigure1InfoRnaOther(
      @Param("species") String species, @Param("type") String type);

  List<Figure2Pojo> queryFigure2InfoRnaOther(
      @Param("species") String species, @Param("type") String type);

  List<Figure1Pojo> queryFigure1InfoRNAm5cArabiM6aBra(
      @Param("species") String species, @Param("type") String type);

  List<Figure2Pojo> queryFigure2InfoRNAm5cArabiM6aBra(
      @Param("species") String species, @Param("type") String type);

  List<RNAOther> queryRnaOtherInfoBySpeciesAndType(
      @Param("species") String species, @Param("type") String type);

  List<RNAOther> queryRnaOtherInfoBySpeciesAndTypeAndGeneName(
      @Param("species") String species,
      @Param("type") String type,
      @Param("geneName") String geneName);

  List<RNAOther> queryRnaOtherInformationBySpeciesChromosomeAndType(
      @Param("species") String species,
      @Param("chromosome") String chromosome,
      @Param("type") String type,
      @Param("start") int start,
      @Param("end") int end);

  List<RNAOther> queryRnaOtherInformationBySpeciesChromosome(
      @Param("species") String species,
      @Param("chromosome") String chromosome,
      @Param("start") int start,
      @Param("end") int end);

  List<RNAOther> queryRnaOtherInformationBySpeciesSequence(
      @Param("species") String species, @Param("sequence") String sequence);

  List<RNAOther> queryRnaOtherInformationByType(@Param("type") String type);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInfoBySpeciesAndType(
      @Param("species") String species, @Param("type") String type);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInfoBySpeciesAndTypeAndGeneName(
      @Param("species") String species,
      @Param("type") String type,
      @Param("geneName") String geneName);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInformationBySpeciesChromosomeAndType(
      @Param("species") String species,
      @Param("chromosome") String chromosome,
      @Param("type") String type,
      @Param("start") int start,
      @Param("end") int end);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInformationBySpeciesChromosome(
      @Param("species") String species,
      @Param("chromosome") String chromosome,
      @Param("start") int start,
      @Param("end") int end);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInformationBySpeciesSequence(
      @Param("species") String species, @Param("sequence") String sequence);

  List<RNAm5cArabiM6aBra> queryRNAm5cArabiM6aBraInformationByType(@Param("type") String type);

  // 根据id查询RNAOther
  RNAOther queryRnaOtherInformationById(@Param("id") String id);

  //    根据id查询RNAm5c
  RNAm5cArabiM6aBra queryRNAm5cArabiM6aBraInformationById(@Param("id") String id);
}
