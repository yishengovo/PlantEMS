package cn.lingroup.service.impl;

import cn.lingroup.mapper.RNAMapper;
import cn.lingroup.pojo.*;
import cn.lingroup.service.RNAService;
import cn.lingroup.util.page.PageUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/27-19:36
 * @Description:
 */
@Service
public class RNAServiceImpl implements RNAService {
    @Autowired
    RNAMapper rnaMapper;
    RNASpeciesChromosomeType rnaSpeciesChromosomeType;
    //缓存物种对应的修饰类型
    HashMap<String, List<String>> speciesAndItsTypeMap = new HashMap<>();
    //缓存物种对应的染色体
    HashMap<String, List<String>> speciesAndItsChromosomeMap = new HashMap<>();
    //缓存物种染色体对应的修饰类型(key为物种名_染色体名的拼接)
    HashMap<String, List<String>> speciesChromosomeAndTheirTypeMap = new HashMap<>();
    //缓存浏览页面查询物种和类型的统计信息
    HashMap<String, RNAStatisticInformation> rnaStatisticInformationMap = new HashMap<>();

    @Override
    public RNASpeciesChromosomeType getAllSpeciesAndTypeAndChromosome() {
        if (rnaSpeciesChromosomeType == null) {
            rnaSpeciesChromosomeType = new RNASpeciesChromosomeType();
            rnaSpeciesChromosomeType.setChromosomes(rnaMapper.queryAllChromosome());
            rnaSpeciesChromosomeType.setSpecies(rnaMapper.queryAllSpecies());
            rnaSpeciesChromosomeType.setTypes(rnaMapper.queryAllTypes());
        }
        return rnaSpeciesChromosomeType;
    }

    @Override
    public List<String> ajaxGetTypeBySpecies(String species) {
        if (!speciesAndItsTypeMap.containsKey(species)) {
            List<String> list = rnaMapper.queryTypeBySpecies(species);
            speciesAndItsTypeMap.put(species, list);
        }
        return speciesAndItsTypeMap.get(species);
    }

    @Override
    public List<String> ajaxGetChromosomeBySpecies(String species) {
        if (!speciesAndItsChromosomeMap.containsKey(species)) {
            List<String> list = rnaMapper.queryChromosomeBySpecies(species);
            speciesAndItsChromosomeMap.put(species, list);
        }
        return speciesAndItsChromosomeMap.get(species);
    }

    @Override
    public List<String> ajaxGetTypeBySpeciesAndChromosome(String species, String chromosome) {
        String tempName = species + "$" + chromosome;
        if (!speciesChromosomeAndTheirTypeMap.containsKey(tempName)) {
            List<String> list = rnaMapper.queryTypeBySpeciesAndChromosome(species, chromosome);
            speciesChromosomeAndTheirTypeMap.put(tempName, list);
        }
        return speciesChromosomeAndTheirTypeMap.get(tempName);
    }

    @Override
    public RNAStatisticInformation ajaxGetStatisticInformation(String species, String type) {
        String tempName = species + "$" + type;
        if (!rnaStatisticInformationMap.containsKey(tempName)) {
            List<Figure1Pojo> figure1Pojos;
            List<Figure2Pojo> figure2Pojos;
            if (("Arabidopsis thaliana".equals(species) && "m5C".equals(type))) {
                figure1Pojos = rnaMapper.queryFigure1InfoRNAm5cArabiM6aBra(species, type);
                figure2Pojos = rnaMapper.queryFigure2InfoRNAm5cArabiM6aBra(species, type);
            } else if ("Brassica rapa ssp chinensis".equals(species) && "m6A".equals(type)) {
                figure1Pojos = rnaMapper.queryFigure1InfoRNAm5cArabiM6aBra(species, type);
                figure2Pojos = rnaMapper.queryFigure2InfoRNAm5cArabiM6aBra(species, type);
            } else {
                figure1Pojos = rnaMapper.queryFigure1InfoRnaOther(species, type);
                figure2Pojos = rnaMapper.queryFigure2InfoRnaOther(species, type);
            }
            RNAStatisticInformation rnaStatisticInformation = new RNAStatisticInformation();
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
            rnaStatisticInformation.setFigure1NameList(figure1NameList);
            rnaStatisticInformation.setFigure1ValueList(figure1ValueList);
            //将figure2的信息放入对象中
//            float tempFigure2Sum=0;
            List<String> figure2NameList = new ArrayList<>();
            List<Float> figure2ValueList = new ArrayList<>();
//            DecimalFormat format = new DecimalFormat("##0.0000");
            //1.现将figure1的名字放在rnaStatisticInformation对象中，并转换String的value成为int，并计算总和
            for (Figure2Pojo ele2 : figure2Pojos) {
                if ("NA".equals(ele2.getName())) {
                    figure2NameList.add("intergenic");
                } else {
                    figure2NameList.add(ele2.getName());
                }
                figure2ValueList.add(Float.parseFloat(ele2.getValueString()));
//                tempFigure2Sum += Float.parseFloat(ele2.getValueString());
            }
//            for (int i=0;i<figure2ValueList.size();i++){
//                figure2ValueList.set(i, figure2ValueList.get(i)/tempFigure2Sum);
//            }
            rnaStatisticInformation.setFigure2NameList(figure2NameList);
            rnaStatisticInformation.setFigure2ValueList(figure2ValueList);
            rnaStatisticInformation.setOverviewInfo(rnaMapper.queryOverviewInfo(species, type));
            rnaStatisticInformationMap.put(tempName, rnaStatisticInformation);
        }
        return rnaStatisticInformationMap.get(tempName);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAOther> list = rnaMapper.queryRnaOtherInfoBySpeciesAndType(species, type);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesAndMtype(String species, String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInfoBySpeciesAndType(species, type);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAOther> list = rnaMapper.queryRnaOtherInfoBySpeciesAndTypeAndGeneName(species, type, geneName);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesAndMtypeAndGeneName(String species, String type, String geneName, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInfoBySpeciesAndTypeAndGeneName(species, type, geneName);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAOther> list = rnaMapper.queryRnaOtherInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesChromosomeAndType(String species, String chromosome, String type, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInformationBySpeciesChromosomeAndType(species, chromosome, type, start, end);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAOther> list = rnaMapper.queryRnaOtherInformationBySpeciesChromosome(species, chromosome, start, end);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySpeciesChromosome(String species, String chromosome, int start, int end, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInformationBySpeciesChromosome(species, chromosome, start, end);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationBySequence(String species, String sequence, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String temp = "%" + sequence + "%";
        List<RNAOther> list = rnaMapper.queryRnaOtherInformationBySpeciesSequence(species, temp);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationBySequence(String species, String sequence, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String temp = "%" + sequence + "%";
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInformationBySpeciesSequence(species, temp);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAOther> getRnaOtherInformationByType(String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAOther> list = rnaMapper.queryRnaOtherInformationByType(type);
        List<RNAOther> list1 = transformContextMiddleToRedRNAother(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public Page<RNAm5cArabiM6aBra> getRNAm5cArabiM6aBraInformationByType(String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<RNAm5cArabiM6aBra> list = rnaMapper.queryRNAm5cArabiM6aBraInformationByType(type);
        List<RNAm5cArabiM6aBra> list1 = transformContextMiddleToRedRNAm5cArabiM6aBra(list);
        return PageUtils.getPage(list1);
    }

    @Override
    public RNAOther getRnaOtherInformationById(String id) {
        RNAOther rnaOther = rnaMapper.queryRnaOtherInformationById(id);
        StringBuilder stringBuilder = new StringBuilder();
//        处理context
        if (Objects.isNull(rnaOther)) {
            return null;
        }
        String context = rnaOther.getContext();
        if (!"NA".equals(context)) {
            for (int i = 0; i < context.length(); i++) {
                if (i == ((context.length() - 1) / 2)) {
                    //<span style='color: red'></span>
                    stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                } else {
                    stringBuilder.append(context.charAt(i));
                }
            }
            rnaOther.setContext(stringBuilder.toString());
            stringBuilder.setLength(0);
        }
        return rnaOther;
    }

    @Override
    public RNAm5cArabiM6aBra getRNAm5cArabiM6aBraInformationById(String id) {
        RNAm5cArabiM6aBra rnAm5cArabiM6aBra = rnaMapper.queryRNAm5cArabiM6aBraInformationById(id);
        if (Objects.isNull(rnAm5cArabiM6aBra)) {
            return null;
        }
        StringBuilder stringBuilder = new StringBuilder();
        String context = rnAm5cArabiM6aBra.getContext();
        if (!"NA".equals(context)) {
            for (int i = 0; i < context.length(); i++) {
                if (i == ((context.length() - 1) / 2)) {
                    //<span style='color: red'></span>
                    stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                } else {
                    stringBuilder.append(context.charAt(i));
                }
            }
            rnAm5cArabiM6aBra.setContext(stringBuilder.toString());
            stringBuilder.setLength(0);
        }
        return rnAm5cArabiM6aBra;
    }

    private List<RNAOther> transformContextMiddleToRedRNAother(List<RNAOther> list) {
        StringBuilder stringBuilder = new StringBuilder();
        for (RNAOther rnaOther : list) {
            String context = rnaOther.getContext();
            if (!"NA".equals(context)) {
                for (int i = 0; i < context.length(); i++) {
                    if (i == ((context.length() - 1) / 2)) {
                        //<span style='color: red'></span>
                        stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                    } else {
                        stringBuilder.append(context.charAt(i));
                    }
                }
                rnaOther.setContext(stringBuilder.toString());
                stringBuilder.setLength(0);
            }
        }
        return list;
    }

    private List<RNAm5cArabiM6aBra> transformContextMiddleToRedRNAm5cArabiM6aBra(List<RNAm5cArabiM6aBra> list) {
        StringBuilder stringBuilder = new StringBuilder();
        for (RNAm5cArabiM6aBra rnAm5cArabiM6aBra : list) {
            String context = rnAm5cArabiM6aBra.getContext();
            if (!"NA".equals(context)) {
                for (int i = 0; i < context.length(); i++) {
                    if (i == ((context.length() - 1) / 2)) {
                        //<span style='color: red'></span>
                        stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                    } else {
                        stringBuilder.append(context.charAt(i));
                    }
                }
                rnAm5cArabiM6aBra.setContext(stringBuilder.toString());
                stringBuilder.setLength(0);
            }
        }
        return list;
    }
}
