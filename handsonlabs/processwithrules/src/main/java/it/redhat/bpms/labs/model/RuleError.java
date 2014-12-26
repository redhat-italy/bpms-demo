package it.redhat.bpms.labs.model;

public class RuleError implements java.io.Serializable{

	static final long serialVersionUID = 1L;

    @org.kie.api.definition.type.Label(value = "Error cause")
    @org.kie.api.definition.type.Position(value = 0)
    private java.lang.String message;

    public RuleError() {
        this.message = "Generic Rule Error";
    }   

    public RuleError(java.lang.String message) {
        this.message = message;
    }   

    public java.lang.String getMessage() {
        return this.message;
    }   

    public void setMessage(java.lang.String message) {
        this.message = message;
    }   
    
}