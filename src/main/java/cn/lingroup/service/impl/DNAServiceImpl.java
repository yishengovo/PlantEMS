package cn.lingroup.service.impl;

import cn.lingroup.mapper.DNAMapper;
import cn.lingroup.pojo.*;
import cn.lingroup.service.DNAService;
import cn.lingroup.util.page.PageUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.annotation.ElementType;
import java.text.DecimalFormat;
import java.util.*;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:12
 * @Description:
 */
@Service
public class DNAServiceImpl implements DNAService {
    @Autowired
    DNAMapper dnaMapper;
    DNASpeciesChromosomeType dnaSpeciesChromosomeType;
    //缓存物种对应的修饰类型
    HashMap<String, List<String>> speciesAndItsTypeMap = new HashMap<>();
    //缓存物种对应的染色体
    HashMap<String, List<String>> speciesAndItsChromosomeMap = new HashMap<>();
    //缓存物种染色体对应的修饰类型(key为物种名_染色体名的拼接)
    HashMap<String, List<String>> speciesChromosomeAndTheirTypeMap = new HashMap<>();
    //缓存浏览页面查询物种和类型的统计信息
    HashMap<String, DNAStatisticInformation> dnaStatisticInformationMap = new HashMap<>();

    @Override
    public DNASpeciesChromosomeType getAllSpeciesAndTypeAndChromosome() {
        if (dnaSpeciesChromosomeType == null) {
            dnaSpeciesChromosomeType = new DNASpeciesChromosomeType();
            dnaSpeciesChromosomeType.setSpecies(dnaMapper.queryAllSpecies());
            dnaSpeciesChromosomeType.setChromosomes(dnaMapper.queryAllChromosome());
            dnaSpeciesChromosomeType.setTypes(dnaMapper.queryAllTypes());
        }
        return dnaSpeciesChromosomeType;
    }

    @Override
    public List<String> ajaxGetTypeBySpecies(String species) {
        if (!speciesAndItsTypeMap.containsKey(species)) {
            List<String> list = dnaMapper.queryTypeBySpecies(species);
            speciesAndItsTypeMap.put(species, list);
        }
        return speciesAndItsTypeMap.get(species);
    }

    @Override
    public List<String> ajaxGetChromosomeBySpecies(String species) {
        if (!speciesAndItsChromosomeMap.containsKey(species)) {
            List<String> list = dnaMapper.queryChromosomeBySpecies(species);
            speciesAndItsChromosomeMap.put(species, list);
        }
        return speciesAndItsChromosomeMap.get(species);
    }

    @Override
    public List<String> ajaxGetTypeBySpeciesAndChromosome(String species, String chromosome) {
        String tempName = species + "$" + chromosome;
        if (!speciesChromosomeAndTheirTypeMap.containsKey(tempName)) {
            List<String> list = dnaMapper.queryTypeBySpeciesAndChromosome(species, chromosome);
            speciesChromosomeAndTheirTypeMap.put(tempName, list);
        }
        return speciesChromosomeAndTheirTypeMap.get(tempName);
    }

    @Override
    public DNAStatisticInformation ajaxGetStatisticInformation(String species, String type) {
        String tempName = species + "$" + type;
        if (!dnaStatisticInformationMap.containsKey(tempName)) {
            List<Figure1Pojo> figure1Pojos;
            List<Figure2Pojo> figure2Pojos;
            List<Figure3Pojo> figure3Pojos;
            List<Figure4Pojo> figure4Pojos;
            if (("Oryza sativa ssp. Nipponbare".equals(species) && "5hmc".equals(type))) {
                figure1Pojos = dnaMapper.queryFigure1InfoDna5hmc(species, type);
                figure2Pojos = dnaMapper.queryFigure2InfoDna5hmc(species, type);
                figure3Pojos = null;
                figure4Pojos = null;
            } else {
                figure1Pojos = dnaMapper.queryFigure1InfoDnaOther(species, type);
                figure2Pojos = dnaMapper.queryFigure2InfoDnaOther(species, type);
                figure3Pojos = dnaMapper.queryFigure3InfoDnaOther(species, type);
                figure4Pojos = dnaMapper.queryFigure4InfoDnaOther(species, type);
            }
            DNAStatisticInformation dnaStatisticInformation = new DNAStatisticInformation();

            float tempFigure1Sum = 0;
            List<String> figure1NameList = new ArrayList<>();
            List<Float> figure1ValueList = new ArrayList<>();
            DecimalFormat format = new DecimalFormat("##0.0000");
            //1.现将figure1的名字放在rnaStatisticInformation对象中，并转换String的value成为int，并计算总和
            for (Figure1Pojo ele1 : figure1Pojos) {
                figure1NameList.add(ele1.getName());
                figure1ValueList.add(Float.parseFloat(ele1.getValueString()));
                tempFigure1Sum += Float.parseFloat(ele1.getValueString());
            }
            for (int i = 0; i < figure1ValueList.size(); i++) {
                figure1ValueList.set(i, Float.parseFloat(format.format(figure1ValueList.get(i) / tempFigure1Sum)));
            }
            dnaStatisticInformation.setFigure1NameList(figure1NameList);
            dnaStatisticInformation.setFigure1ValueList(figure1ValueList);
            //figure2
            List<String> figure2NameList = new ArrayList<>();
            List<Float> figure2ValueList = new ArrayList<>();
            for (Figure2Pojo ele2 : figure2Pojos) {
                if ("NA".equals(ele2.getName())) {
                    figure2NameList.add("intergenic");
                } else {
                    figure2NameList.add(ele2.getName());
                }
                figure2ValueList.add(Float.parseFloat(ele2.getValueString()));
            }
            dnaStatisticInformation.setFigure2NameList(figure2NameList);
            dnaStatisticInformation.setFigure2ValueList(figure2ValueList);

            if (!("Oryza sativa ssp. Nipponbare".equals(species) && "5hmc".equals(type))) {
                //figure3
                //定义一个map来存储对应coverage的组别对应的值
                HashMap<Integer, Integer> tempMap3 = new HashMap<>();
                List<Integer> figure3NameList = new ArrayList<>();
                List<Integer> figure3ValueList = new ArrayList<>();
                for (Figure3Pojo ele3 : figure3Pojos) {
                    figure3NameList.add(Integer.parseInt(ele3.getName()));
                    tempMap3.put(Integer.parseInt(ele3.getName()), Integer.parseInt(ele3.getValueString()));
                }
                Collections.sort(figure3NameList);
                for (int e : figure3NameList) {
                    figure3ValueList.add(tempMap3.get(e));
                }
                dnaStatisticInformation.setFigure3NameList(figure3NameList);
                dnaStatisticInformation.setFigure3ValueList(figure3ValueList);
                //figure4
                HashMap<Integer, Integer> tempMap4 = new HashMap<>();
                List<Integer> figure4NameList = new ArrayList<>();
                List<Integer> figure4ValueList = new ArrayList<>();
                for (Figure4Pojo ele4 : figure4Pojos) {
                    figure4NameList.add(Integer.parseInt(ele4.getName()));
                    tempMap4.put(Integer.parseInt(ele4.getName()), Integer.parseInt(ele4.getValueString()));
                }
                Collections.sort(figure4NameList);
                for (int e : figure4NameList) {
                    figure4ValueList.add(tempMap4.get(e));
                }
                dnaStatisticInformation.setFigure4NameList(figure4NameList);
                dnaStatisticInformation.setFigure4ValueList(figure4ValueList);

//                System.out.println(figure1NameList.toString());
//                System.out.println(figure1ValueList.toString());
//                System.out.println(figure2NameList.toString());
//                System.out.println(figure2ValueList.toString());
//
//                System.out.println(figure3NameList.toString());
//                System.out.println(figure3ValueList.toString());
//                System.out.println(figure4NameList.toString());
//                System.out.println(figure4ValueList.toString());
            }
            dnaStatisticInformation.setOverviewInfo(dnaMapper.queryOverviewInfo(species, type));
            dnaStatisticInformationMap.put(tempName, dnaStatisticInformation);
        }
        return dnaStatisticInformationMap.get(tempName);
    }

    @Override
    public Page<DNAother> getDnaInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNAother> list = dnaMapper.queryDnaOtherInfoBySpeciesAndType(species, type);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNA5hmc> getDna5hmcInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNA5hmc> list = dnaMapper.queryDna5hmcInfoBySpeciesAndType(species, type);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }


    @Override
    public Page<DNAother> getDnaInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNAother> list = dnaMapper.queryDnaOtherInfoBySpeciesAndTypeAndGeneName(species, type, geneName);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);

    }

    @Override
    public Page<DNA5hmc> getDna5hmcInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNA5hmc> list = dnaMapper.queryDna5hmcInfoBySpeciesAndTypeAndGeneName(species, type, geneName);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNAother> getDnaInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNAother> list = dnaMapper.queryDnaOtherInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);

    }

    @Override
    public Page<DNA5hmc> getDna5hmcInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNA5hmc> list = dnaMapper.queryDna5hmcInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNAother> getDnaInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNAother> list = dnaMapper.queryDnaOtherInformationBySpeciesChromosome(species, chromosome, start, end);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNA5hmc> getDna5hmcInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNA5hmc> list = dnaMapper.queryDna5hmcInformationBySpeciesChromosome(species, chromosome, start, end);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNAother> getDnaInformationBySequence(String species, String sequence, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String temp = "%" + sequence + "%";
        List<DNAother> list = dnaMapper.queryDnaOtherInformationBySpeciesSequence(species, temp);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNA5hmc> getDna5hmcInformationBySequence(String species, String sequence, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String temp = "%" + sequence + "%";
        List<DNA5hmc> list = dnaMapper.queryDna5hmcInformationBySpeciesSequence(species, temp);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNAother> getDnaInformationByMtype(String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<DNAother> list = dnaMapper.queryDnaOtherInformationByType(type);
        List<DNAother> list1 = transformContextMiddleToRedDNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<DNA5hmc> getDna5hmcDnaInformationByMtype(String type, int pageNo, int pageSize) {
        if ("5hmc".equals(type)) {
            type = "NA";
        }
        PageHelper.startPage(pageNo, pageSize);
        List<DNA5hmc> list = dnaMapper.queryDna5hmcOtherInformationByType(type);
        List<DNA5hmc> list1 = transformContextMiddleToRedDNA5hmc(list);
        return PageUtils.getPage(list1);
    }

    private List<DNAother> transformContextMiddleToRedDNAother(List<DNAother> list) {
        StringBuilder stringBuilder = new StringBuilder();
        for (DNAother dnAother : list) {
            String context = dnAother.getContext();
            if (!"NA".equals(context)) {
                for (int i = 0; i < context.length(); i++) {
                    if (i == ((context.length() - 1) / 2)) {
                        //<span style='color: red'></span>
                        stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                    } else {
                        stringBuilder.append(context.charAt(i));
                    }
                }
                dnAother.setContext(stringBuilder.toString());
                stringBuilder.setLength(0);
            }
        }
        return list;
    }

    private List<DNA5hmc> transformContextMiddleToRedDNA5hmc(List<DNA5hmc> list) {
        StringBuilder stringBuilder = new StringBuilder();
        for (DNA5hmc dna5hmc : list) {
            String context = dna5hmc.getContext();
            if (!"NA".equals(context)) {
                for (int i = 0; i < context.length(); i++) {
                    if (i == ((context.length() - 1) / 2)) {
                        //<span style='color: red'></span>
                        stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                    } else {
                        stringBuilder.append(context.charAt(i));
                    }
                }
                dna5hmc.setContext(stringBuilder.toString());
                stringBuilder.setLength(0);
            }
        }
        return list;
    }

    @Override
    public DNAother getDnaInformationById(String id) {
        DNAother dnAother = dnaMapper.queryDnaOtherInformationById(id);
        StringBuilder stringBuilder = new StringBuilder();
//        处理context
        if (Objects.isNull(dnAother)) {
            return null;
        }
        String context = dnAother.getContext();
        if (!"NA".equals(context)) {
            for (int i = 0; i < context.length(); i++) {
                if (i == ((context.length() - 1) / 2)) {
                    //<span style='color: red'></span>
                    stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                } else {
                    stringBuilder.append(context.charAt(i));
                }
            }
            dnAother.setContext(stringBuilder.toString());
            stringBuilder.setLength(0);
        }
        return dnAother;
    }
}
