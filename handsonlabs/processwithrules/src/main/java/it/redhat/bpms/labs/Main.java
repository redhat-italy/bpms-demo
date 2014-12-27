package it.redhat.bpms.labs;

import org.kie.api.KieServices;
import org.kie.api.builder.ReleaseId;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {

    Logger logger = LoggerFactory.getLogger("it.redhat.bpms.labs");

	public static void main(String[] args) {
		new Main().execute();
	}

    private void execute() {
        logger.info("============================================================");
        logger.info("==== starting Lab 3 ========================================");
        KieServices kieServices = KieServices.Factory.get();

        /*
            Since a KIE project is also a Maven project the groupId, artifactId and version declared in the pom.xml
            are also used to generate a ReleaseId that uniquely identifies the project itself.
             This allows creation of a new KIE Container from project simply passing it to the KIE Services.
         */

        ReleaseId id = kieServices.newReleaseId("it.redhat.bpms.labs", "processwithrules", "1.0.0-SNAPSHOT");

        logger.info("====> Pulling definitions from Maven repo.");
        KieContainer kieContainer = kieServices.newKieContainer(id);
        logger.info("====> Creating KIE Session.");
        KieSession kieSession = kieContainer.newKieSession("ksession");

        logger.info("====> Starting process...");
        kieSession.startProcess("processwithrules");

        kieSession.dispose();

        logger.info("==== END of Lab 3 ==========================================");
        logger.info("============================================================");
    }

}