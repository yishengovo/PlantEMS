package cn.lingroup.service;

import cn.lingroup.pojo.*;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/20-20:48
 * @Description:
 */
public interface ProteinService {
    ProteinSpeciesAndModificationType getAllSpeciesAndType();

    ProteinStatisticInformation ajaxGetStatisticInformation(String species, String type);

    List<String> ajaxGetTypeBySpecies(String species);

    Page<Protein> getInfoBySpeciesAndType(String species, String type, int pageNo, int pageSize);

    Page<Protein> getProteinInformationByAccession(String accession, int pageNo, int pageSize);

    Page<Protein> getProteinInformationByPeptide(String species, String peptide, int pageNo, int pageSize);

    Page<Protein> getProteinInformationByType(String type, int pageNo, int pageSize);
//    根据Id查询
    Protein getProteinInformationById(String id);
}
