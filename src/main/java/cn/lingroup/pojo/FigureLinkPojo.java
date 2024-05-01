package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/23-17:00
 * @Description:
 */
public class FigureLinkPojo {
    String pictureLing;
    String species;
    String genus;
    String commonName;
    String ploidy;
    String chromosomeNumber;
    String genomeSize;
    String proteinCount;
    String gcContent;

    @Override
    public String toString() {
        return "FigureLinkPojo{" +
                "pictureLing='" + pictureLing + '\'' +
                ", species='" + species + '\'' +
                ", genus='" + genus + '\'' +
                ", commonName='" + commonName + '\'' +
                ", ploidy='" + ploidy + '\'' +
                ", chromosomeNumber='" + chromosomeNumber + '\'' +
                ", genomeSize='" + genomeSize + '\'' +
                ", proteinCount='" + proteinCount + '\'' +
                ", gcContent='" + gcContent + '\'' +
                '}';
    }

    public String getPictureLing() {
        return pictureLing;
    }

    public void setPictureLing(String pictureLing) {
        this.pictureLing = pictureLing;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getGenus() {
        return genus;
    }

    public void setGenus(String genus) {
        this.genus = genus;
    }

    public String getCommonName() {
        return commonName;
    }

    public void setCommonName(String commonName) {
        this.commonName = commonName;
    }

    public String getPloidy() {
        return ploidy;
    }

    public void setPloidy(String ploidy) {
        this.ploidy = ploidy;
    }

    public String getChromosomeNumber() {
        return chromosomeNumber;
    }

    public void setChromosomeNumber(String chromosomeNumber) {
        this.chromosomeNumber = chromosomeNumber;
    }

    public String getGenomeSize() {
        return genomeSize;
    }

    public void setGenomeSize(String genomeSize) {
        this.genomeSize = genomeSize;
    }

    public String getProteinCount() {
        return proteinCount;
    }

    public void setProteinCount(String proteinCount) {
        this.proteinCount = proteinCount;
    }

    public String getGcContent() {
        return gcContent;
    }

    public void setGcContent(String gcContent) {
        this.gcContent = gcContent;
    }

    public FigureLinkPojo(String pictureLing, String species, String genus, String commonName, String ploidy, String chromosomeNumber, String genomeSize, String proteinCount, String gcContent) {
        this.pictureLing = pictureLing;
        this.species = species;
        this.genus = genus;
        this.commonName = commonName;
        this.ploidy = ploidy;
        this.chromosomeNumber = chromosomeNumber;
        this.genomeSize = genomeSize;
        this.proteinCount = proteinCount;
        this.gcContent = gcContent;
    }

    public FigureLinkPojo() {
    }
}
