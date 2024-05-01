package cn.lingroup.service.impl;

import cn.lingroup.mapper.ProteinMapper;
import cn.lingroup.pojo.*;
import cn.lingroup.service.ProteinService;
import cn.lingroup.util.page.PageUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/20-20:50
 * @Description:
 */
@Service
public class ProteinServiceImpl implements ProteinService {

    @Autowired
    ProteinMapper proteinMapper;
    //缓存物种和修饰类型
    ProteinSpeciesAndModificationType proteinSpeciesAndModificationType;
    //缓存每个物种对应的修饰类型
    HashMap<String, List<String>> speciesAndItsTypeMap = new HashMap<>();
    //缓存浏览页面查询物种和类型的统计信息
    HashMap<String, ProteinStatisticInformation> proteinStatisticInformationHashMap = new HashMap<>();
    //定义浮点型的保留位数
    static DecimalFormat format = new DecimalFormat("##0.0");

    @Override
    public ProteinSpeciesAndModificationType getAllSpeciesAndType() {
        if (proteinSpeciesAndModificationType == null) {
            proteinSpeciesAndModificationType = new ProteinSpeciesAndModificationType();
            proteinSpeciesAndModificationType.setSpecies(proteinMapper.queryAllSpecies());
            proteinSpeciesAndModificationType.setTypes(proteinMapper.queryAllTypes());
        }
        return proteinSpeciesAndModificationType;
    }

    @Override
    public ProteinStatisticInformation ajaxGetStatisticInformation(String species, String type) {
        String tempName = species + "$" + type;
//        System.out.println(tempName);
        if (!proteinStatisticInformationHashMap.containsKey(tempName)) {
            List<Double> list3 = new ArrayList<>();
            List<Double> list4 = new ArrayList<>();
            ProteinStatisticInformation proteinStatisticInformation = new ProteinStatisticInformation();
            List<String> figure3Info = proteinMapper.queryFigure3Info(species, type);

            ProteinRangeBean staticRangeForFigure3;
            ProteinRangeBean staticRangeForFigure4;
            if (figure3Info.size() == 0) {
                proteinStatisticInformation.setFigure3NameList(new ArrayList<>());
                proteinStatisticInformation.setFigure3ValueList(new int[]{});
            } else {
                for (String s : figure3Info) {
                    list3.add(Double.parseDouble(s));
                }
                Collections.sort(list3);
                staticRangeForFigure3 = getStaticRangeForFigure3(format, list3, list3.get(0), list3.get(list3.size() - 1));
                proteinStatisticInformation.setFigure3NameList(staticRangeForFigure3.getRangeList());
                proteinStatisticInformation.setFigure3ValueList(staticRangeForFigure3.getCount());
            }

            List<String> figure4Info = proteinMapper.queryFigure4Info(species, type);

            if (figure4Info.size() == 0) {
                proteinStatisticInformation.setFigure4NameList(new ArrayList<>());
                proteinStatisticInformation.setFigure4ValueList(new int[]{});
            } else {
                for (String s : figure4Info) {
                    list4.add(Double.parseDouble(s));
                }
                Collections.sort(list4);
                staticRangeForFigure4 = getStaticRangeForFigure4(list4);
                proteinStatisticInformation.setFigure4NameList(staticRangeForFigure4.getRangeList());
                proteinStatisticInformation.setFigure4ValueList(staticRangeForFigure4.getCount());
            }
//            System.out.println(proteinStatisticInformation.getFigure3NameList());
//            System.out.println(Arrays.toString(proteinStatisticInformation.getFigure3ValueList()));
//            System.out.println(proteinStatisticInformation.getFigure4NameList());
//            System.out.println(Arrays.toString(proteinStatisticInformation.getFigure4ValueList()));
            proteinStatisticInformation.setOverviewInfo(proteinMapper.queryOverviewInfo(species, type));
            proteinStatisticInformationHashMap.put(tempName, proteinStatisticInformation);
        }
        return proteinStatisticInformationHashMap.get(tempName);
    }


    @Override
    public List<String> ajaxGetTypeBySpecies(String species) {
        if (!speciesAndItsTypeMap.containsKey(species)) {
            List<String> list = proteinMapper.ajaxQueryTypesBySpecies(species);
            speciesAndItsTypeMap.put(species, list);
        }
        return speciesAndItsTypeMap.get(species);
    }

    @Override
    public Page<Protein> getInfoBySpeciesAndType(String species, String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Protein> proteinList = proteinMapper.queryInfoBySpeciesAndType(species, type);
        List<Protein> proteinList1 = transformContextMiddleToRedProtein(proteinList);
        return PageUtils.getPage(proteinList1);

    }

    @Override
    public Page<Protein> getProteinInformationByAccession(String accession, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Protein> proteinList = proteinMapper.queryInfoByAccession(accession);
        List<Protein> proteinList1 = transformContextMiddleToRedProtein(proteinList);
        return PageUtils.getPage(proteinList1);
    }

    @Override
    public Page<Protein> getProteinInformationByPeptide(String species, String peptide, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        String temp = "%" + peptide + "%";
        List<Protein> proteinList = proteinMapper.queryInfoByPeptide(species, temp);
        List<Protein> proteinList1 = transformContextMiddleToRedProtein(proteinList);
        return PageUtils.getPage(proteinList1);
    }

    @Override
    public Page<Protein> getProteinInformationByType(String type, int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Protein> proteinList = proteinMapper.queryInfoByType(type);
        List<Protein> proteinList1 = transformContextMiddleToRedProtein(proteinList);
        return PageUtils.getPage(proteinList1);
    }

    @Override
    public Protein getProteinInformationById(String id) {
        Protein protein = proteinMapper.queryInfoById(id);
        StringBuilder stringBuilder = new StringBuilder();
//        处理context
        if (Objects.isNull(protein)) {
            return null;
        }
        String context = protein.getModifiedSequence();
        if (!"NA".equals(context)) {
            for (int i = 0; i < context.length(); i++) {
                if (i == ((context.length() - 1) / 2)) {
                    //<span style='color: red'></span>
                    stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                } else {
                    stringBuilder.append(context.charAt(i));
                }
            }
            protein.setModifiedSequence(stringBuilder.toString());
            stringBuilder.setLength(0);
    }
        return protein;
    }

    private List<Protein> transformContextMiddleToRedProtein(List<Protein> list) {
        StringBuilder stringBuilder = new StringBuilder();
        for (Protein protein : list) {
            String context = protein.getModifiedSequence();
            if (!"NA".equals(context)) {
                for (int i = 0; i < context.length(); i++) {
                    if (i == ((context.length() - 1) / 2)) {
                        //<span style='color: red'></span>
                        stringBuilder.append("<span style='color: red'>").append(context.charAt(i)).append("</span>");
                    } else {
                        stringBuilder.append(context.charAt(i));
                    }
                }
                protein.setModifiedSequence(stringBuilder.toString());
                stringBuilder.setLength(0);
            }
        }
        return list;
    }


    private ProteinRangeBean getStaticRangeForFigure3(DecimalFormat format, List<Double> listDouble, Double min, Double max) {
        min = Double.parseDouble(format.format(min));
        max = Double.parseDouble(format.format(max));
        boolean flag = true;
        List<String> list = new ArrayList<>();
        double b = min;
        while (flag) {
            b += 0.5;
            double format1 = Double.parseDouble(format.format(b));
            if ("0.5".equals(format.format(b - min))) {
                list.add("[" + format.format(format1 - 0.5) + "," + format1 + "]");
            } else {
                if (b >= max) {
                    flag = false;
                    list.add("(" + format.format((format1 - 0.5)) + "," + format.format(max) + "]");
                } else {
                    list.add("(" + format.format(format1 - 0.5) + "," + format1 + "]");
                }
            }
        }
        int[] res = new int[list.size()];
        //给最大/小值赋初始值
        res[res.length - 1] = 1;
        res[0] = 1;
        int index;
        for (int i = 1; i < listDouble.size() - 1; i++) {
            index = (int) (Math.ceil((listDouble.get(i) - min) / 0.5));
            if (index == 0) {
                index = 1;
            }
            res[index - 1] += 1;
        }
        ProteinRangeBean proteinRangeBean = new ProteinRangeBean();
        proteinRangeBean.setRangeList(list);
        proteinRangeBean.setCount(res);
        return proteinRangeBean;
    }

    private ProteinRangeBean getStaticRangeForFigure4(List<Double> listDouble) {
        ProteinRangeBean proteinRangeBean = new ProteinRangeBean();
        double max = listDouble.get(listDouble.size() - 1);
        List<String> list = new ArrayList<>();
        int[] res;
        if (max < 1.0) {
            list.add("0-1");
            res = new int[]{listDouble.size()};
        } else {
            HashMap<Integer, Integer> map = new HashMap<>();
            List<Integer> list1 = new ArrayList<>();
            for (Double aDouble : listDouble) {
                int temp = (int) Math.floor(aDouble);
                if (!map.containsKey(temp)) {
                    map.put(temp, 1);
                    list1.add(temp);
                } else {
                    map.put(temp, map.get(temp) + 1);
                }
            }
            res = new int[list1.size()];
            for (int i = 0; i < list1.size(); i++) {
                int tempValue = list1.get(i);
                list.add(String.valueOf(tempValue));
                res[i] = map.get(tempValue);
            }
        }

        proteinRangeBean.setRangeList(list);
        proteinRangeBean.setCount(res);
        return proteinRangeBean;
    }


}
