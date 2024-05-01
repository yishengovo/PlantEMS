package cn.lingroup.pojo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/21-13:20
 * @Description:
 */
public class ProteinSpeciesAndModificationType {
    List<String> species;
    List<String> types;

    @Override
    public String toString() {
        return "ProteinSpeciesAndModificationType{" +
                "species=" + species +
                ", types=" + types +
                '}';
    }

    public List<String> getSpecies() {
        return species;
    }

    public void setSpecies(List<String> species) {
        this.species = species;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public ProteinSpeciesAndModificationType() {
    }

    public ProteinSpeciesAndModificationType(List<String> species, List<String> types) {
        this.species = species;
        this.types = types;
    }
}
