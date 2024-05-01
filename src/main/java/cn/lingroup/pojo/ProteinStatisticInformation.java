package cn.lingroup.pojo;

import java.util.Arrays;
import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/23-15:38
 * @Description:
 */
public class ProteinStatisticInformation {
    List<String> figure3NameList;
    int[] figure3ValueList;
    List<String> figure4NameList;
    int[] figure4ValueList;
    BrowserOverviewPojo overviewInfo;

    @Override
    public String toString() {
        return "ProteinStatisticInformation{" +
                "figure3NameList=" + figure3NameList +
                ", figure3ValueList=" + Arrays.toString(figure3ValueList) +
                ", figure4NameList=" + figure4NameList +
                ", figure4ValueList=" + Arrays.toString(figure4ValueList) +
                ", overviewInfo=" + overviewInfo +
                '}';
    }

    public ProteinStatisticInformation(List<String> figure3NameList, int[] figure3ValueList, List<String> figure4NameList, int[] figure4ValueList, BrowserOverviewPojo overviewInfo) {
        this.figure3NameList = figure3NameList;
        this.figure3ValueList = figure3ValueList;
        this.figure4NameList = figure4NameList;
        this.figure4ValueList = figure4ValueList;
        this.overviewInfo = overviewInfo;
    }

    public List<String> getFigure3NameList() {
        return figure3NameList;
    }

    public void setFigure3NameList(List<String> figure3NameList) {
        this.figure3NameList = figure3NameList;
    }

    public int[] getFigure3ValueList() {
        return figure3ValueList;
    }

    public void setFigure3ValueList(int[] figure3ValueList) {
        this.figure3ValueList = figure3ValueList;
    }

    public List<String> getFigure4NameList() {
        return figure4NameList;
    }

    public void setFigure4NameList(List<String> figure4NameList) {
        this.figure4NameList = figure4NameList;
    }

    public int[] getFigure4ValueList() {
        return figure4ValueList;
    }

    public void setFigure4ValueList(int[] figure4ValueList) {
        this.figure4ValueList = figure4ValueList;
    }

    public BrowserOverviewPojo getOverviewInfo() {
        return overviewInfo;
    }

    public void setOverviewInfo(BrowserOverviewPojo overviewInfo) {
        this.overviewInfo = overviewInfo;
    }

    public ProteinStatisticInformation() {
    }
}
