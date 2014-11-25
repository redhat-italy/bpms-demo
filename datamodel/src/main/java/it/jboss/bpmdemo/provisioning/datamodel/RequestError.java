package it.jboss.bpmdemo.provisioning.datamodel;

public class RequestError implements java.io.Serializable{

	static final long serialVersionUID = 1L;

    @org.kie.api.definition.type.Label(value = "Error cause")
    @org.kie.api.definition.type.Position(value = 0)
    private java.lang.String message;

    public RequestError() {
    }   

    public RequestError(java.lang.String message) {
        this.message = message;
    }   

    public java.lang.String getMessage() {
        return this.message;
    }   

    public void setMessage(java.lang.String message) {
        this.message = message;
    }   
    
}