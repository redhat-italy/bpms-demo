package it.jboss.provisioning.rest;

import javax.ws.rs.*;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("/quota")
public class Quota {

    private static Logger logger = Logger.getLogger("it.jboss.provisioning");

    @GET
    public String getInfo(){
        return "Self Provisioning REST Service - use path: /rs/quota/[username] to get quota of a user.";
    }

    @GET
    @Path("/used")
    public Response getQuota(@QueryParam("user") String username) {
        logger.info("======= Requested quota for user: " + username + " ==========");
        return Response.status(Response.Status.OK).entity(QuotaSimpleStore.getInstance().getQuota(username)).build();
    }

    @POST
    @Path("/add")
    public Response setQuota(@QueryParam("user") String username, @QueryParam("quota") String quota) {
        QuotaSimpleStore.getInstance().addQuota(username,Integer.parseInt(quota));
        logger.info("======= Added " + quota + " to quota  for user: " + username + " ==========");
        return Response.status(Response.Status.OK).entity(QuotaSimpleStore.getInstance().getQuota(username)).build();
    }

}
