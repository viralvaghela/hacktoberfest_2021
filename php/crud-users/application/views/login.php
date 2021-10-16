<?php $this->load->view('admin/partials/header');?>
</head>

<body class="bg-dark">
  <div class="container-fluid">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
      <?php if(isset($_GET['alert'])){ ?>
        <div class="alert alert-danger alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <?=$_GET['alert']?>
        </div>
      <?php } ?>
        <form action="<?=base_url('auth/cek_login')?>" method="POST">
          <div class="form-group">
            <label for="username">Username</label>
            <input class="form-control" id="username" name="username" type="text" placeholder="Enter username">
            <?php echo form_error('username') ?>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input class="form-control" id="password" name="password" type="password" placeholder="Password">
            <?php echo form_error('password') ?>
          </div>
          <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="<?=base_url('auth/register')?>">Register an Account</a>
        </div>
      </div>
    </div>
  </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

</body>

</html>
