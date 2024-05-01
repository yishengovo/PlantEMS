package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/4/20-20:36
 * @Description:
 */
public class Protein {
    String id;
    String species;
    String view;
    String accession;
    String fastaHeaders;
    String localization;
    String type;
    String modifiedSequence;
    String position;
    String massError;
    String peptideScore;
    String charge;

    @Override
    public String toString() {
        return "Protein{" +
                "id='" + id + '\'' +
                ", species='" + species + '\'' +
                ", view='" + view + '\'' +
                ", accession='" + accession + '\'' +
                ", fastaHeaders='" + fastaHeaders + '\'' +
                ", localization='" + localization + '\'' +
                ", type='" + type + '\'' +
                ", modifiedSequence='" + modifiedSequence + '\'' +
                ", position='" + position + '\'' +
                ", massError='" + massError + '\'' +
                ", peptideScore='" + peptideScore + '\'' +
                ", charge='" + charge + '\'' +
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

    public String getAccession() {
        return accession;
    }

    public void setAccession(String accession) {
        this.accession = accession;
    }

    public String getFastaHeaders() {
        return fastaHeaders;
    }

    public void setFastaHeaders(String fastaHeaders) {
        this.fastaHeaders = fastaHeaders;
    }

    public String getLocalization() {
        return localization;
    }

    public void setLocalization(String localization) {
        this.localization = localization;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getModifiedSequence() {
        return modifiedSequence;
    }

    public void setModifiedSequence(String modifiedSequence) {
        this.modifiedSequence = modifiedSequence;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getMassError() {
        return massError;
    }

    public void setMassError(String massError) {
        this.massError = massError;
    }

    public String getPeptideScore() {
        return peptideScore;
    }

    public void setPeptideScore(String peptideScore) {
        this.peptideScore = peptideScore;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

    public Protein(String id, String species, String view, String accession, String fastaHeaders, String localization, String type, String modifiedSequence, String position, String massError, String peptideScore, String charge) {
        this.id = id;
        this.species = species;
        this.view = view;
        this.accession = accession;
        this.fastaHeaders = fastaHeaders;
        this.localization = localization;
        this.type = type;
        this.modifiedSequence = modifiedSequence;
        this.position = position;
        this.massError = massError;
        this.peptideScore = peptideScore;
        this.charge = charge;
    }

    public Protein() {
    }
}
