package cn.lingroup.pojo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/11-22:33
 * @Description:
 */
public class RNAStatisticInformation {
    List<String> figure1NameList;
    List<Float> figure1ValueList;
    List<String> figure2NameList;
    List<Float> figure2ValueList;
    BrowserOverviewPojo overviewInfo;

    @Override
    public String toString() {
        return "RNAStatisticInformation{" +
                "figure1NameList=" + figure1NameList +
                ", figure1ValueList=" + figure1ValueList +
                ", figure2NameList=" + figure2NameList +
                ", figure2ValueList=" + figure2ValueList +
                ", overviewInfo=" + overviewInfo +
                '}';
    }

    public List<String> getFigure1NameList() {
        return figure1NameList;
    }

    public void setFigure1NameList(List<String> figure1NameList) {
        this.figure1NameList = figure1NameList;
    }

    public List<Float> getFigure1ValueList() {
        return figure1ValueList;
    }

    public void setFigure1ValueList(List<Float> figure1ValueList) {
        this.figure1ValueList = figure1ValueList;
    }

    public List<String> getFigure2NameList() {
        return figure2NameList;
    }

    public void setFigure2NameList(List<String> figure2NameList) {
        this.figure2NameList = figure2NameList;
    }

    public List<Float> getFigure2ValueList() {
        return figure2ValueList;
    }

    public void setFigure2ValueList(List<Float> figure2ValueList) {
        this.figure2ValueList = figure2ValueList;
    }

    public BrowserOverviewPojo getOverviewInfo() {
        return overviewInfo;
    }

    public void setOverviewInfo(BrowserOverviewPojo overviewInfo) {
        this.overviewInfo = overviewInfo;
    }

    public RNAStatisticInformation(List<String> figure1NameList, List<Float> figure1ValueList, List<String> figure2NameList, List<Float> figure2ValueList, BrowserOverviewPojo overviewInfo) {
        this.figure1NameList = figure1NameList;
        this.figure1ValueList = figure1ValueList;
        this.figure2NameList = figure2NameList;
        this.figure2ValueList = figure2ValueList;
        this.overviewInfo = overviewInfo;
    }

    public RNAStatisticInformation() {
    }
}
