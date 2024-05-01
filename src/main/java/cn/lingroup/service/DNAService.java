package cn.lingroup.service;

import cn.lingroup.pojo.*;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:05
 * @Description:
 */
public interface DNAService {
    DNASpeciesChromosomeType getAllSpeciesAndTypeAndChromosome();

    List<String> ajaxGetTypeBySpecies(String species);

    List<String> ajaxGetChromosomeBySpecies(String species);

    List<String> ajaxGetTypeBySpeciesAndChromosome(String species, String chromosome);

    DNAStatisticInformation ajaxGetStatisticInformation(String species, String type);

    Page<DNAother> getDnaInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize);

    Page<DNAother> getDnaInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize);

    Page<DNAother> getDnaInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize);

    Page<DNAother> getDnaInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize);

    Page<DNAother> getDnaInformationBySequence(String species, String sequence, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcInformationBySequence(String species, String sequence, int pageNo, int pageSize);

    Page<DNAother> getDnaInformationByMtype(String type, int pageNo, int pageSize);

    Page<DNA5hmc> getDna5hmcDnaInformationByMtype(String type, int pageNo, int pageSize);
//    根据ID搜索
    DNAother getDnaInformationById(String id);
}
