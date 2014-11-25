package it.jboss.bpmdemo.provisioning.datamodel;

public class Sample implements java.io.Serializable {

	static final long serialVersionUID = 1L;

    @org.kie.api.definition.type.Label(value = "Sample ID")
    @org.kie.api.definition.type.Position(value = 0)
    private long id;

    @org.kie.api.definition.type.Label(value = "Sample Size")
    @org.kie.api.definition.type.Position(value = 1)
    private int size;

    public Sample() {
    	this.size = (int)(100 * Math.random());
    	this.id = this.size + System.currentTimeMillis();
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getSize() {
        return this.size;
    }

    public void setSize(int size) {
        this.size = size;
    }

}