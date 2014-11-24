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
                <li class="active"><a href="#">Apply Order</a></li>
                <li><a href="review.jsp">Review Orders</a></li>
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

    <h2>Apply Order</h2>

    <p class="lead">Please specify the size of the hosts you need for your project, enter the number of hosts and the final date of the project. If you need a mix of size please apply multiple forms.</p>

    <form class="form-horizontal" role="form">
        <div class="form-group">
            <div class="col-lg-offset-1">
                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="r1" value="1" checked>
                        Small
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="r2" value="2">
                        Medium
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="optionsRadios" id="r3" value="3">
                        Large
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="number" class="control-label">Number of hosts: </label>
            <div>
                <input type="text" class="form-control" id="number" placeholder="enter number of hosts">
            </div>
        </div>
        <div class="form-group">
            <label for="expireDate" class="control-label">valid to:</label>
            <div>
                <input type="text" class="form-control" id="expireDate" placeholder="dd/mm/yyyy">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button id="BTN_send" type="button" class="btn btn-primary">Apply</button>
            </div>
        </div>
    </form>

</div>

<div class="footer">
    <div class="container">
        <p class="text-muted">Red Hat Italy Professional Services</p>
    </div>
</div>


<div id="postModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">Request Submission</h3>
            </div>
            <div class="modal-body">
                <p class="lead">The request has been successfully submitted.</p>
                <div class="alert alert-info" role="alert"><p id="p_processid" class="lead"></p></div>
                <p class="lead">Use the <i>Review Orders</i> TAB to check the status of the request.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#BTN_send").click(function(){
            var dateString = $('#expireDate').val();

            if(!checkDateFormat(dateString)){
                alert('Date format is invalid. Please correct it and apply again.')
                return;
            }else{
                var date = new Date(dateString);
                var milliseconds = date.getTime();
            }

            var theUrl = '/business-central/rest/runtime/it.jboss.bpmdemo:selfprovisioning:1.0/withvars/process/selfprovisioning.provisioning/start?';
            theUrl = theUrl + 'map_size=s' + $("input:radio[name='optionsRadios']:checked").val();
            theUrl = theUrl + '&map_quantity=s' + $('#number').val();
            theUrl = theUrl + '&map_expire=s' + milliseconds;
            theUrl = theUrl + '&map_customer=' + '<%= principal.getName() %>';
            $.ajax({
                url: theUrl,
                type: 'POST',
                data: {},
                dataType: 'json',
                complete: function(response, status, xhr){
                    //alert(response.responseText);
                    var data = jQuery.parseJSON(response.responseText);
                    $('#p_processid').text( 'Please take note of the ID of the process: ' + data.processInstance.id );
                    //alert(data.processInstance.id);
                    $('#postModal').modal('show');
                }
            })
        });
    });

    function checkDateFormat(date){
        re = /^(\d{1,2})\/(\d{1,2})\/(\d{4})$/;
        if(date.match(re)){
            return true;
        }else{
            return false;
        }
    };

</script>

</body>
</html>