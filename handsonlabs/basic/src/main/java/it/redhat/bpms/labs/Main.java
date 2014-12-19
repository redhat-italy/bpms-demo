package it.redhat.bpms.labs;

import it.redhat.bpms.labs.model.Person;
import org.kie.api.KieServices;
import org.kie.api.builder.ReleaseId;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

public class Main {

	public static void main(String[] args) {
		new Main().execute();
	}

    private void execute() {
        System.out.println("====> starting Lab 1 ...");
        KieServices kieServices = KieServices.Factory.get();

        /*
            Since a KIE project is also a Maven project the groupId, artifactId and version declared in the pom.xml
            are also used to generate a ReleaseId that uniquely identifies the project itself.
             This allows creation of a new KIE Container from project simply passing it to the KIE Services.
         */

        ReleaseId id = kieServices.newReleaseId("it.redhat.bpms.labs", "basic", "1.0.0-SNAPSHOT");
        //ReleaseId id = kieServices.newReleaseId("org.jboss.ddoyle.brms.workshop", "Brms6WorkshopKieScannerRules", "1.0.0-SNAPSHOT");

        System.out.println("====> Pulling definitions from Maven repo.");
        KieContainer kieContainer = kieServices.newKieContainer(id);
        System.out.println("====> Creating KIE Session.");
        KieSession ksession = kieContainer.newKieSession();

        System.out.println("====> inserting facts...");
        ksession.insert(new Person("Mario"));
        ksession.fireAllRules();
        ksession.dispose();

    }

}