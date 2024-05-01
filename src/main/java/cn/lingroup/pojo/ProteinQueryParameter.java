package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/1-17:03
 * @Description:
 */
public class ProteinQueryParameter {
    /**
     * flag为代表参数的组合：
     * 1：物种和类型
     * 2：物种和肽段
     * 3.Accession编号
     * 4.修饰类型
     * 5.id
     */
    int flag;
    String id;
    String species;
    String type;
    String peptide;
    String accession;

    @Override
    public String toString() {
        return "ProteinQueryParameter{" +
                "flag=" + flag +
                ", id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", type='" + type + '\'' +
                ", peptide='" + peptide + '\'' +
                ", accession='" + accession + '\'' +
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

    public String getPeptide() {
        return peptide;
    }

    public void setPeptide(String peptide) {
        this.peptide = peptide;
    }

    public String getAccession() {
        return accession;
    }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public ProteinQueryParameter(int flag, String id, String species, String type, String peptide, String accession) {
        this.flag = flag;
        this.id = id;
        this.species = species;
        this.type = type;
        this.peptide = peptide;
        this.accession = accession;
    }

    public ProteinQueryParameter() {
    }
}
