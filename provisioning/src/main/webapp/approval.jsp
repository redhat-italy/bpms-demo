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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="provisioning.jsp">Place Order</a></li>
                <li class="active"><a href="#">Review Orders</a></li>
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
        <p class="lead text-right">User: <strong><%= principal.getName() %></strong> | <a href="logout">logout</a></p>
    <%  } %>

    <h2>Orders to be Approved</h2>

    <p class="lead">Below you will find the list of orders that need to be approved.</p>
    <p class="lead">Please select a request and Apply for Approval or Deny.</p>

    <table id="TBL_list" class="table table-striped">
    </table>


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

<script type="text/javascript">
    $(document).ready(function(){
        $.ajax({
            url:'/business-central/rest/task/query?potentialOwner=<%= principal.getName() %>',
            type: 'GET',
            data: {},
            dataType: 'json',
            complete: function(response, status, xhr){
                var items = '';
                var data = jQuery.parseJSON(response.responseText);
                //alert(data.list);
                //alert(data.list.length);

                for (var i = 0, len = data.list.length; i < len; ++i) {
                    items += '<tr><td>task id: ' + data.list[i].id + '</td><td>process id: ' + data.list[i].processInstanceId + '</td><td>' + new Date(data.list[i].createdOn).toUTCString() + '</td>';
                }

                $("#TBL_list").append(items);
            }
        });
    });
</script>

</body>
</html>