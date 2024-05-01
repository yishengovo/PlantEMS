package cn.lingroup.controller;

import cn.lingroup.pojo.*;
import cn.lingroup.service.ProteinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/20-20:46
 * @Description:
 */
@Controller
@RequestMapping("/protein")
public class ProteinController {
    @Autowired
    ProteinService proteinService;

    @RequestMapping("/getAllSpeciesAndTypeToBrowsePage")
    public String getAllSpeciesAndTypeToBrowsePage(Model model) {
        ProteinSpeciesAndModificationType allSpeciesAndType = proteinService.getAllSpeciesAndType();
        model.addAttribute("speciesAndTpyes", allSpeciesAndType);
        return "protein/proteinBrowse";
    }

    @RequestMapping("/getAllSpeciesAndType")
    public String getAllSpeciesAndType(Model model) {
        ProteinSpeciesAndModificationType allSpeciesAndType = proteinService.getAllSpeciesAndType();
        model.addAttribute("speciesAndTpyes", allSpeciesAndType);
        return "protein/proteinIndex";
    }

    @ResponseBody
    @RequestMapping("/ajaxGetStatisticInformation")
    public ProteinStatisticInformation ajaxGetStatisticInformation(@RequestParam("species") String species, @RequestParam("type") String type) {
        return proteinService.ajaxGetStatisticInformation(species, type);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetTypeBySpecies")
    public List<String> ajaxGetTypeBySpecies(@RequestParam("species") String species) {
        return proteinService.ajaxGetTypeBySpecies(species);
    }

    @RequestMapping("/getProteinInformationBySpeciesAndMtype")
    public String getProteinInformationBySpeciesAndMtype(@RequestParam("species") String species, @RequestParam("modification_type") String type,
                                                         @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                         @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                         Model model) {
        Page<Protein> page = proteinService.getInfoBySpeciesAndType(species, type, pageNo, pageSize);
        StringBuilder url = new StringBuilder("protein/getProteinInformationBySpeciesAndMtype");
        if (species != null && type != null) {
            url.append("?species=").append(species);
            url.append("&modification_type=").append(type);
        }
        page.setUrl(url.toString());
        model.addAttribute("page", page);
        ProteinQueryParameter parameter = new ProteinQueryParameter();
        parameter.setFlag(1);
        parameter.setSpecies(species);
        parameter.setType(type);
        model.addAttribute("para", parameter);
        return "protein/proteinQueryResult";
    }

    @RequestMapping("/getProteinInformationByAccession")
    public String getProteinInformationByAccession(@RequestParam("accession") String accession,
                                                   @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                   @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                   Model model) {
        Page<Protein> page = proteinService.getProteinInformationByAccession(accession, pageNo, pageSize);
        StringBuilder url = new StringBuilder("protein/getProteinInformationByAccession");
        if (accession != null) {
            url.append("?accession=").append(accession);
        }
        page.setUrl(url.toString());
        model.addAttribute("page", page);
        ProteinQueryParameter parameter = new ProteinQueryParameter();
        parameter.setFlag(3);
        parameter.setAccession(accession);
        model.addAttribute("para", parameter);
        return "protein/proteinQueryResult";
    }

    @RequestMapping("/getProteinInformationByPeptide")
    public String getProteinInformationByPeptide(@RequestParam("species") String species,
                                                 @RequestParam("peptide") String peptide,
                                                 @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                 @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                 Model model) {
        Page<Protein> page = proteinService.getProteinInformationByPeptide(species, peptide, pageNo, pageSize);
        StringBuilder url = new StringBuilder("protein/getProteinInformationByPeptide");
        if (species != null && peptide != null) {
            url.append("?species=").append(species);
            url.append("&peptide=").append(peptide);
        }
        page.setUrl(url.toString());
        model.addAttribute("page", page);
        ProteinQueryParameter parameter = new ProteinQueryParameter();
        parameter.setFlag(2);
        parameter.setSpecies(species);
        parameter.setPeptide(peptide);
        model.addAttribute("para", parameter);
        return "protein/proteinQueryResult";
    }

    @RequestMapping("/getProteinInformationByType")
    public String getProteinInformationByType(@RequestParam("modification_type") String type,
                                              @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                              @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                              Model model) {
        Page<Protein> page = proteinService.getProteinInformationByType(type, pageNo, pageSize);
        StringBuilder url = new StringBuilder("protein/getProteinInformationByType");
        if (type != null) {
            url.append("?modification_type=").append(type);
        }
        page.setUrl(url.toString());
        model.addAttribute("page", page);
        ProteinQueryParameter parameter = new ProteinQueryParameter();
        parameter.setFlag(4);
        parameter.setType(type);
        model.addAttribute("para", parameter);
        return "protein/proteinQueryResult";
    }

    //根据ID搜索
    @RequestMapping("/getProteinById")
    public String getDnaInformationById(@RequestParam("id_name") String id, Model model) {
//        String queryId = getQueryId(id);
        Protein protein = proteinService.getProteinInformationById(id);
        model.addAttribute("protein", protein);
        ProteinQueryParameter parameter = new ProteinQueryParameter();
        parameter.setFlag(5);
        parameter.setId(id);
        model.addAttribute("para", parameter);
        return "protein/proteinQueryByIdResult";
    }
    //    处理id的方法
    private <T> String getQueryId(String id) {
        // 构造前缀部分
        String prefix = "plantems_protein_";
        // 构造数字部分
        String numberPart = id;
        // 将数字部分填充为9位，不足的部分用0填充
        numberPart = String.format("%09d", Integer.parseInt(numberPart));
        // 拼接前缀和数字部分
        return prefix + numberPart;
    }
}
