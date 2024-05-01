package cn.lingroup.service;

import cn.lingroup.pojo.*;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/27-19:35
 * @Description:
 */
public interface RNAService {

    RNASpeciesChromosomeType getAllSpeciesAndTypeAndChromosome();

    List<String> ajaxGetTypeBySpecies(String species);

    List<String> ajaxGetChromosomeBySpecies(String species);

    List<String> ajaxGetTypeBySpeciesAndChromosome(String species, String chromosome);

    RNAStatisticInformation ajaxGetStatisticInformation(String species, String type);

    Page<RNAOther> getRnaOtherInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize);

    Page<RNAOther> getRnaOtherInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize);

    Page<RNAOther> getRnaOtherInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize);

    Page<RNAOther> getRnaOtherInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize);

    Page<RNAOther> getRnaOtherInformationBySequence(String species, String sequence, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySequence(String species, String sequence, int pageNo, int pageSize);

    Page<RNAOther> getRnaOtherInformationByType(String type, int pageNo, int pageSize);

    Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationByType(String type, int pageNo, int pageSize);
    //根据id搜索RnaOther
    RNAOther getRnaOtherInformationById(String id);
    //根据Id搜索Rnam5c
    RNAm5cArabiM6aBra getRNAm5cArabiM6aBraInformationById(String id);
}
