# JBoss BPM Suite 6 Hands On Labs
=========

A series of labs to be used for self learning of the platform.

## BASIC
---------

This lab is the very first learning step, it's a tipical "Hello World" application, it's a rule and a Main that executes the rule.
The lab uses an object of type *Person*, if you look at the Main source code you can see that it is based on KieServices

'KieServices kieServices = KieServices.Factory.get();'

The second step is to pull artifacts from the repository (in this case the local maven repo, the .m2 dir in the home of the user)
and create the KieContainer.
As you can see a specific version of the artifact is used by creating the UNIQUE id based un groupId, artifactId and version
(the same you specified in pom.xml of the project)

        'ReleaseId id = kieServices.newReleaseId("it.redhat.bpms.labs", "basic", "1.0.0-SNAPSHOT");'
        'KieContainer kieContainer = kieServices.newKieContainer(id);'

Now from the container you can get the KieSession and finally use it to put facts of your application.

Note: this simple lab instantiate a Person object and put it in the knowledge session, the Person Object has a constructor that
randomly sets the age of the Person, so the new instance that you put in the session might be or not more than 18 years old.

To execute the lab just open a shell on your laptop and execute the Main class

        'mvn exec:java -Dexec.mainClass="it.redhat.bpms.labs.Main"'


