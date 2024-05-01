package cn.lingroup.pojo;

import java.util.Arrays;
import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/29-13:05
 * @Description:
 */
public class ProteinRangeBean {
    List<String> rangeList;
    int[] count;

    @Override
    public String toString() {
        return "ProteinRangeBean{" +
                "rangeList=" + rangeList +
                ", count=" + Arrays.toString(count) +
                '}';
    }

    public List<String> getRangeList() {
        return rangeList;
    }

    public void setRangeList(List<String> rangeList) {
        this.rangeList = rangeList;
    }

    public int[] getCount() {
        return count;
    }

    public void setCount(int[] count) {
        this.count = count;
    }

    public ProteinRangeBean(List<String> rangeList, int[] count) {
        this.rangeList = rangeList;
        this.count = count;
    }

    public ProteinRangeBean() {
    }
}
