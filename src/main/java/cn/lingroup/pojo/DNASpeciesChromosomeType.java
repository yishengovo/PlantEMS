package cn.lingroup.pojo;

import java.util.List;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:06
 * @Description:
 */
public class DNASpeciesChromosomeType {
    List<String> species;
    List<String> chromosomes;
    List<String> types;

    @Override
    public String toString() {
        return "DNASpeciesChromosomeType{" +
                "species=" + species +
                ", chromosomes=" + chromosomes +
                ", types=" + types +
                '}';
    }

    public List<String> getSpecies() {
        return species;
    }

    public void setSpecies(List<String> species) {
        this.species = species;
    }

    public List<String> getChromosomes() {
        return chromosomes;
    }

    public void setChromosomes(List<String> chromosomes) {
        this.chromosomes = chromosomes;
    }

    public List<String> getTypes() {
        return types;
    }

    public void setTypes(List<String> types) {
        this.types = types;
    }

    public DNASpeciesChromosomeType(List<String> species, List<String> chromosomes, List<String> types) {
        this.species = species;
        this.chromosomes = chromosomes;
        this.types = types;
    }

    public DNASpeciesChromosomeType() {
    }
}
