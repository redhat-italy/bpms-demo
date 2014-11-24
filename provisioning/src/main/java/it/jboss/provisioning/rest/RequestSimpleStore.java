package it.jboss.provisioning.rest;

import java.util.*;

public class RequestSimpleStore {
    private static RequestSimpleStore theInstance;
    private Map<String,String> requests;

    private RequestSimpleStore() {
        requests = new Hashtable<String, String>();
    }

    public static synchronized RequestSimpleStore getInstance(){
        if( theInstance == null ){
            theInstance = new RequestSimpleStore();
        }
        return theInstance;
    }

    public synchronized void setStatus(String key, String status){
        requests.put(key, status);
    }

    public List<List<String>> getList(String filter){
        List<List<String>> list = new ArrayList<List<String>>();
        Set<String> keys = requests.keySet();
        for(String key : keys){
            if(filter == null || key.contains(filter)){
                Scanner scanner = new Scanner(key);
                scanner.useDelimiter("_");
                List<String> row = new ArrayList<String>();
                row.add(scanner.next());
                row.add(scanner.next());
                row.add(requests.get(key));
                list.add(row);
            }
        }
        return list;
    }

    public List<List<String>> getList(){
        return this.getList(null);
    }

}