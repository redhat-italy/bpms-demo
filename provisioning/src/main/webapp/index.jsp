<%@ page import="java.security.Principal" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Self-provisioning System</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sticky-footer.css" rel="stylesheet">

</head>
<body>

<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Self-provisioning System</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <%  if (request.isUserInRole("user")){ %>
                <li><a href="provisioning.jsp">Place Order</a></li>
                <li><a href="review.jsp">Review Orders</a></li>
                <%  } %>
                <%  if (request.isUserInRole("broker")){ %>
                <li><a href="malformed.jsp">Malformed Orders</a></li>
                <%  } %>
                <%  if (request.isUserInRole("manager")){ %>
                <li><a href="approval.jsp">Pending Approvals</a></li>
                <%  } %>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<!-- Begin page content -->
<div class="container">

    <p><br><br></p>

    <div class="page-header">
        <h1>Self-provisioning System</h1>
    </div>

    <% Principal principal = request.getUserPrincipal(); %>
    <%  if (principal != null){ %>
    <p class="lead text-right">Welcome <strong><%= principal.getName() %></strong> | <a href="logout">logout</a></p>
    <%  } %>

    <p class="lead">This is the company web application to be used to order hosts required for development projects.</p>
    <p class="lead">...and of course is a simple demo for <strong>JBoss BPM Suite 6</strong> :-)</p>

    <p class="lead">If you are a <i>developer</i> Apply an <a href="provisioning.jsp">Order Form</a> to start the provisioning business process or <a href="review.jsp">review</a> the status of placed orders.</p>
    <p class="lead">If you are a <i>revisor</i> check for <a href="tasks.jsp">malformed orders</a>.</p>
    <p class="lead">If you are a <i>manager</i> check for <a href="approvals.jsp">orders</a> that need to be approved.</p>

</div>

<div class="footer">
    <div class="container">
        <p class="text-muted">Red Hat Italy Professional Services</p>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>