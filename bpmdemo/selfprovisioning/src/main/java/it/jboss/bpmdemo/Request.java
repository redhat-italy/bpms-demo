package it.jboss.bpmdemo;

/**
 * This class was automatically generated by the data modeler tool.
 * $HASH(511f04f64bb4d4a366ba270d14e62911)
 */
@org.kie.api.definition.type.Label(value = "Provisioning Request Data")
public class Request  implements java.io.Serializable {

    static final long serialVersionUID = 1L;
    
    @org.kie.api.definition.type.Label(value = "Date of expire")
    @org.kie.api.definition.type.Position(value = 2)
    private java.util.Date expire;
    
    @org.kie.api.definition.type.Label(value = "Number of hosts")
    @org.kie.api.definition.type.Position(value = 1)
    private int quantity;
    
    @org.kie.api.definition.type.Label(value = "Size of the host")
    @org.kie.api.definition.type.Position(value = 0)
    private int size;
    
    @org.kie.api.definition.type.Label(value = "Status of the request")
    @org.kie.api.definition.type.Position(value = 4)
    private java.lang.String status;
    
    @org.kie.api.definition.type.Label(value = "Requestor name")
    @org.kie.api.definition.type.Position(value = 3)
    private java.lang.String user;

    public Request() {
    }

    public Request(int size, int quantity, java.util.Date expire, java.lang.String user, java.lang.String status) {
        this.size = size;
        this.quantity = quantity;
        this.expire = expire;
        this.user = user;
        this.status = status;
    }


    
    public java.util.Date getExpire() {
        return this.expire;
    }

    public void setExpire(java.util.Date expire) {
        this.expire = expire;
    }
    
    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public int getSize() {
        return this.size;
    }

    public void setSize(int size) {
        this.size = size;
    }
    
    public java.lang.String getStatus() {
        return this.status;
    }

    public void setStatus(java.lang.String status) {
        this.status = status;
    }
    
    public java.lang.String getUser() {
        return this.user;
    }

    public void setUser(java.lang.String user) {
        this.user = user;
    }
}