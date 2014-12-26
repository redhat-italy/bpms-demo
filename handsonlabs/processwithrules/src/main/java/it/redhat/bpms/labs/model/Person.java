package it.redhat.bpms.labs.model;

public class Person implements java.io.Serializable {

    static final long serialVersionUID = 1L;

    @org.kie.api.definition.type.Label(value = "Name of the person")
    @org.kie.api.definition.type.Position(value = 0)
    private String name;

    @org.kie.api.definition.type.Label(value = "Age of the person")
    @org.kie.api.definition.type.Position(value = 1)
    private int age;

    public Person(String name) {
        this.age = (int)(80 * Math.random());
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        this.age = age;
    }

}
