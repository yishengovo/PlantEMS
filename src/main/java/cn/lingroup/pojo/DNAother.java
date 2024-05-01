package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/24-15:25
 * @Description:
 */
public class DNAother {
    String id;
    String species;
    String view;
    String chromosome;
    String position;
    String type;
    String gene;
    String feature;
    String strand;
    String score;
    String coverage;
    String fraction;
    String identificationQv;
    String ipdRation;
    String context;

    public DNAother() {
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public void setView(String view) {
        this.view = view;
    }

    public void setChromosome(String chromosome) {
        this.chromosome = chromosome;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setGene(String gene) {
        this.gene = gene;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public void setStrand(String strand) {
        this.strand = strand;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    public void setFraction(String fraction) {
        this.fraction = fraction;
    }

    public void setIdentificationQv(String identificationQv) {
        this.identificationQv = identificationQv;
    }

    public void setIpdRation(String ipdRation) {
        this.ipdRation = ipdRation;
    }

    public void setContext(String context) {
        this.context = context;
    }

    @Override
    public String toString() {
        return "DNAother{" +
                "id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", view='" + view + '\'' +
                ", chromosome='" + chromosome + '\'' +
                ", position='" + position + '\'' +
                ", type='" + type + '\'' +
                ", gene='" + gene + '\'' +
                ", feature='" + feature + '\'' +
                ", strand='" + strand + '\'' +
                ", score='" + score + '\'' +
                ", coverage='" + coverage + '\'' +
                ", fraction='" + fraction + '\'' +
                ", identificationQv='" + identificationQv + '\'' +
                ", ipdRation='" + ipdRation + '\'' +
                ", context='" + context + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public String getSpecies() {
        return species;
    }

    public String getView() {
        return view;
    }

    public String getChromosome() {
        return chromosome;
    }

    public String getPosition() {
        return position;
    }

    public String getType() {
        return type;
    }

    public String getGene() {
        return gene;
    }

    public String getFeature() {
        return feature;
    }

    public String getStrand() {
        return strand;
    }

    public String getScore() {
        return score;
    }

    public String getCoverage() {
        return coverage;
    }

    public String getFraction() {
        return fraction;
    }

    public String getIdentificationQv() {
        return identificationQv;
    }

    public String getIpdRation() {
        return ipdRation;
    }

    public String getContext() {
        return context;
    }

    public DNAother(String id, String species, String view, String chromosome, String position, String type, String gene, String feature, String strand, String score, String coverage, String fraction, String identificationQv, String ipdRation, String context) {
        this.id = id;
        this.species = species;
        this.view = view;
        this.chromosome = chromosome;
        this.position = position;
        this.type = type;
        this.gene = gene;
        this.feature = feature;
        this.strand = strand;
        this.score = score;
        this.coverage = coverage;
        this.fraction = fraction;
        this.identificationQv = identificationQv;
        this.ipdRation = ipdRation;
        this.context = context;
    }

}
