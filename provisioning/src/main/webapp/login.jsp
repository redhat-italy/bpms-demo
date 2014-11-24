<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Self-provisioning System - Login page</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sticky-footer.css" rel="stylesheet">

</head>
<body>

<!-- Begin page content -->
<div class="container">
    <div class="page-header">
        <h1>Self-provisioning System</h1>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-6">

                <form action="j_security_check" method="POST" style="width: 200">
                    <h2 class="form-signin-heading">Please sign in</h2>

                    <input type="username" class="form-control" placeholder="Username" name="j_username" required autofocus>
                    <input type="password" class="form-control" placeholder="Password" name="j_password" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                </form>

            </div>
            <div class="col-md-6">
            </div>
        </div>
     </div>

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