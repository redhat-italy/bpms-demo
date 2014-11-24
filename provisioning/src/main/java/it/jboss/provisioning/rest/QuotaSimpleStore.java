package it.jboss.provisioning.rest;

import java.util.Hashtable;
import java.util.Map;

public class QuotaSimpleStore {
    private static QuotaSimpleStore theInstance;
    private Map<String,Integer> quotas;

    private QuotaSimpleStore() {
        quotas = new Hashtable<String, Integer>();
    }

    public static synchronized QuotaSimpleStore getInstance(){
        if( theInstance == null ){
            theInstance = new QuotaSimpleStore();
        }
        return theInstance;
    }

    public synchronized void addQuota(String user, int quota){
        if(quotas.containsKey(user)){
            Integer newQuota = new Integer(quotas.get(user).intValue() + quota);
            quotas.put(user,newQuota);
        } else {
            quotas.put(user,new Integer(quota));
        }
    }

    public int getQuota(String user){
        if(quotas.containsKey(user)){
            return quotas.get(user).intValue();
        } else {
            return 0;
        }
    }
}
