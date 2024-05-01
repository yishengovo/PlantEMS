package cn.lingroup.controller;

import cn.lingroup.pojo.*;
import cn.lingroup.service.DNAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:02
 * @Description:
 */
@Controller
@RequestMapping("/dna")
public class DNAController {

    @Autowired
    DNAService dnaService;

    @RequestMapping("/getAllSpeciesAndTypeAndChromosome")
    public String getAllSpeciesAndTypeAndChromosome(Model model) {
        DNASpeciesChromosomeType allSpeciesAndTypeAndChromosome = dnaService.getAllSpeciesAndTypeAndChromosome();
        model.addAttribute("stc", allSpeciesAndTypeAndChromosome);
        return "dna/dnaIndex";
    }

    @RequestMapping("/getAllSpeciesAndType")
    public String getAllSpeciesAndType(Model model) {
        DNASpeciesChromosomeType allSpeciesAndTypeAndChromosome = dnaService.getAllSpeciesAndTypeAndChromosome();
        model.addAttribute("stc", allSpeciesAndTypeAndChromosome);
        return "dna/dnaBrowse";
    }

    @ResponseBody
    @RequestMapping("/ajaxGetStatisticInformation")
    public DNAStatisticInformation ajaxGetStatisticInformation(@RequestParam("species") String species, @RequestParam("type") String type) {
        return dnaService.ajaxGetStatisticInformation(species, type);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetTypeBySpecies")
    public List<String> ajaxGetTypeBySpecies(@RequestParam("species") String species) {
        return dnaService.ajaxGetTypeBySpecies(species);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetChromosomeBySpecies")
    public List<String> ajaxGetChromosomeBySpecies(@RequestParam("species") String species) {
        return dnaService.ajaxGetChromosomeBySpecies(species);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetTypeBySpeciesAndChromosome")
    public List<String> ajaxGetTypeBySpeciesAndChromosome(@RequestParam("species") String species,
                                                          @RequestParam("chromosome") String chromosome) {
        return dnaService.ajaxGetTypeBySpeciesAndChromosome(species, chromosome);
    }


    @RequestMapping("/getDnaInformationBySpeciesAndMtypeAndGeneName")
    public String getDnaInformationBySpeciesAndMtypeAndGeneName(@RequestParam("species") String species, @RequestParam("modification_type") String type,
                                                                @RequestParam("gene_name") String geneName,
                                                                @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                                @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                                Model model) {
        if ("Oryza sativa ssp. Nipponbare".equals(species) && "5hmc".equals(type)) {
            Page<DNA5hmc> page;
            if ("Default all".equals(geneName)) {
                page = dnaService.getDna5hmcInformationBySpeciesAndMtype(species, type, pageNo, pageSize);
            } else {
                page = dnaService.getDna5hmcInformationBySpeciesAndMtypeAndGeneName(species, type, geneName, pageNo, pageSize);
            }
            setUrlToPage(page, species, type, geneName);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(1);
            parameter.setSpecies(species);
            parameter.setType(type);
            parameter.setGeneName(geneName);
            model.addAttribute("para", parameter);
            return "dna/dna5hmcQueryResult";
        } else {
            Page<DNAother> page;
            if ("Default all".equals(geneName)) {
                //说明并没有输入gene name，查询全部的gene
                page = dnaService.getDnaInformationBySpeciesAndMtype(species, type, pageNo, pageSize);
            } else {
                //说明要使用物种，修饰类型，基因名进行查询
                page = dnaService.getDnaInformationBySpeciesAndMtypeAndGeneName(species, type, geneName, pageNo, pageSize);
            }
            setUrlToPage(page, species, type, geneName);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(1);
            parameter.setSpecies(species);
            parameter.setType(type);
            parameter.setGeneName(geneName);
            model.addAttribute("para", parameter);
            return "dna/dnaQueryResult";
        }

    }

    @RequestMapping("/getDnaInformationBySpeciesChromosomeAndType")
    public String getDnaInformationBySpeciesChromosomeAndType(@RequestParam("species") String species, @RequestParam("chromosome") String chromosome,
                                                              @RequestParam("modification_type") String type,
                                                              @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                              @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                              @RequestParam(value = "from") String from,
                                                              @RequestParam(value = "to") String to,
                                                              Model model) {
        int start = 0;
        int end = Integer.MAX_VALUE;
        if (!"Default all".equals(from)) {
            start = Integer.parseInt(from);
        }
        if (!"Default all".equals(to)) {
            end = Integer.parseInt(to);
        }
        if ("Oryza sativa ssp. Nipponbare".equals(species) && "5hmc".equals(type)) {
            Page<DNA5hmc> page;
            page = dnaService.getDna5hmcInformationBySpeciesChromosome(species, chromosome, start, end, pageNo, pageSize);
            setUrlToPage1(page, species, chromosome, type, from, to);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(2);
            parameter.setSpecies(species);
            parameter.setChromosome(chromosome);
            parameter.setType(type);
            parameter.setFrom(from);
            parameter.setTo(to);
            model.addAttribute("para", parameter);
            return "dna/dna5hmcQueryResult";
        } else {
            Page<DNAother> page;
            if ("all".equals(type)) {
                page = dnaService.getDnaInformationBySpeciesChromosome(species, chromosome, start, end, pageNo, pageSize);
            } else {
                page = dnaService.getDnaInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end, pageNo, pageSize);
            }
            setUrlToPage1(page, species, chromosome, type, from, to);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(2);
            parameter.setSpecies(species);
            parameter.setChromosome(chromosome);
            parameter.setType(type);
            parameter.setFrom(from);
            parameter.setTo(to);
            model.addAttribute("para", parameter);
            return "dna/dnaQueryResult";
        }


    }

    @RequestMapping("/getDnaInformationBySequence")
    public String getDnaInformationBySequence(@RequestParam("species") String species,
                                              @RequestParam("sequence") String sequence,
                                              @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                              @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                              Model model) {
//        if ("Oryza sativa ssp. Nipponbare".equals(species)){
//            Page<DNA5hmc> page = dnaService.getDna5hmcInformationBySequence(species, sequence, pageNo, pageSize);
//            setUrlToPage2(page,species,sequence);
//            model.addAttribute("page",page);
//            DNAQueryParameter parameter = new DNAQueryParameter();
//            parameter.setFlag(3);
//            parameter.setSpecies(species);
//            parameter.setSequence(sequence);
//            model.addAttribute("para",parameter);
//            return "dna/dna5hmcQueryResult";
//        }else {
        Page<DNAother> page = dnaService.getDnaInformationBySequence(species, sequence, pageNo, pageSize);
        setUrlToPage2(page, species, sequence);
        model.addAttribute("page", page);
        DNAQueryParameter parameter = new DNAQueryParameter();
        parameter.setFlag(3);
        parameter.setSpecies(species);
        parameter.setSequence(sequence);
        model.addAttribute("para", parameter);
        return "dna/dnaQueryResult";
//        }
    }

    @RequestMapping("/getDnaInformationByType")
    public String getDnaInformationByType(@RequestParam("modification_type") String type,
                                          @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                          @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                          Model model) {
        if ("5hmc".equals(type)) {
            Page<DNA5hmc> page = dnaService.getDna5hmcDnaInformationByMtype(type, pageNo, pageSize);
            setUrlToPage3(page, type);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(4);
            parameter.setType(type);
            model.addAttribute("para", parameter);
            return "dna/dna5hmcQueryResult";
        } else {
            Page<DNAother> page = dnaService.getDnaInformationByMtype(type, pageNo, pageSize);
            setUrlToPage3(page, type);
            model.addAttribute("page", page);
            DNAQueryParameter parameter = new DNAQueryParameter();
            parameter.setFlag(4);
            parameter.setType(type);
            model.addAttribute("para", parameter);
            return "dna/dnaQueryResult";
        }
    }
    //根据ID搜索
    @RequestMapping("/getDnaInformationById")
    public String getDnaInformationById(@RequestParam("id_name") String id, Model model) {
//        String queryId = getQueryId(id);
        DNAother dnAother = dnaService.getDnaInformationById(id);
            model.addAttribute("page", dnAother);
            DNAQueryParameter parameter = new DNAQueryParameter();
//            查询类型为ID
            parameter.setFlag(5);
            parameter.setId(id);
            model.addAttribute("para", parameter);
            return "dna/dnaQueryByIdResult";
    }


    private <T> void setUrlToPage(Page<T> page, String species, String type, String geneName) {
        StringBuilder url = new StringBuilder("dna/getDnaInformationBySpeciesAndMtypeAndGeneName");
        if (species != null && type != null) {
            url.append("?species=").append(species);
            url.append("&modification_type=").append(type);
            url.append("&gene_name=").append(geneName);
        }
        page.setUrl(url.toString());
    }

    private <T> void setUrlToPage1(Page<T> page, String species, String chromosome, String type, String from, String to) {
        StringBuilder url = new StringBuilder("dna/getDnaInformationBySpeciesChromosomeAndType");
        if (species != null && chromosome != null) {
            url.append("?species=").append(species);
            url.append("&chromosome=").append(chromosome);
            if ("all".equals(type)) {
                url.append("&modification_type=all");
            } else {
                url.append("&modification_type=").append(type);
            }
            url.append("&from=").append(from);
            url.append("&to=").append(to);
        }
        page.setUrl(url.toString());
    }

    private <T> void setUrlToPage2(Page<T> page, String species, String sequence) {
        StringBuilder url = new StringBuilder("dna/getDnaInformationBySequence");
        if (species != null && sequence != null) {
            url.append("?species=").append(species);
            url.append("&sequence=").append(sequence);
        }
        page.setUrl(url.toString());
    }

    private <T> void setUrlToPage3(Page<T> page, String type) {
        StringBuilder url = new StringBuilder("dna/getDnaInformationByType");
        if (type != null) {
            url.append("?modification_type=").append(type);
        }
        page.setUrl(url.toString());
    }
//    根据id搜索的url
    private <T> void setUrlToPage4(Page<T> page, String id) {
        StringBuilder url = new StringBuilder("dna/getDnaInformationById");
        if (id != null) {
            url.append("?id=").append(id);
        }
        page.setUrl(url.toString());
    }
//    处理id的方法
    private <T> String getQueryId(String id) {
        // 构造前缀部分
        String prefix = "plantems_dna_6ma_";
        // 构造数字部分
        String numberPart = id;
        // 将数字部分填充为9位，不足的部分用0填充
        numberPart = String.format("%09d", Integer.parseInt(numberPart));
        // 拼接前缀和数字部分
        return prefix + numberPart;
    }
}
