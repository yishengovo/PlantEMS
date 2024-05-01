package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/12-0:50
 * @Description:
 */
public class Figure4Pojo {
    String name;
    String valueString;

    @Override
    public String toString() {
        return "Figure4Pojo{" +
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

    public Figure4Pojo(String name, String valueString) {
        this.name = name;
        this.valueString = valueString;
    }

    public Figure4Pojo() {
    }
}
