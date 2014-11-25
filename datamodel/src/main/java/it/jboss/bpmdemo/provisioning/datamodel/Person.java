package it.jboss.bpmdemo.provisioning.datamodel;

public class Person implements java.io.Serializable {

	static final long serialVersionUID = 1L;

    private String name;

    private int age;

    public Person(String name, int age) {
    	this.name = name;
    	this.age = age;
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
