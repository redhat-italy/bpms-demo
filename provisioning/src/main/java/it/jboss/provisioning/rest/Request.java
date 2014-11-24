package it.jboss.provisioning.rest;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.logging.Logger;

@Path("/request")
public class Request {
    private static Logger logger = Logger.getLogger("it.jboss.provisioning");

    @GET
    public String getInfo(){
        return "Self Provisioning REST Service - use path: /rs/quota/[username] to get quota of a user.";
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public Response getList(@QueryParam("filter") String filter) {
        logger.info("======= Request list with filter: " + filter + " ==========");
        return Response.status(Response.Status.OK).entity(RequestSimpleStore.getInstance().getList(filter)).build();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/status")
    public Response setStatus(@QueryParam("key") String key, @QueryParam("status") String status) {
        RequestSimpleStore.getInstance().setStatus(key,status);
        logger.info("======= new status for " + key + " is: " + status + " ==========");
        return Response.status(Response.Status.OK).entity("ok").build();
    }

}
