package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/27-19:20
 * @Description:
 */
public class RNAm5cArabiM6aBra {
    String id;
    String species;
    String view;
    String chromosome;
    String start;
    String end;
    String summit;
    String type;
    String gene;
    String feature;
    String strand;
    String context;

    @Override
    public String toString() {
        return "RNAm5cArabiM6aBra{" +
                "id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", view='" + view + '\'' +
                ", chromosome='" + chromosome + '\'' +
                ", start='" + start + '\'' +
                ", end='" + end + '\'' +
                ", summit='" + summit + '\'' +
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

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getSummit() {
        return summit;
    }

    public void setSummit(String summit) {
        this.summit = summit;
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

    public RNAm5cArabiM6aBra(String id, String species, String view, String chromosome, String start, String end, String summit, String type, String gene, String feature, String strand, String context) {
        this.id = id;
        this.species = species;
        this.view = view;
        this.chromosome = chromosome;
        this.start = start;
        this.end = end;
        this.summit = summit;
        this.type = type;
        this.gene = gene;
        this.feature = feature;
        this.strand = strand;
        this.context = context;
    }

    public RNAm5cArabiM6aBra() {
    }
}
