# JBoss BPM Suite 6 Hands On Labs

A series of labs to be used for self learning of the platform.

---------

## Lab 2 PROCESS

The second lab is very similar to Lab 1 with the difference of a simple Business Process.
Looking at the Main class you will find a new statement added to start the process

        'kieSession.startProcess("process");'

The process definition is contained in the file *process.bpmn2* under the *resources* directory (where also the rules file is).
The process definition is very very simple, it just have a Start event, a Script Task (that just logs a text message on console) and an END event.

![process.png](process.png)

As well as Lab 1 to execute the lab 2 just open a shell on your laptop and execute the Main class

        'mvn exec:java -Dexec.mainClass="it.redhat.bpms.labs.Main"'

