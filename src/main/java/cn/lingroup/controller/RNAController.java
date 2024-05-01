package cn.lingroup.controller;

import cn.lingroup.pojo.*;
import cn.lingroup.service.RNAService;
import com.alibaba.druid.support.spring.stat.SpringStatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/27-19:11
 * @Description:
 */
@Controller
@RequestMapping("/rna")
public class RNAController {
    @Autowired
    RNAService rnaService;

    @RequestMapping("/getAllSpeciesAndType")
    public String getAllSpeciesAndType(Model model) {
        RNASpeciesChromosomeType stc = rnaService.getAllSpeciesAndTypeAndChromosome();
        model.addAttribute("stc", stc);
        return "rna/rnaBrowse";
    }

    @RequestMapping("/getAllSpeciesAndTypeAndChromosome")
    public String getAllSpeciesAndTypeAndChromosome(Model model) {
        RNASpeciesChromosomeType stc = rnaService.getAllSpeciesAndTypeAndChromosome();
        model.addAttribute("stc", stc);
        return "rna/rnaIndex";
    }

    @ResponseBody
    @RequestMapping("/ajaxGetStatisticInformation")
    public RNAStatisticInformation ajaxGetStatisticInformation(@RequestParam("species") String species, @RequestParam("type") String type) {
        return rnaService.ajaxGetStatisticInformation(species, type);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetTypeBySpecies")
    public List<String> ajaxGetTypeBySpecies(@RequestParam("species") String species) {
        return rnaService.ajaxGetTypeBySpecies(species);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetChromosomeBySpecies")
    public List<String> ajaxGetChromosomeBySpecies(@RequestParam("species") String species) {
        return rnaService.ajaxGetChromosomeBySpecies(species);
    }

    @ResponseBody
    @RequestMapping("/ajaxGetTypeBySpeciesAndChromosome")
    public List<String> ajaxGetTypeBySpeciesAndChromosome(@RequestParam("species") String species,
                                                          @RequestParam("chromosome") String chromosome) {
        return rnaService.ajaxGetTypeBySpeciesAndChromosome(species, chromosome);
    }

    @RequestMapping("/getRnaInformationBySpeciesAndMtypeAndGeneName")
    public String getRnaInformationBySpeciesAndMtypeAndGeneName(@RequestParam("species") String species, @RequestParam("modification_type") String type,
                                                                @RequestParam("gene_name") String geneName,
                                                                @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                                                @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                                                Model model) {
        if ("Brassica rapa ssp chinensis".equals(species) || ("Arabidopsis thaliana".equals(species) && "m5C".equals(type))) {
            Page<RNAm5cArabiM6aBra> page;
            if ("Default all".equals(geneName)) {
                page = rnaService.getRNAm5cArabiM6aBraInformationBySpeciesAndMtype(species, type, pageNo, pageSize);
            } else {
                page = rnaService.getRNAm5cArabiM6aBraInformationBySpeciesAndMtypeAndGeneName(species, type, geneName, pageNo, pageSize);
            }
            setUrlToPage(page, species, type, geneName);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(1);
            parameter.setSpecies(species);
            parameter.setType(type);
            parameter.setGeneName(geneName);
            model.addAttribute("para", parameter);
            return "rna/rnaM5cM6aQueryResult";
        } else {
            Page<RNAOther> page;
            if ("Default all".equals(geneName)) {
                page = rnaService.getRnaOtherInformationBySpeciesAndMtype(species, type, pageNo, pageSize);
            } else {
                page = rnaService.getRnaOtherInformationBySpeciesAndMtypeAndGeneName(species, type, geneName, pageNo, pageSize);
            }
            setUrlToPage(page, species, type, geneName);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(1);
            parameter.setSpecies(species);
            parameter.setType(type);
            parameter.setGeneName(geneName);
            model.addAttribute("para", parameter);
            return "rna/rnaQueryResult";
        }
    }

    @RequestMapping("/getRnaInformationBySpeciesChromosomeAndType")
    public String getRnaInformationBySpeciesChromosomeAndType(@RequestParam("species") String species, @RequestParam("chromosome") String chromosome,
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
        if ("Brassica rapa ssp chinensis".equals(species) || ("Arabidopsis thaliana".equals(species) && "m5C".equals(type))
                || ("Arabidopsis thaliana".equals(species) && "chrMT".equals(chromosome) && "all".equals(type))) {
            Page<RNAm5cArabiM6aBra> page;
            if ("all".equals(type)) {
                page = rnaService.getRNAm5cArabiM6aBraInformationBySpeciesChromosome(species, chromosome, start, end, pageNo, pageSize);
            } else {
                page = rnaService.getRNAm5cArabiM6aBraInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end, pageNo, pageSize);
            }
            setUrlToPage1(page, species, chromosome, type, from, to);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(2);
            parameter.setSpecies(species);
            parameter.setChromosome(chromosome);
            parameter.setType(type);
            parameter.setFrom(from);
            parameter.setTo(to);
            model.addAttribute("para", parameter);
            return "rna/rnaM5cM6aQueryResult";
        } else {
            Page<RNAOther> page;
            if ("all".equals(type)) {
                page = rnaService.getRnaOtherInformationBySpeciesChromosome(species, chromosome, start, end, pageNo, pageSize);
            } else {
                page = rnaService.getRnaOtherInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end, pageNo, pageSize);
            }
            setUrlToPage1(page, species, chromosome, type, from, to);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(2);
            parameter.setSpecies(species);
            parameter.setChromosome(chromosome);
            parameter.setType(type);
            parameter.setFrom(from);
            parameter.setTo(to);
            model.addAttribute("para", parameter);
            return "rna/rnaQueryResult";
        }
    }

    @RequestMapping("/getRnaInformationBySequence")
    public String getRnaInformationBySequence(@RequestParam("species") String species,
                                              @RequestParam("sequence") String sequence,
                                              @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                              @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                              Model model) {
        if ("Brassica rapa ssp chinensis".equals(species)) {
            Page<RNAm5cArabiM6aBra> page = rnaService.getRNAm5cArabiM6aBraInformationBySequence(species, sequence, pageNo, pageSize);
            setUrlToPage2(page, species, sequence);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(3);
            parameter.setSpecies(species);
            parameter.setSequence(sequence);
            model.addAttribute("para", parameter);
            return "rna/rnaM5cM6aQueryResult";
        } else {
            Page<RNAOther> page = rnaService.getRnaOtherInformationBySequence(species, sequence, pageNo, pageSize);
            setUrlToPage2(page, species, sequence);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(3);
            parameter.setSpecies(species);
            parameter.setSequence(sequence);
            model.addAttribute("para", parameter);
            return "rna/rnaQueryResult";
        }
    }

    @RequestMapping("/getRnaInformationByType")
    public String getDnaInformationByType(@RequestParam("modification_type") String type,
                                          @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                          @RequestParam(value = "pageSize", defaultValue = "20") int pageSize,
                                          Model model) {
        //m5C只在一个表A中有，m6A在两个表中都有，其它的只存在于表B中
        if ("m5C".equals(type) || "m6A".equals(type)) {
            Page<RNAm5cArabiM6aBra> page = rnaService.getRNAm5cArabiM6aBraInformationByType(type, pageNo, pageSize);
            setUrlToPage3(page, type);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(4);
            parameter.setType(type);
            model.addAttribute("para", parameter);
            return "rna/rnaM5cM6aQueryResult";
        } else {
            Page<RNAOther> page = rnaService.getRnaOtherInformationByType(type, pageNo, pageSize);
            setUrlToPage3(page, type);
            model.addAttribute("page", page);
            RNAQueryParameter parameter = new RNAQueryParameter();
            parameter.setFlag(4);
            parameter.setType(type);
            model.addAttribute("para", parameter);
            return "rna/rnaQueryResult";
        }
    }

    //根据ID搜索
    @RequestMapping("/getRnaById")
    public String getRnaInformationById(@RequestParam("id_name") String id, Model model) {
        //截取id中的数字部分
        int idNumber = extractNumber(id);
//        如果大于16326，则查询rnam5c
        RNAQueryParameter parameter = new RNAQueryParameter();
        parameter.setFlag(5);
        parameter.setId(id);
        if (idNumber > 16326) {
            RNAm5cArabiM6aBra rnAm5cArabiM6aBra = rnaService.getRNAm5cArabiM6aBraInformationById(id);
            model.addAttribute("rna", rnAm5cArabiM6aBra);
            model.addAttribute("para", parameter);
            return "rna/rnaM5cM6aQueryByIdResult";
        }
        else {
            RNAOther rnaOther = rnaService.getRnaOtherInformationById(id);
            model.addAttribute("rna", rnaOther);
            model.addAttribute("para", parameter);
            return "rna/rnaQueryByIdResult";
        }
    }

    private <T> void setUrlToPage(Page<T> page, String species, String type, String geneName) {
        StringBuilder url = new StringBuilder("rna/getRnaInformationBySpeciesAndMtypeAndGeneName");
        if (species != null && type != null) {
            url.append("?species=").append(species);
            url.append("&modification_type=").append(type);
            url.append("&gene_name=").append(geneName);
        }
        page.setUrl(url.toString());
    }

    private <T> void setUrlToPage1(Page<T> page, String species, String chromosome, String type, String from, String to) {
        StringBuilder url = new StringBuilder("rna/getRnaInformationBySpeciesChromosomeAndType");
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
        StringBuilder url = new StringBuilder("rna/getRnaInformationBySequence");
        if (species != null && sequence != null) {
            url.append("?species=").append(species);
            url.append("&sequence=").append(sequence);
        }
        page.setUrl(url.toString());
    }

    private <T> void setUrlToPage3(Page<T> page, String type) {
        StringBuilder url = new StringBuilder("rna/getRnaInformationByType");
        if (type != null) {
            url.append("?modification_type=").append(type);
        }
        page.setUrl(url.toString());
    }

    //截取字符串中的数字
    private <T> int extractNumber(String originalString) {
        Pattern pattern = Pattern.compile("\\d+"); // 匹配一个或多个数字
        Matcher matcher = pattern.matcher(originalString);
        if (matcher.find()) {
            return Integer.parseInt(matcher.group()); // 返回第一个匹配到的数字
        }
        return 0; // 如果没有匹配到数字，则返回null
    }
}
