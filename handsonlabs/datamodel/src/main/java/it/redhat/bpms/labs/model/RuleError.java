package it.redhat.bpms.labs.model;

public class RuleError implements java.io.Serializable{

	static final long serialVersionUID = 1L;

    @org.kie.api.definition.type.Label(value = "Error cause")
    @org.kie.api.definition.type.Position(value = 0)
    private String message;

    public RuleError() {
        this.message = "Generic Rule Error";
    }   

    public RuleError(String message) {
        this.message = message;
    }   

    public String getMessage() {
        return this.message;
    }   

    public void setMessage(String message) {
        this.message = message;
    }   
    
}