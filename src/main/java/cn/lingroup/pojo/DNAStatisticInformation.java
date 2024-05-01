package cn.lingroup.pojo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/18-12:29
 * @Description:
 */
public class DNAStatisticInformation {
    List<String> figure1NameList;
    List<Float> figure1ValueList;
    List<String> figure2NameList;
    List<Float> figure2ValueList;
    List<Integer> figure3NameList;
    List<Integer> figure3ValueList;
    List<Integer> figure4NameList;
    List<Integer> figure4ValueList;
    BrowserOverviewPojo overviewInfo;

    @Override
    public String toString() {
        return "DNAStatisticInformation{" +
                "figure1NameList=" + figure1NameList +
                ", figure1ValueList=" + figure1ValueList +
                ", figure2NameList=" + figure2NameList +
                ", figure2ValueList=" + figure2ValueList +
                ", figure3NameList=" + figure3NameList +
                ", figure3ValueList=" + figure3ValueList +
                ", figure4NameList=" + figure4NameList +
                ", figure4ValueList=" + figure4ValueList +
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

    public List<Integer> getFigure3NameList() {
        return figure3NameList;
    }

    public void setFigure3NameList(List<Integer> figure3NameList) {
        this.figure3NameList = figure3NameList;
    }

    public List<Integer> getFigure3ValueList() {
        return figure3ValueList;
    }

    public void setFigure3ValueList(List<Integer> figure3ValueList) {
        this.figure3ValueList = figure3ValueList;
    }

    public List<Integer> getFigure4NameList() {
        return figure4NameList;
    }

    public void setFigure4NameList(List<Integer> figure4NameList) {
        this.figure4NameList = figure4NameList;
    }

    public List<Integer> getFigure4ValueList() {
        return figure4ValueList;
    }

    public void setFigure4ValueList(List<Integer> figure4ValueList) {
        this.figure4ValueList = figure4ValueList;
    }

    public BrowserOverviewPojo getOverviewInfo() {
        return overviewInfo;
    }

    public void setOverviewInfo(BrowserOverviewPojo overviewInfo) {
        this.overviewInfo = overviewInfo;
    }

    public DNAStatisticInformation(List<String> figure1NameList, List<Float> figure1ValueList, List<String> figure2NameList, List<Float> figure2ValueList, List<Integer> figure3NameList, List<Integer> figure3ValueList, List<Integer> figure4NameList, List<Integer> figure4ValueList, BrowserOverviewPojo overviewInfo) {
        this.figure1NameList = figure1NameList;
        this.figure1ValueList = figure1ValueList;
        this.figure2NameList = figure2NameList;
        this.figure2ValueList = figure2ValueList;
        this.figure3NameList = figure3NameList;
        this.figure3ValueList = figure3ValueList;
        this.figure4NameList = figure4NameList;
        this.figure4ValueList = figure4ValueList;
        this.overviewInfo = overviewInfo;
    }

    public DNAStatisticInformation() {
    }
}
