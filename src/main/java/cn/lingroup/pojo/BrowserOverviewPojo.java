package cn.lingroup.pojo;

/**
 * @Author: Zheng-Xing Guan
 * @Date: 2021/6/29-19:35
 * @Description:
 */
public class BrowserOverviewPojo {
    String species;
    String type;
    String instrument;
    String accessionNumber;
    String pmid;
    String pmidLink;

    @Override
    public String toString() {
        return "BrowserOverviewPojo{" +
                "species='" + species + '\'' +
                ", type='" + type + '\'' +
                ", instrument='" + instrument + '\'' +
                ", accessionNumber='" + accessionNumber + '\'' +
                ", pmid='" + pmid + '\'' +
                ", pmidLink='" + pmidLink + '\'' +
                '}';
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

    public String getInstrument() {
        return instrument;
    }

    public void setInstrument(String instrument) {
        this.instrument = instrument;
    }

    public String getAccessionNumber() {
        return accessionNumber;
    }

    public void setAccessionNumber(String accessionNumber) {
        this.accessionNumber = accessionNumber;
    }

    public String getPmid() {
        return pmid;
    }

    public void setPmid(String pmid) {
        this.pmid = pmid;
    }

    public String getPmidLink() {
        return pmidLink;
    }

    public void setPmidLink(String pmidLink) {
        this.pmidLink = pmidLink;
    }

    public BrowserOverviewPojo(String species, String type, String instrument, String accessionNumber, String pmid, String pmidLink) {
        this.species = species;
        this.type = type;
        this.instrument = instrument;
        this.accessionNumber = accessionNumber;
        this.pmid = pmid;
        this.pmidLink = pmidLink;
    }

    public BrowserOverviewPojo() {
    }
}
