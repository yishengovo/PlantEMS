package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/27-19:12
 * @Description:
 */
public class RNAOther {
    String id;
    String species;
    String view;
    String chromosome;
    String position;
    String type;
    String gene;
    String feature;
    String strand;
    String context;

    @Override
    public String toString() {
        return "RNAOther{" +
                "id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", view='" + view + '\'' +
                ", chromosome='" + chromosome + '\'' +
                ", position='" + position + '\'' +
                ", type='" + type + '\'' +
                ", gene='" + gene + '\'' +
                ", feature='" + feature + '\'' +
                ", strand='" + strand + '\'' +
                ", context='" + context + '\'' +
                '}';
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

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public String getChromosome() {
        return chromosome;
    }

    public void setChromosome(String chromosome) {
        this.chromosome = chromosome;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGene() {
        return gene;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getStrand() {
        return strand;
    }

    public void setStrand(String strand) {
        this.strand = strand;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public RNAOther(String id, String species, String view, String chromosome, String position, String type, String gene, String feature, String strand, String context) {
        this.id = id;
        this.species = species;
        this.view = view;
        this.chromosome = chromosome;
        this.position = position;
        this.type = type;
        this.gene = gene;
        this.feature = feature;
        this.strand = strand;
        this.context = context;
    }

    public RNAOther() {
    }
}
