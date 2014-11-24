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

    <h2>Review Orders</h2>

    <p class="lead">Below you will find the list of your orders.</p>

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
        $('#TBL_list tr').click(function() {
            var href = $(this).find("a").attr("href");
            alert('process instance ID: ' + href);
        }).find('a').hover( function() {
            $(this).parents('tr').unbind('click');
        });
        $.ajax({
            url:'/provisioning/rs/request/list?filter=<%= principal.getName() %>',
            type: 'GET',
            success: function(json){
                var items = '';

                if(json){
                    for (var i = 0, len = json.length; i < len; ++i) {
                        items += '<tr><td>' + json[i][0] + '</td><td>' + json[i][1] + '</td><td>' + json[i][2] + '</td><td><a href=' + json[i][1] + '>Edit</a></td>';
                    }
                }

                $("#TBL_list").append(items);
            }
        })
    });
</script>

</body>
</html>