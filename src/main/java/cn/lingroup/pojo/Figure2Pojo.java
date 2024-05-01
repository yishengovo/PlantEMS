package cn.lingroup.pojo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/12-0:49
 * @Description:
 */
public class Figure2Pojo {
    String name;
    String valueString;

    @Override
    public String toString() {
        return "Figure2Pojo{" +
                "name='" + name + '\'' +
                ", valueString='" + valueString + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValueString() {
        return valueString;
    }

    public void setValueString(String valueString) {
        this.valueString = valueString;
    }

    public Figure2Pojo(String name, String valueString) {
        this.name = name;
        this.valueString = valueString;
    }

    public Figure2Pojo() {
    }
}
