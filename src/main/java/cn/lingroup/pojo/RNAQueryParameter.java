package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/4-15:41
 * @Description:
 */
public class RNAQueryParameter {
    /**
     * flag为搜索参数的组合
     * 1:物种，类型和基因名
     * 2:物种，染色体，类型，from，to
     * 3:物种，序列
     * 4:类型
     * 5:id
     */
    int flag;
    String id;
    String species;
    String type;
    String geneName;
    String chromosome;
    String from;
    String to;
    String sequence;

    @Override
    public String toString() {
        return "RNAQueryParameter{" +
                "flag=" + flag +
                ", id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", type='" + type + '\'' +
                ", geneName='" + geneName + '\'' +
                ", chromosome='" + chromosome + '\'' +
                ", from='" + from + '\'' +
                ", to='" + to + '\'' +
                ", sequence='" + sequence + '\'' +
                '}';
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGeneName() {
        return geneName;
    }

    public void setGeneName(String geneName) {
        this.geneName = geneName;
    }

    public String getChromosome() {
        return chromosome;
    }

    public void setChromosome(String chromosome) {
        this.chromosome = chromosome;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public RNAQueryParameter(int flag, String id, String species, String type, String geneName, String chromosome, String from, String to, String sequence) {
        this.flag = flag;
        this.id = id;
        this.species = species;
        this.type = type;
        this.geneName = geneName;
        this.chromosome = chromosome;
        this.from = from;
        this.to = to;
        this.sequence = sequence;
    }

    public RNAQueryParameter() {
    }
}
